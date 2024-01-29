package com.aita.emp;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class JobRole 
{
	private int jobId;
	private String jobRole;
	private int count;
	public int getJobId() {
		return jobId;
	}
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	public String getJobRole() {
		return jobRole;
	}
	public void setJobRole(String jobRole) {
		this.jobRole = jobRole;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "JobRole [jobId=" + jobId + ", jobRole=" + jobRole + ", count=" + count + "]";
	}
	
}
