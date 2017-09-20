package imic.springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import imic.springmvc.dto.Registration;


/**
 * for mapping result set data to a domain object
 */
public class RegistrationRowMapper implements RowMapper<Registration> {
	@Override
	public Registration mapRow(ResultSet rs, int rowNum) throws SQLException {
		Registration regis = new Registration();
		regis.setRegisId(rs.getLong("regisId"));
		regis.setUserId(rs.getLong("userId"));
		regis.setsClassId(rs.getLong("sClassId"));
		regis.setRegisDate(rs.getDate("regisDate"));
		regis.setLastUpdated(rs.getDate("lastUpdated"));
		regis.setLastUpdatedBy(rs.getString("lastUpdatedBy"));
		return regis;	
	}
}
