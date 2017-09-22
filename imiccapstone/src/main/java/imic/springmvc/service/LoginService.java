package imic.springmvc.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import imic.springmvc.dto.UserLogin;
import imic.springmvc.util.StringPool;

@Service("loginService")
public class LoginService {
	List<UserLogin> admins = new ArrayList<UserLogin> ();
	List<UserLogin> teachers = new ArrayList<UserLogin> ();
	List<UserLogin> students = new ArrayList<UserLogin> ();
	
	public LoginService(){
		// Admin accounts
		admins.add(new UserLogin("admin", "admin"));
		admins.add(new UserLogin("thanh", "thanh"));
		
		// Teacher accounts
		teachers.add(new UserLogin("teacher", "teacher"));
		teachers.add(new UserLogin("meo", "meo"));
		
		// Student accounts
		students.add(new UserLogin("student", "student"));
		students.add(new UserLogin("rua", "rua"));
	}
	
	public boolean authenticate(UserLogin userIdentity){		
		// Hard-code for testing purpose
		if(admins.contains(userIdentity) || teachers.contains(userIdentity) || students.contains(userIdentity)) {
			return true;
		}else{
			return false;
		}				
	}

	public int authorize(UserLogin userIdentity) {
		if(admins.contains(userIdentity)) {
			return Integer.parseInt(StringPool.ADMIN_ROLE);
		}else if(teachers.contains(userIdentity)){
			return Integer.parseInt(StringPool.TEACHER_ROLE);
		}else if(students.contains(userIdentity)){
			return Integer.parseInt(StringPool.STUDENT_ROLE);
		}else{
			return Integer.parseInt(StringPool.GUEST_ROLE);
		}
	}	
}
