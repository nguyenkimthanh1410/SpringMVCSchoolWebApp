package imic.springmvc.dto;

import java.util.Date;

public class Registration {
	private Long regisId;
	
	private Long userId;
	
	private Long sClassId;
	
	private Date regisDate;	
	
	private Date lastUpdated;
	
	private String lastUpdatedBy;

	public Long getRegisId() {
		return regisId;
	}

	public void setRegisId(Long regisId) {
		this.regisId = regisId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getsClassId() {
		return sClassId;
	}

	public void setsClassId(Long sClassId) {
		this.sClassId = sClassId;
	}

	public Date getRegisDate() {
		return regisDate;
	}

	public void setRegisDate(Date regisDate) {
		this.regisDate = regisDate;
	}

	public Date getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public String getLastUpdatedBy() {
		return lastUpdatedBy;
	}

	public void setLastUpdatedBy(String lastUpdatedBy) {
		this.lastUpdatedBy = lastUpdatedBy;
	}

	@Override
	public String toString() {
		return "Registration [regisId=" + regisId + ", userId=" + userId + ", sClassId=" + sClassId + ", regisDate="
				+ regisDate + ", lastUpdated=" + lastUpdated + ", lastUpdatedBy=" + lastUpdatedBy + "]";
	}	
	
}
