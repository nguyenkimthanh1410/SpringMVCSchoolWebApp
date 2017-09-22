package imic.springmvc.dao;


import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import imic.springmvc.dao.UserDao;
import imic.springmvc.dao.UserRowMapper;
import imic.springmvc.dto.User;

@Repository(value="userDao")
public class UserDaoImpl implements UserDao {

	private JdbcTemplate jdbcTemplate;
	
	public UserDaoImpl() {
	}

	@Autowired 
    public UserDaoImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
	
		
	//////////////////CREATE
	private static final String QUERY_INSERT_USER = 
			"INSERT INTO tblUser (userName,password,firstName,lastName,gender,dob,active,email,mobile, address, role,lastUpdated, lastUpdatedBy)"
					+ " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
	@Override
	public int insert(User user, String userlogin) {
		
		int numOfRowAffected = 
				jdbcTemplate.update( QUERY_INSERT_USER, 
					new Object[] {user.getUserName(), user.getPassword(), user.getFirstName(), user.getLastName(), user.getGender(),
							user.getDob(), user.getActive(), user.getEmail(), user.getMobile(), user.getAddress(), user.getRole(),
							new Date(), userlogin});
		
		// set userId for the newly created object
		user.setUserId(queryForIdentity());
		System.out.println("UserDaoImpl says: newly created id=" + queryForIdentity());
		return numOfRowAffected;
	}
	
	private static final String SQL_USER_ID = "SELECT MAX(userId) FROM tblUser";
	private long queryForIdentity() {		
		return jdbcTemplate.queryForObject(SQL_USER_ID, Long.class);
	}
	
	

	////////////////READ ALL
	private static final String QUERY_SELECT_ALL = 
			"SELECT userId, userName,password,firstName,lastName,gender,dob,active,email,mobile, address, role, lastUpdated, lastUpdatedBy FROM tblUser ORDER BY lastUpdated DESC";
	@Override
	public List<User> getAll(){	
		List<User> users = jdbcTemplate.query(QUERY_SELECT_ALL, new UserRowMapper());			
		/*for (User user : users) {
			System.out.println(user);
		}*/
		return users;
	}
	
	
	////////////////READ BY ID
	private static final String QUERY_FIND_USER_BY_ID = 
			"SELECT userId, userName,password,firstName,lastName,gender,dob,active,email,mobile, address, role, lastUpdated, lastUpdatedBy FROM tblUser WHERE userId=?";
	@Override
	public User findById(Long userId){
		User user = jdbcTemplate.queryForObject(QUERY_FIND_USER_BY_ID, new Object[] {userId}, new UserRowMapper());	
		System.out.println("@Dao: " + user);
		return user;
	}

	
	///////////////UPDATE BY ID	
	private static final String QUERY_UPDATE_USER_BY_ID =
			"UPDATE tblUser SET userName=?, password=?, firstName=?, lastName=?, gender=?, "
			+ "dob=?, active=?, email=?, mobile=?, address=?, role=?, lastUpdated=?, lastUpdatedBy=? WHERE userId=?";
	@Override
	public int update(User user, String userlogin) {
		int numOfRowAffected = 0;
		if(user == null){
			return 0;
		}
		if ((user.getUserId() != null) && (user.getUserId() > 0)) { //userId already exists			
			numOfRowAffected = 
					jdbcTemplate.update(QUERY_UPDATE_USER_BY_ID, 
							new Object[] {user.getUserName(), user.getPassword(), user.getFirstName(), user.getLastName(), user.getGender(),
									user.getDob(), user.getActive(), user.getEmail(), user.getMobile(), user.getAddress(), user.getRole(),
									new Date(), userlogin, user.getUserId()});
		}
		return numOfRowAffected;
	}

	////////////////DELETE BY ID
	private static final String QUERY_DELETE_USER_BY_ID = "DELETE from tblUser WHERE userId=?";
	@Override
	public int deleteById(Long userId, String userlogin){
		int numOfRowAffected = jdbcTemplate.update(QUERY_DELETE_USER_BY_ID, userId);
		System.out.println(String.format("%s is deleted by %s", userId, userlogin));
		return numOfRowAffected;
	}
	
	
	////////////////FIND BY FIRST NAME
	private static final String QUERY_FIND_USER_BY_FIRSTNAME =
			"SELECT userId, userName,password,firstName,lastName,gender,dob,active,email,mobile, address, role, lastUpdated, lastUpdatedBy FROM tblUser WHERE firstName=?";
	@Override
	public List<User> findByFirstName(String firstName){		
		List<User> users = 
				jdbcTemplate.query(QUERY_FIND_USER_BY_FIRSTNAME, new Object[]{firstName}, new UserRowMapper());		
		return users;
	}

	
	////////////////FIND BY LAST NAME
	private static final String QUERY_FIND_USER_BY_LASTNAME =
			"SELECT userId, userName,password,firstName,lastName,gender,dob,active,email,mobile, address, role, lastUpdated, lastUpdatedBy FROM tblUser WHERE lastName=?";
	@Override
	public List<User> findByLastName(String lastName){
		List<User> users = 
				jdbcTemplate.query(QUERY_FIND_USER_BY_LASTNAME, new Object[]{lastName}, new UserRowMapper());		
		return users;
	}
	
	////////////////FIND BY GENDER
	private static final String QUERY_FIND_USER_BY_GENDER =
			"SELECT userId, userName,password,firstName,lastName,gender,dob,active,email,mobile, address, role, lastUpdated, lastUpdatedBy FROM tblUser WHERE gender=?";
	@Override
	public User findByGender(int gender){		
		User user = (User) jdbcTemplate.query(QUERY_FIND_USER_BY_GENDER, new Object[] {gender}, new UserRowMapper());		
		return user;
	}

	////////////////GET USER MAX ID
	private static final String QUERY_SELECT_MAXID = "SELECT MAX(userId) AS maxId FROM tblUser";// same as: SQL_USER_ID 
	@Override
	public long getMaxId() {
		return jdbcTemplate.queryForObject(SQL_USER_ID, Long.class);
	}
	

	private static final String QUERY_SELECT_IDS_BY_ROLE = "SELECT DISTINCT userId FROM tblUser WHERE role=?";
	@Override
	public List<Long> getIdsByRole(int roleId) {
		List<Long> ids = jdbcTemplate.queryForList(QUERY_SELECT_IDS_BY_ROLE, new Object[]{roleId},Long.class);
		System.out.println("userDao: ids = " + ids);
		return ids;		
	}

	private static final String QUERY_SELECT_IDS = "SELECT DISTINCT userId FROM tblUser";
	@Override
	public List<Long> getListUserIds() {
		List<Long> ids = jdbcTemplate.queryForList(QUERY_SELECT_IDS, Long.class);

		return ids;
	}	

}
