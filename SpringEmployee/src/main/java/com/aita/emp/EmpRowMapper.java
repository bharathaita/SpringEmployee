package com.aita.emp;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class EmpRowMapper implements RowMapper<Employee>
{

	public Employee mapRow(ResultSet rs, int rowNum) throws SQLException 
	{
		Employee emp = new Employee();
		emp.setId(rs.getInt("id"));
		emp.setFullName(rs.getString("fullName"));
		emp.setEmailId(rs.getString("emailId"));
		emp.setEmpId(rs.getString("empId"));
		emp.setJobId(rs.getInt("jobId"));
		emp.setPassword(rs.getString("password"));
		
		return emp;
	}
	
}
