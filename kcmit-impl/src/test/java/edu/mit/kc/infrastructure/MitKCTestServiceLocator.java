/*
 * Copyright 2005-2014 The Kuali Foundation
 *
 * Licensed under the GNU Affero General Public License, Version 3 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.opensource.org/licenses/ecl2.php
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package edu.mit.kc.infrastructure;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.transaction.jta.JtaTransactionManager;

import javax.sql.DataSource;
import javax.transaction.UserTransaction;

/**
 * Locator that sits on the testharness SpringContext.
 */
public class MitKCTestServiceLocator {

	private static ApplicationContext context;
	
	public static Object getService(String serviceName) {
		return getContext().getBean(serviceName);
	}
	
	public static ApplicationContext getContext() {
		return context;
	}

	public static void setContext(ApplicationContext context) {
		MitKCTestServiceLocator.context = context;
	}	
}
