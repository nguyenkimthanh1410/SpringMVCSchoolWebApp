package imic.springmvc.dao;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import imic.springmvc.dto.Registration;

@Repository(value="registrationDao")
public class RegistrationDaoImpl implements RegistrationDao {

	private JdbcTemplate jdbcTemplate;
	
	public RegistrationDaoImpl() {
	}

	@Autowired 
    public RegistrationDaoImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
	//regisId,userId,sClassId,regisDate,lastUpdated,lastUpdatedBy
	
	//////////////////CREATE
	private static final String QUERY_INSERT_REGISTRATION = 
			"INSERT INTO tblregistration (userId,sClassId,regisDate,lastUpdated,lastUpdatedBy) VALUES (?,?,?,?,?)";
	@Override
	public int insert(Registration registration, String userlogin) {
		int numOfRowAffected = 
				jdbcTemplate.update( QUERY_INSERT_REGISTRATION, 
					new Object[] {registration.getUserId(), registration.getsClassId(), 
							registration.getRegisDate(), new Date(), userlogin});
		
		// set regisId for the newly created object
		registration.setRegisId(queryForIdentity());
		System.out.println("RegistrationDaoImpl says: newly created id=" + queryForIdentity());
		return numOfRowAffected;
	}
	
	private static final String SQL_REGIS_ID = "SELECT MAX(regisId) FROM tblregistration";
	private long queryForIdentity() {		
		return jdbcTemplate.queryForObject(SQL_REGIS_ID, Long.class);
	}
	
	

	////////////////READ ALL
	private static final String QUERY_SELECT_ALL = 
			"SELECT regisId,userId,sClassId,regisDate,lastUpdated,lastUpdatedBy FROM tblregistration ORDER BY regisDate DESC";
	@Override
	public List<Registration> getAll(){	
		List<Registration> registrations = jdbcTemplate.query(QUERY_SELECT_ALL, new RegistrationRowMapper());
		return registrations;
	}
	
	
	////////////////READ BY ID
	private static final String QUERY_FIND_REGISTRATION_BY_ID = 
			"SELECT regisId,userId,sClassId,regisDate,lastUpdated,lastUpdatedBy FROM tblregistration WHERE regisId=?";
	@Override
	public Registration findById(Long regisId){
		Registration registration = jdbcTemplate.queryForObject(QUERY_FIND_REGISTRATION_BY_ID, new Object[] {regisId}, new RegistrationRowMapper());	
		System.out.println("@Dao: " + registration);
		return registration;
	}

	
	///////////////UPDATE BY ID	
	private static final String QUERY_UPDATE_REGISTRATION_BY_ID =
			"UPDATE tblregistration SET userId=?,sClassId=?,regisDate=?,lastUpdated=?,lastUpdatedBy=? WHERE regisId=?";
	@Override
	public int update(Registration registration, String userlogin) {
		int numOfRowAffected = 0;
		if(registration == null){
			return 0;
		}
		if ((registration.getRegisId() != null) && (registration.getRegisId() > 0)) { //regisId already exists			
			numOfRowAffected = 
					jdbcTemplate.update(QUERY_UPDATE_REGISTRATION_BY_ID, 
							new Object[] {registration.getUserId(), registration.getsClassId(), 
									registration.getRegisDate(), new Date(), userlogin, registration.getRegisId()});
		}
		return numOfRowAffected;
	}

	////////////////DELETE BY ID
	private static final String QUERY_DELETE_REGISTRATION_BY_ID = "DELETE from tblregistration WHERE regisId=?";
	@Override
	public int deleteById(Long regisId, String userlogin){
		int numOfRowAffected = jdbcTemplate.update(QUERY_DELETE_REGISTRATION_BY_ID, regisId);
		System.out.println(String.format("%s is deleted by %s", regisId, userlogin));
		return numOfRowAffected;
	}
	
		
	////////////////GET REGIS MAX ID
	private static final String QUERY_SELECT_MAXID = "SELECT MAX(regisId) AS maxId FROM tblregistration";
	@Override
	public long getMaxId() {
		return jdbcTemplate.queryForObject(QUERY_SELECT_MAXID, Long.class);
	}	

}
