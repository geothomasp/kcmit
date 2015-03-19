/*
 * Kuali Coeus, a comprehensive research administration system for higher education.
 *
 * Copyright 2005-2015 Kuali, Inc.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package co.kuali.coeus.sys.impl.persistence;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kuali.coeus.sys.framework.gv.GlobalVariableService;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.rice.core.api.config.property.ConfigurationService;
import org.kuali.rice.kim.api.KimConstants;
import org.kuali.rice.kim.api.permission.PermissionService;
import org.kuali.rice.krad.UserSession;
import org.kuali.rice.krad.util.KRADConstants;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * This filter generates html pages using schemaspy.  It only supports mysql.
 */
public class SchemaSpyFilter implements Filter {

    private static final Log LOG = LogFactory.getLog(SchemaSpyFilter.class);

    private static final Pattern MYSQL_DB_URL_PATTERN = Pattern.compile("(jdbc:mysql://)(.*)(:)(\\d*)(/)(.*)");
    private static final String DB_TYPE_FLAG = "-t";
    private static final String MYSQL_DB_TYPE = "mysql";
    private static final String DB_HOST_FLAG = "-host";
    private static final String DB_PORT_FLAG = "-port";
    private static final String DP_DRIVER_LOCATION_FLAG = "-dp";
    private static final String DB_NAME_FLAG = "-db";
    private static final String DB_USER_FLAG = "-u";
    private static final String DB_PASSWORD_FLAG = "-p";
    private static final String OUTPUT_DIR_FLAG = "-o";
    private static final String SCHEMASPY_DIR_NAME = "schemaspy";
    private static final String MYSQL_DRIVER_CONFIG_PARAM = "datasource.driver.name.MySQL";
    private static final String KIM_SCHEMA_SPY_VIEW_ID = "schemaspy";
    private static final String LOGLEVEL_FLAG = "-loglevel";
    private static final String FINEST_LEVEL = "finest";
    private static final String CONFIG_LEVEL = "config";
    private static final String INFO_LEVEL = "info";
    private static final String WARNING_LEVEL = "warning";
    private static final String SEVERE_LEVEL = "severe";
    private static final String REFRESH_PARAM = "refresh";
    private static final String REFRESH_TRUE = "true";
    private static final String LOW_QUALITY_FLAG = "-lq";
    private static final String NO_ADS_FLAG = "-noads";
    private static final String FORMAT_FLAG = "-format";
    private static final String SVG_FORMAT = "svg";
    private static final String RENDERER_FLAG = "-renderer";
    private static final String NO_RENDERER = "";
    private static final String SCHEMA_SPY_CONFIG_PARAM = "kc.schemaspy.enabled";

    private FilterConfig filterConfig;
    private ConfigurationService configurationService;
    private PermissionService permissionService;
    private GlobalVariableService globalVariableService;
    private Object schemaAnalyzer;

