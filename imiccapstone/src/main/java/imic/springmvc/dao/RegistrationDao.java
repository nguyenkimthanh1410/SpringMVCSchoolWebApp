package imic.springmvc.dao;

import java.util.List;

import imic.springmvc.dto.Registration;

public interface RegistrationDao {
	
    public int insert(Registration registration, String userlogin);
    
    public List<Registration> getAll();
    
    public Registration findById(Long regisId);
    
    public int update(Registration registration, String userlogin);
    
    public int deleteById(Long regisId, String userlogin);    

    public long getMaxId();    
 
}
