package org.kuali.kra.bo;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.kuali.rice.krad.bo.PersistableBusinessObjectBase;

@Entity
@Table(name = "KRMS_FUNC_PARM_T")
public class KrmsFunctionsParams extends PersistableBusinessObjectBase {

	  private static final long serialVersionUID = 1L;
	
	  @Id
      @Column(name = "FUNC_PARM_ID")
      private String functionParamId;
	
	  @Column(name = "NM")
	  private String namespace;
	  
	  @Column(name = "DESC_TXT")
	  private String description;
	  
	  @Column(name = "TYP")
	  private String type;
	  
	  @Column(name = "FUNC_ID")
	  private String functionId;
	  
	  @Column(name = "SEQ_NO")
	  private Integer sequenceNo;
	  
	  @ManyToOne(cascade = { CascadeType.REFRESH })
	  @JoinColumn(name = "FUNC_ID", referencedColumnName = "FUNC_ID", insertable = false, updatable = false)
	  private KrmsFunctions krmsFunction;

	public String getFunctionParamId() {
		return functionParamId;
	}

	public void setFunctionParamId(String functionParamId) {
		this.functionParamId = functionParamId;
	}

	public String getNamespace() {
		return namespace;
	}

	public void setNamespace(String namespace) {
		this.namespace = namespace;
	}

	public KrmsFunctions getKrmsFunction() {
		return krmsFunction;
	}

	public void setKrmsFunction(KrmsFunctions krmsFunction) {
		this.krmsFunction = krmsFunction;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFunctionId() {
		return functionId;
	}

	public void setFunctionId(String functionId) {
		this.functionId = functionId;
	}

	public Integer getSequenceNo() {
		return sequenceNo;
	}

	public void setSequenceNo(Integer sequenceNo) {
		this.sequenceNo = sequenceNo;
	}
}