    private final AtomicBoolean initialized = new AtomicBoolean(false);
    private final Runnable refreshSchemaSpy = new Runnable() {
        @Override
        public void run() {
            if (getConfigurationService().getPropertyValueAsBoolean(SCHEMA_SPY_CONFIG_PARAM)) {
                LOG.info("Refresh SchemaSpy Started");

                initialized.set(false);

                deleteSchemaSpyContent();
                final String[] args = createArgs().toArray(new String[]{});
                try {
                    final Class<?> configClass = Class.forName("net.sourceforge.schemaspy.Config");
                    final Constructor configCtor = configClass.getConstructor(String[].class);
                    //this Object cast forces it to pass the array as a single argument rather
                    //than the multi-arg, var-args version
                    final Object config = configCtor.newInstance((Object) args);
                    final Method analyze = getSchemaAnalyzer().getClass().getMethod("analyze", configClass);
                    analyze.invoke(getSchemaAnalyzer(), config);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                initialized.set(true);

                LOG.info("Refresh SchemaSpy Completed");
            }
        }
    };


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
        Executors.newSingleThreadExecutor().execute(refreshSchemaSpy);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        final UserSession session = getGlobalVariableService().getUserSession();
        if (session != null && !getPermissionService().isAuthorizedByTemplate(getGlobalVariableService().getUserSession().getPrincipalId(),
                KRADConstants.KRAD_NAMESPACE,
                KimConstants.PermissionTemplateNames.OPEN_VIEW,
                Collections.singletonMap(KimConstants.AttributeConstants.VIEW_ID, KIM_SCHEMA_SPY_VIEW_ID),
                Collections.<String, String>emptyMap())) {
            ((HttpServletResponse) response).sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        if (!getConfigurationService().getPropertyValueAsBoolean(SCHEMA_SPY_CONFIG_PARAM)) {
            disableCache((HttpServletResponse) response);
            response.getWriter().write("SchemaSpy has been disabled.");
            return;
        }

        synchronized (initialized) {
            if (REFRESH_TRUE.equals(request.getParameter(REFRESH_PARAM)) && initialized.get()) {
                Executors.newSingleThreadExecutor().execute(refreshSchemaSpy);
            }

            if (!initialized.get()) {
                disableCache((HttpServletResponse) response);
                response.getWriter().write("Please wait. SchemaSpy is still processing.");
                return;
            }
        }

        chain.doFilter(request, response);
    }

    private void disableCache(HttpServletResponse response) {
        response.setHeader("Expires", "-1");
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
    }

    private List<String> createArgs() {
        final List<String> args = new ArrayList<>();

        final String dbUrl = getConfigurationService().getPropertyValueAsString(org.kuali.rice.core.api.config.property.Config.DATASOURCE_URL);

        args.add(DB_TYPE_FLAG);
        args.add(MYSQL_DB_TYPE);
        args.add(DB_HOST_FLAG);
        args.add(parseHost(dbUrl));
        args.add(DB_PORT_FLAG);
        args.add(parsePort(dbUrl));
        args.add(DP_DRIVER_LOCATION_FLAG);
        try {
            args.add(Class.forName(getConfigurationService().getPropertyValueAsString(MYSQL_DRIVER_CONFIG_PARAM)).getProtectionDomain().getCodeSource().getLocation().getPath());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        args.add(DB_NAME_FLAG);
        args.add(parseDatabase(dbUrl));
        args.add(DB_USER_FLAG);
        args.add(getConfigurationService().getPropertyValueAsString(org.kuali.rice.core.api.config.property.Config.DATASOURCE_USERNAME));
        args.add(DB_PASSWORD_FLAG);
        args.add(getConfigurationService().getPropertyValueAsString(org.kuali.rice.core.api.config.property.Config.DATASOURCE_PASSWORD));
        args.add(OUTPUT_DIR_FLAG);
        args.add(getSchemaSpyPath().toString());
        args.add(LOGLEVEL_FLAG);
        if (LOG.isTraceEnabled()) {
            args.add(FINEST_LEVEL);
        } else if (LOG.isDebugEnabled()) {
            args.add(CONFIG_LEVEL);
        } else if (LOG.isInfoEnabled()) {
            args.add(INFO_LEVEL);
        } else if (LOG.isWarnEnabled()) {
            args.add(WARNING_LEVEL);
        } else {
            args.add(SEVERE_LEVEL);
        }
        //high quality images take a long time to generate
        args.add(LOW_QUALITY_FLAG);
        args.add(NO_ADS_FLAG);

        //due to our large schema, dot never completes using png format
        //http://sourceforge.net/p/schemaspy/bugs/174/
        args.add(FORMAT_FLAG);
        args.add(SVG_FORMAT);
        args.add(RENDERER_FLAG);
        args.add(NO_RENDERER);
        return args;
    }

    private String parseHost(String url) {
        Matcher m = MYSQL_DB_URL_PATTERN.matcher(url);
        if (m.matches()) {
            return m.group(2);
        }
        return null;
    }

    private static String parsePort(String url) {
        Matcher m = MYSQL_DB_URL_PATTERN.matcher(url);
        if (m.matches()) {
            return m.group(4);
        }
        return null;
    }

    private static String parseDatabase(String url) {
        Matcher m = MYSQL_DB_URL_PATTERN.matcher(url);
        if (m.matches()) {
            return m.group(6);
        }
        return null;
    }

    private Path getSchemaSpyPath() {
        return Paths.get(filterConfig.getServletContext().getRealPath(File.separator), SCHEMASPY_DIR_NAME);
    }

    private void deleteSchemaSpyContent() {
        if (Files.exists(getSchemaSpyPath())) {
            try {
                FileUtils.forceDelete(getSchemaSpyPath().toFile());
            } catch (IOException e) {
                LOG.warn(e.getMessage(), e);
            }
        }
    }

    @Override
    public void destroy() {
        deleteSchemaSpyContent();
        filterConfig = null;
    }

    public ConfigurationService getConfigurationService() {
        if (configurationService == null) {
            configurationService = KcServiceLocator.getService(ConfigurationService.class);
        }

        return configurationService;
    }

    public Object getSchemaAnalyzer() {
        if (schemaAnalyzer == null) {
            schemaAnalyzer = KcServiceLocator.getService("schemaAnalyzer");
        }

        return schemaAnalyzer;
    }

    public PermissionService getPermissionService() {
        if (permissionService == null) {
            permissionService = KcServiceLocator.getService(PermissionService.class);
        }

        return permissionService;
    }

    public GlobalVariableService getGlobalVariableService() {
        if (globalVariableService == null) {
            globalVariableService = KcServiceLocator.getService(GlobalVariableService.class);
        }

        return globalVariableService;
    }
}
