package edu.mit.kc.dashboard.bo;

import org.apache.commons.lang3.StringUtils;
import org.kuali.coeus.sys.framework.model.KcPersistableBusinessObjectBase;
import org.kuali.rice.krad.data.jpa.PortableSequenceGenerator;

import javax.persistence.*;

@Entity
@Table(name = "DASH_BOARD_MENU_ITEMS")
public class DashboardMenuItem extends KcPersistableBusinessObjectBase {
    @PortableSequenceGenerator(name = "SEQ_DASH_BOARD_MENU_ITEM_ID")
    @GeneratedValue(generator = "SEQ_DASH_BOARD_MENU_ITEM_ID")
	@Id
	@Column(name = "DASH_BOARD_MENU_ITEM_ID")
    private String id;

    @Column(name = "MENU_ITEM")
    private String menuItem;

    @Column(name = "MENU_ACTION")
    private String menuAction;

    @Column(name = "OSP_ONLY_FLAG")
    private String ospOnlyFlag;

    @Column(name = "ACTIVE")
    private String active;

    @Transient
    private String menuItemFormatted;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMenuItemFormatted() {
        if (StringUtils.isNotBlank(menuItem)) {
            if (ospOnlyFlag.equals("Y")) {
                menuItemFormatted = menuItem + "<span class='osp-ind'>(OSP)</span>";
            } else {
                menuItemFormatted = menuItem;
            }
        }

        return menuItemFormatted;
    }

    public void setMenuItemFormatted(String menuItemFormatted) {
        this.menuItemFormatted = menuItemFormatted;
    }

    public String getMenuItem() {
        return menuItem;
    }

    public void setMenuItem(String menuItem) {
        this.menuItem = menuItem;
    }

    public String getMenuAction() {
        return menuAction;
    }

    public void setMenuAction(String menuAction) {
        this.menuAction = menuAction;
    }

    public String getOspOnlyFlag() {
        return ospOnlyFlag;
    }

    public void setOspOnlyFlag(String ospOnlyFlag) {
        this.ospOnlyFlag = ospOnlyFlag;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }
}
