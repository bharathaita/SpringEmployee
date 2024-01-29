package com.aita.emp;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class SkillRowMapper implements RowMapper<Skills>
{

	public Skills mapRow(ResultSet rs, int rowNum) throws SQLException 
	{
		Skills skill = new Skills();
		skill.setId(rs.getInt("id"));
		skill.setSkillName(rs.getString("skillName"));
		skill.setSkillLevel(rs.getInt("skillLevel"));
		skill.setEmpId(rs.getInt("empId"));
		return skill;
	}

}
