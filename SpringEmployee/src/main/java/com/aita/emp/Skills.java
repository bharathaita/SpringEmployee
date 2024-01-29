package com.aita.emp;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Skills 
{
	private int Id;
	private String skillName;
	private int skillLevel;
	private int empId;
	
	public Skills() 
	 {
		super();
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getSkillName() {
		return skillName;
	}
	public void setSkillName(String skillName) {
		this.skillName = skillName;
	}
	public int getSkillLevel() {
		return skillLevel;
	}
	public void setSkillLevel(int i) {
		this.skillLevel = i;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int i) {
		this.empId = i;
	}
	@Override
	public String toString() {
		return "Skills [Id=" + Id + ", skillName=" + skillName + ", skillLevel=" + skillLevel + ", empId=" + empId + "]";
	}
	
}
