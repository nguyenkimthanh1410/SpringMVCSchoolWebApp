package imic.springmvc.dto;

import java.util.Date;

public class SClass {	

	private Long sClassId;

	private String sClassName;

	private Date startDate;
	
	private Date endDate;
	
	private Long teacherId;
	
	private Date lastUpdated;
	
	private String lastUpdatedBy;

	public Long getsClassId() {
		return sClassId;
	}

	public void setsClassId(Long sClassId) {
		this.sClassId = sClassId;
	}

	public String getsClassName() {
		return sClassName;
	}

	public void setsClassName(String sClassName) {
		this.sClassName = sClassName;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Long getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Long teacherId) {
		this.teacherId = teacherId;
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
		return "SClass [sClassId=" + sClassId + ", sClassName=" + sClassName + ", startDate=" + startDate + ", endDate="
				+ endDate + ", teacherId=" + teacherId + ", lastUpdated=" + lastUpdated + ", lastUpdatedBy="
				+ lastUpdatedBy + "]";
	}

	

	
}
