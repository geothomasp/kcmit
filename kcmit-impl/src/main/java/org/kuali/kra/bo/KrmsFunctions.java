package org.kuali.kra.bo;


import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.kuali.rice.krad.bo.PersistableBusinessObjectBase;

@Entity
@Table(name = "KRMS_FUNC_T")
public class KrmsFunctions extends PersistableBusinessObjectBase {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "FUNC_ID")
    private String functionId;

    @Column(name = "NMSPC_CD")
    private String namespaceCode;

    @Column(name = "NM")
    private String namespace;

    @Column(name = "DESC_TXT")
    private String description;

    @Column(name = "TYP_ID")
    private String typeId;
    
    @Column(name = "ACTV")
    private String active;
    
    @Column(name = "RTRN_TYP")
    private String returnType;
    
    @Column(name = "VER_NBR")
    private String versionNo;
    
    private List<KrmsFunctionsParams> krmsFunctionsParams;
    
    public List<KrmsFunctionsParams> getKrmsFunctionsParams() {
		return krmsFunctionsParams;
	}

	public void setKrmsFunctionsParams(List<KrmsFunctionsParams> krmsFunctionsParams) {
		this.krmsFunctionsParams = krmsFunctionsParams;
	}

	public String getFunctionId() {
        return functionId;
    }

    public void setFunctionId(String functionId) {
        this.functionId = functionId;
    }

    public String getNamespaceCode() {
        return namespaceCode;
    }

    public void setNamespaceCode(String namespaceCode) {
        this.namespaceCode = namespaceCode;
    }

    public String getNamespace() {
        return namespace;
    }

    public void setNamespace(String namespace) {
        this.namespace = namespace;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getReturnType() {
		return returnType;
	}

	public void setReturnType(String returnType) {
		this.returnType = returnType;
	}

	public String getVersionNo() {
		return versionNo;
	}

	public void setVersionNo(String versionNo) {
		this.versionNo = versionNo;
	}
}
