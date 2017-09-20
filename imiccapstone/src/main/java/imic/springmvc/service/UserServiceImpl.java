package imic.springmvc.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import imic.springmvc.dao.UserDao;
import imic.springmvc.dto.User;
import imic.springmvc.util.StringPool;

@Repository(value="userService")
public class UserServiceImpl implements UserService {
	private static final String USERNAME_PREFIX = "cs";

	private UserDao userDao;
	
	public UserServiceImpl() {
	}

	@Autowired 
    public UserServiceImpl(UserDao studentDao) {
        this.userDao = studentDao;
    }
	
	@Override
	public int insert(User user, String userlogin) {
		return userDao.insert(user, userlogin);
	}
	
	@Override
	public List<User> getAll() {		
		return userDao.getAll();
	}

	@Override
	public User findById(Long userId) {		
		return userDao.findById(userId);
	}

	@Override
	public int update(User user, String userlogin) {
		return userDao.update(user, userlogin);
	}
	
	@Override
	public int deleteById(Long userId, String userlogin) {		
		return userDao.deleteById(userId, userlogin);
	}

	@Override
	public List<User> findByFirstName(String firstName) {			
		return userDao.findByFirstName(firstName);
	}

	@Override
	public List<User> findByLastName(String lastName) {	
		return userDao.findByLastName(lastName);
	}
	
	@Override
	public User findByGender(int gender) {
		return userDao.findByGender(gender);
	}	
	
	@Override
	public long getMaxId() {
		return userDao.getMaxId();
	}

	@Override
	public User createEmptyUser(String userlogin) {
		// Get max userID
		long maxId = userDao.getMaxId();		
		
		// username of the newly created user: combination of "cs" and (maxId+1)
		String newUsername = USERNAME_PREFIX + (maxId + 1);
		
		// Create an empty user
		User user = new User();		
		user.setUserName(newUsername);
//		user.setPassword(null);
//		user.setFirstName(null);
//		user.setLastName("");
		user.setGender(0);
		user.setDob(new Date());
		user.setActive(Integer.parseInt(StringPool.STATUS_ACTIVE));
//		user.setEmail("");
//		user.setMobile("");
//		user.setAddress("");
		user.setRole(Integer.parseInt(StringPool.STUDENT_ROLE));
		user.setLastUpdated(new Date());
		user.setLastUpdatedBy(userlogin);
				
		return user;
	}

	@Override
	public List<Long> getIdsByRole(int roleId) {
		List<Long> ids = new ArrayList<Long> ();
		ids = userDao.getIdsByRole(roleId);	
		return ids;
	}

	// Better to query from data base, but only restrict to Teacher, Student for "Create user"
	@Override
	public List<Integer> getListRoles() {
		List<Integer> roles = new ArrayList<Integer>(); 
		roles.add(Integer.parseInt(StringPool.ADMIN_ROLE)); // Admin role = 1
		roles.add(Integer.parseInt(StringPool.TEACHER_ROLE)); //Teacher role = 2
		roles.add(Integer.parseInt(StringPool.STUDENT_ROLE));//Student Role = 3
		roles.add(Integer.parseInt(StringPool.GUEST_ROLE));//Guest Role = 4
		return roles;
	}

	@Override
	public List<Integer> getListStatus() {
		List<Integer> statusList = new ArrayList<Integer> ();
		statusList.add(Integer.parseInt(StringPool.STATUS_INACTIVE)); // Inactive = 2
		statusList.add(Integer.parseInt(StringPool.STATUS_ACTIVE)); // Active = 1
		return statusList;
	}

	@Override
	public List<Long> getListUserIds() {		
		return userDao.getListUserIds();
	}
	
	
	
}
