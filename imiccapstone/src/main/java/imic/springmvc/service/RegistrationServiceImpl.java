package imic.springmvc.service;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import imic.springmvc.dao.RegistrationDao;
import imic.springmvc.dto.Registration;

@Repository(value="registrationService")
public class RegistrationServiceImpl implements RegistrationService {

	private RegistrationDao registrationDao;
	
	public RegistrationServiceImpl() {
	}

	@Autowired 
    public RegistrationServiceImpl(RegistrationDao registrationDao) {
        this.registrationDao = registrationDao;
    }
	
	@Override
	public int insert(Registration registration, String userlogin) {
		return registrationDao.insert(registration, userlogin);
	}
	
	@Override
	public List<Registration> getAll() {		
		return registrationDao.getAll();
	}

	@Override
	public Registration findById(Long regisId) {		
		return registrationDao.findById(regisId);
	}

	@Override
	public int update(Registration registration, String userlogin) {
		return registrationDao.update(registration, userlogin);
	}
	
	@Override
	public int deleteById(Long regisId, String userlogin) {		
		return registrationDao.deleteById(regisId, userlogin);
	}

	
	@Override
	public long getMaxId() {
		return registrationDao.getMaxId();
	}

	@Override
	public Registration createEmptyRegistration(String userlogin) {		
		// Create an empty registration
		Registration registration = new Registration();
		//registration.setRegisId(null);
		registration.setUserId(null);
		registration.setsClassId(null);
		registration.setRegisDate(new Date());
		registration.setLastUpdated(new Date());
		registration.setLastUpdatedBy(userlogin);				
		return registration;
	}

	
}
