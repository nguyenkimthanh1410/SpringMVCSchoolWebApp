package imic.springmvc.dao;

import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import imic.springmvc.dto.SClass;

@Repository(value="sClassDao")
public class SClassDaoImpl implements SClassDao {

	private JdbcTemplate jdbcTemplate;
	
	public SClassDaoImpl() {
	}

	@Autowired 
    public SClassDaoImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
	
	//////////////////CREATE
	private static final String QUERY_INSERT_SCLASS = 
			"INSERT INTO tblClass (sClassName, startDate, endDate, teacherId, lastUpdated, lastUpdatedBy) VALUES (?,?,?,?,?,?)";

	public int insert(SClass sClass, String userlogin) {
		int numOfRowAffected = 
				jdbcTemplate.update( QUERY_INSERT_SCLASS, 
					new Object[] {sClass.getsClassName(), sClass.getStartDate(), sClass.getEndDate(),
									sClass.getTeacherId(), new Date(), userlogin});
		
		// set userId for the newly created object
		sClass.setsClassId(queryForIdentity());
		System.out.println("SClassDaoImpl says: newly created id=" + queryForIdentity());
		return numOfRowAffected;
	}
	
	private static final String SQL_SCLASS_ID = "SELECT MAX(sClassId) FROM tblClass";
	private long queryForIdentity() {		
		return jdbcTemplate.queryForObject(SQL_SCLASS_ID, Long.class);
	}
	
	

	////////////////READ ALL
	private static final String QUERY_SELECT_ALL = 
			"SELECT sClassId, sClassName, startDate, endDate, teacherId, lastUpdated, lastUpdatedBy FROM tblClass ORDER BY startDate DESC ";
	@Override
	public List<SClass> getAll(){	
		List<SClass> sClasses = jdbcTemplate.query(QUERY_SELECT_ALL, new SClassRowMapper());		
		return sClasses;
	}
	
	
	////////////////READ BY ID
	private static final String QUERY_FIND_SCLASS_BY_ID = 
			"SELECT sClassId, sClassName, startDate, endDate, teacherId, lastUpdated, lastUpdatedBy FROM tblClass where sClassId=?";
	@Override
	public SClass findById(Long classId){
		SClass sClass = jdbcTemplate.queryForObject(QUERY_FIND_SCLASS_BY_ID, new Object[] {classId}, new SClassRowMapper());	
		System.out.println("@Dao: " + sClass);
		return sClass;
	}

	
	///////////////UPDATE BY ID	
	private static final String QUERY_UPDATE_SCLASS_BY_ID =
			"UPDATE tblClass SET sClassName=?, startDate=?, endDate=?, teacherId=?, lastUpdated=?, lastUpdatedBy=? where sClassId=?";
	@Override
	public int update(SClass sClass, String userlogin) {
		int numOfRowAffected = 0;
		if(sClass == null){
			return 0;
		}
		if ((sClass.getsClassId() != null) && (sClass.getsClassId() > 0)) { //classId already exists			
			numOfRowAffected = 
					jdbcTemplate.update(QUERY_UPDATE_SCLASS_BY_ID, 
							new Object[] {sClass.getsClassName(), sClass.getStartDate(), sClass.getEndDate(), 
											sClass.getTeacherId(), sClass.getLastUpdated(), sClass.getLastUpdatedBy(), sClass.getsClassId()});
		}
		return numOfRowAffected;
	}

	////////////////DELETE BY ID
	private static final String QUERY_DELETE_SCLASS_BY_ID = "DELETE from tblClass WHERE sClassId=?";
	@Override
	public int deleteById(Long sClassId, String userlogin){
		int numOfRowAffected = jdbcTemplate.update(QUERY_DELETE_SCLASS_BY_ID, sClassId);
		System.out.println(String.format("%s is deleted by %s", sClassId, userlogin));
		return numOfRowAffected;
	}
	
	
	////////////////GET USER MAX ID
	private static final String QUERY_SELECT_MAXID = "SELECT MAX(sClassId) AS maxId FROM tblClass";
	@Override
	public long getMaxId() {
		return jdbcTemplate.queryForObject(QUERY_SELECT_MAXID, Long.class);
	}

	//////////////GET LIST IDS
	private static final String QUERY_SELCT_IDS = "SELECT DISTINCT sClassId FROM tblClass";
	@Override
	public List<Long> getListSclassIds() {
		List<Long> ids = jdbcTemplate.queryForList(QUERY_SELCT_IDS, Long.class);
		return ids;
		
	}
}
