package com.aita.emp;

import java.util.List;

public interface EmpService 
{
	void store(Employee user);

	

	void add(Skills skill);
	
	Employee loginEmp(String eId, String password);

	List<Skills> view(String eId);

	void editSkill(Integer id, Skills skill);

	void deleteSkill(Integer id, Skills skill);

	List<JobRole> getJob(JobRole job);



	Employee viewEmp(String eId,Employee emp);



	List<JobRole> jobDetails(JobRole job);



	List<Employee> getJobEmp(String eId, Employee emp);



	void forget(String emailId, Employee employee);



	List<Employee> getAllEmployee();

	
	
	//	void login(Employee emp);
	//List<Employee> getAll();

}
