package imic.springmvc.service;

import java.util.List;

import imic.springmvc.dto.Registration;

public interface RegistrationService {	
	    
	 public int insert(Registration registration, String userlogin);
	
	 public List<Registration> getAll();
	 
	 public Registration findById(Long regisId);
	    
	 public int update(Registration registration, String userlogin);
	    
	 public int deleteById(Long regisId, String userlogin);    
	
	 public long getMaxId();

	Registration createEmptyRegistration(String userlogin);         
}
