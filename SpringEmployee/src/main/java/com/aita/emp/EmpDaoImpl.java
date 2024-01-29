package com.aita.emp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EmpDaoImpl implements EmpDao
{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<JobRole> getJob(JobRole job) 
	{
		String query = "select * from jobRole";
		List<JobRole> jobRole =  jdbcTemplate.query(query, new JobRowMapper());
		System.out.println("job fetched");
		return jobRole;
	}
	
	public void store(Employee emp) 
	{
		Object[] userParameters = {emp.getId(),emp.getFullName(),emp.getEmailId(),emp.getEmpId(),emp.getJobId(),emp.getPassword()};
		
		String query = "insert into empData(id,fullName,emailId,empId,jobId,password) values(?,?,?,?,?,?)";
		
		jdbcTemplate.update(query, userParameters);
		System.out.println("Record Inserted");
	}


	public void add(Skills skill) 
	{
		Object[] userParameters = {skill.getId(),skill.getSkillName(),skill.getSkillLevel(),skill.getEmpId()};
		
		String query = "insert into skillData(id,skillName,skillLevel,empid) values(?,?,?,?)";
		jdbcTemplate.update(query, userParameters);
		System.out.println("Record Inserted");
		
	}


	public Employee loginEmp(String eId, String password) 
	{
		String empId=null;
		String emailId=null;
		String query=null;
		if(eId.length()<=5)
		{
			empId = eId;
			query = "select * from empData where empId=? and password=?";
		}
		else
		{
			emailId = eId;
			query = "select * from empData where emailId=? and password=?";
		}
		
		Employee emp=jdbcTemplate.queryForObject(query, new EmpRowMapper(), eId,password);
		System.out.println("Logged in");
		return emp;
	}

	public List<Skills> view(String empId) 
	{
		String query = "select * from skillData where empId=?";
		List<Skills> skill = jdbcTemplate.query(query,new SkillRowMapper(), empId);
		System.out.println("Get Skill");
		return skill;
	}

	public void editSkill(Integer id,Skills skill) 
	{
		Object[] userParameters = {skill.getSkillName(),skill.getSkillLevel(),skill.getId()};
		
		String query = "update skillData set skillName=?,skillLevel=? where id=?";
		jdbcTemplate.update(query, userParameters);
		System.out.println("Record Updated");
	}

	public void deleteSkill(Integer id, Skills skill) 
	{
		Object[] userParameters = {skill.getId()};
		
		String query = "delete from skillData where id=?";
		jdbcTemplate.update(query, userParameters);
		System.out.println("Record Deleted");
	}

	public void viewEmp(String empId,Employee emp) 
	{
		Object[] userParameters = {emp.getId()};
		
		String query = "select * from empData where empId=?";
		jdbcTemplate.query(query,new EmpRowMapper());
		System.out.println("Get EmpData");
		
	}

	public List<JobRole> jobDetails(JobRole job) 
	{
		String query = "select count(empdata.jobId) count,jobrole.* from jobrole join empdata on empdata.jobid=jobrole.jobid group by jobrole.jobid";
		List<JobRole> jobRole= jdbcTemplate.query(query, new JobRowMapper());
		//System.out.println(jobRole);
		//System.out.println("Job Details is called");
		return jobRole;
	}

	public List<Employee> getJobEmp(String jobId,Employee emp) 
	{
		String query = "select * from empdata where jobid=?";
		List<Employee> employee= jdbcTemplate.query(query,new Object[]{jobId},new EmpRowMapper());
		return employee;
	}

	public void forget(String emailId, Employee emp) 
	{
		System.out.println("Forgot Pwd Dao impl called");
		
		String query="update empData set password=? where emailId=?";
		int rowsAffected = jdbcTemplate.update(query, emp.getPassword(),emailId);
		System.out.println(emp.getPassword());
		if(rowsAffected>0)
		{
			System.out.println("password is updated");
		}
		else
		{
			System.out.println("password Not updated....Try Again");
		}
		
	}

	public List<Employee> getAllEmployee() 
	{
		String query = "select * from empData";
		List<Employee> employee = jdbcTemplate.query(query, new EmpRowMapper());
		System.out.println("All Employee Data");
		return employee;
	}

	

}
