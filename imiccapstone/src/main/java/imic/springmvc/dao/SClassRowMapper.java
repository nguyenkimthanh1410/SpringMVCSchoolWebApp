package imic.springmvc.dao;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import imic.springmvc.dto.SClass;

/**
 * for mapping result set data to a domain object
 */
public class SClassRowMapper implements RowMapper<SClass> {

	@Override
	public SClass mapRow(ResultSet rs, int rowNum) throws SQLException {
		SClass sClass = new SClass();
		sClass.setsClassId(rs.getLong("sClassId"));
		sClass.setsClassName(rs.getString("sClassName"));
		sClass.setStartDate(rs.getDate("startDate"));
		sClass.setEndDate(rs.getDate("endDate"));
		sClass.setTeacherId(rs.getLong("teacherId"));
		sClass.setLastUpdated(rs.getDate("lastUpdated"));
		sClass.setLastUpdatedBy(rs.getString("lastUpdatedBy"));
		return sClass;	
	}
}
