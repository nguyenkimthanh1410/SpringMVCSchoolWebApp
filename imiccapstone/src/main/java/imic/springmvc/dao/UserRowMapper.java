package imic.springmvc.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import imic.springmvc.dto.User;
/**
 * for mapping result set data to a domain object
 */
public class UserRowMapper implements RowMapper<User> {
	
	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User user = new User();
		user.setUserId(rs.getLong("userId"));
		user.setUserName(rs.getString("userName"));
		user.setPassword(rs.getString("password"));
		user.setFirstName(rs.getString("firstName"));
		user.setLastName(rs.getString("lastName"));
		user.setGender(rs.getInt("gender"));
		user.setDob(rs.getDate("dob"));
		user.setActive(rs.getInt("active"));
		user.setEmail(rs.getString("email"));
		user.setMobile(rs.getString("mobile"));
		user.setAddress(rs.getString("address"));
		user.setRole(rs.getInt("role"));
		user.setLastUpdated(rs.getDate("lastUpdated"));
		user.setLastUpdatedBy(rs.getString("lastUpdatedBy"));
		return user;	
	}	
}
