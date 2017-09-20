package imic.springmvc.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import imic.springmvc.dto.UserIdentity;
import imic.springmvc.util.StringPool;

@Service("loginService")
public class LoginService {
	List<UserIdentity> admins = new ArrayList<UserIdentity> ();
	List<UserIdentity> teachers = new ArrayList<UserIdentity> ();
	List<UserIdentity> students = new ArrayList<UserIdentity> ();
	
	public LoginService(){
		// Admin accounts
		admins.add(new UserIdentity("admin", "admin"));
		admins.add(new UserIdentity("thanh", "thanh"));
		
		// Teacher accounts
		teachers.add(new UserIdentity("teacher", "teacher"));
		teachers.add(new UserIdentity("meo", "meo"));
		
		// Student accounts
		students.add(new UserIdentity("student", "student"));
		students.add(new UserIdentity("rua", "rua"));
	}
	
	public boolean authenticate(UserIdentity userIdentity){		
		// Hard-code for testing purpose
		if(admins.contains(userIdentity) || teachers.contains(userIdentity) || students.contains(userIdentity)) {
			return true;
		}else{
			return false;
		}				
	}

	public int authorize(UserIdentity userIdentity) {
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
