package com.aita.emp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class EmpServiceImpl implements EmpService
{
	@Autowired
	private EmpDao empDao;
	
	public void store(Employee emp) 
	{
		empDao.store(emp);
	}


	public void add(Skills skill) 
	{
		empDao.add(skill);
	}


	public Employee loginEmp(String eId, String password) 
	{
		return empDao.loginEmp(eId,password);
	}

	public List<Skills> view(String eId) 
	{
		return empDao.view(eId);
		
	}

	public void editSkill(Integer id,Skills skill) 
	{
		empDao.editSkill(id,skill);
	}

	public void deleteSkill(Integer id, Skills skill) 
	{
		empDao.deleteSkill(id,skill);
	}

	public List<JobRole> getJob(JobRole job) 
	{
		return empDao.getJob(job);
		 
	}


	public Employee viewEmp(String eId,Employee emp) 
	{
		empDao.viewEmp(eId,emp);
		return null;
	
	}


	public List<JobRole> jobDetails(JobRole job) 
	{
		
		return empDao.jobDetails(job); 
	}


	public List<Employee> getJobEmp(String eId, Employee emp) 
	{
		return empDao.getJobEmp(eId,emp);
	}


	public void forget(String emailId, Employee emp) 
	{
		empDao.forget(emailId,emp);
		
	}


	public List<Employee> getAllEmployee() 
	{
		return empDao.getAllEmployee();
	}

//	public void login(Employee emp) 
//	{
//		empDao.login(emp);
//		
//	}

	

	

}
