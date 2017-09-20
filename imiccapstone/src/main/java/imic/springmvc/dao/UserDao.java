package imic.springmvc.dao;

import java.util.List;

import imic.springmvc.dto.User;

public interface UserDao {
	
    public int insert(User user, String userlogin);//original: boolean
    
    public List<User> getAll();
    
    public User findById(Long userId);
    
    public int update(User user, String userlogin);//original: boolean
    
    public int deleteById(Long userId, String userlogin);
    
    public List<User> findByFirstName(String firstName);

	public List<User> findByLastName(String lastName);  

    public User findByGender(int gender);

    public long getMaxId();

	public List<Long> getIdsByRole(int roleId);

	public List<Long> getListUserIds();    
 
}
