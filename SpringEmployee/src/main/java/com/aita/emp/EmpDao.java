package com.aita.emp;

import java.util.List;

public interface EmpDao 
{
	public void store(Employee emp);

	public void add(Skills skill);


	public Employee loginEmp(String eId, String password);

	public List<Skills> view(String eId);

	public void editSkill(Integer id, Skills skill);

	public void deleteSkill(Integer id, Skills skill);

	public List<JobRole> getJob(JobRole job);

	public void viewEmp(String eId,Employee emp);

	public List<JobRole> jobDetails(JobRole job);

	public List<Employee> getJobEmp(String eId,Employee emp);

	public void forget(String emailId, Employee employee);

	public List<Employee> getAllEmployee();

	
	
	
	//public void login(Employee emp);
	//List<Employee> getAll();
}
