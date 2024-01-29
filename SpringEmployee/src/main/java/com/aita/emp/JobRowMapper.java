package com.aita.emp;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class JobRowMapper implements RowMapper<JobRole>
{

	public JobRole mapRow(ResultSet rs, int rowNum) throws SQLException 
	{
		JobRole job = new JobRole();
		job.setJobId(rs.getInt("jobId"));
		job.setJobRole(rs.getString("jobRole"));
		job.setCount(rs.getInt("count"));
		return job;
	}

}