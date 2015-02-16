package edu.mit.kc.bo;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import org.kuali.coeus.sys.framework.model.KcPersistableBusinessObjectBase;

/**
 * This class is only for PiAppointemnetType lookup
 */

@Entity
@Table(name = "SHARED_DOCUMENT_TYPE")
public final class SharedDocumentType extends  KcPersistableBusinessObjectBase {
	
    @Id
    @Column(name = "SHARED_DOCUMENT_TYPE_ID")
    private Integer sharedDocumentTypeId;
    
    @Column(name = "COEUS_MODULE_CODE")
    private Integer moduleCode;

    @Column(name = "DOCUMENT_TYPE_CODE")
    private Integer documentTypeCode;

	public Integer getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(Integer moduleCode) {
		this.moduleCode = moduleCode;
	}

	public Integer getDocumentTypeCode() {
		return documentTypeCode;
	}

	public void setDocumentTypeCode(Integer documentTypeCode) {
		this.documentTypeCode = documentTypeCode;
	}

	public Integer getSharedDocumentTypeId() {
		return sharedDocumentTypeId;
	}

	public void setSharedDocumentTypeId(Integer sharedDocumentTypeId) {
		this.sharedDocumentTypeId = sharedDocumentTypeId;
	}

	
}

    
 