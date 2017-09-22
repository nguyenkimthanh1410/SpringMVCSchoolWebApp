package imic.springmvc.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import imic.springmvc.dao.UserDao;
import imic.springmvc.dto.User;
import imic.springmvc.service.UserService;
import imic.springmvc.util.StringPool;


@Controller
@RequestMapping(value={"/admin"})
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserValidator userValidator;	
	
	// WebDataBinder binds the CustomDateEditor web request parameter to attribute Date.class in JavaBean.
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
		dateFormat.setLenient(false);
		webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	/////////// READ All
	@RequestMapping(value={"/users"}, method=RequestMethod.GET)
	public String showUsersManagement(Model model){
		List<User> users = userService.getAll();
		model.addAttribute("users",users);		
		return "admin/users/usersManagement";
	}
			
	
	/////////////CREATE - blank form
	@RequestMapping(value={"/createUser"}, method=RequestMethod.GET)
	public String showCreateUserForm(Model model, HttpServletRequest request) throws SQLException {
		String userlogin = (String) request.getSession().getAttribute("userlogin");
		User user = userService.createEmptyUser(userlogin);
		model.addAttribute("user", user);
		
		/*List<User> users = userService.getAll();
		model.addAttribute("users", users);*/
		
		// Get list of roles from service layer
		List<Integer> roles = userService.getListRoles();		
		model.addAttribute("roles", roles); // Admin: 1, Teacher: 2, Student: 3, Guest: 4
		
		// Get list status from service layer
		List<Integer> statusList = userService.getListStatus();		
		model.addAttribute("statusList", statusList);// Active: 1, Inactive: 2
		
		return "admin/users/createUserForm";
	}
	
	///////////////CREATE - process form input	
	@RequestMapping(value={"/createUser"}, method=RequestMethod.POST)
	public String processCreateUserForm(@ModelAttribute("user") User user, BindingResult bindingResult, 
			Model model, HttpServletRequest request) {
							
		userValidator.validate(user, bindingResult);
		if(bindingResult.hasErrors()) {
			// To allow drop-down boxes active
			// Get list of roles from service layer
			List<Integer> roles = userService.getListRoles();		
			model.addAttribute("roles", roles); // Admin: 1, Teacher: 2, Student: 3, Guest: 4
			
			//System.out.println("----------------FIELD ERROR: " + bindingResult.getFieldError("password"));
			
			// Get list status from service layer
			List<Integer> statusList = userService.getListStatus();		
			model.addAttribute("statusList", statusList);// Active: 1, Inactive: 2
			
			return "admin/users/createUserForm";
		}
		
		// Get user login
		String userlogin = (String) request.getSession().getAttribute("userlogin");
		System.out.println(user);
		userService.insert(user, userlogin);
		
		return "redirect:/admin/users";
	}
	

	//////////////////READ - by Id
	//viewUserProfile
	@RequestMapping(value={"/viewUserProfile/{id}"}, method=RequestMethod.GET)
	public String viewUserProfile(@PathVariable("id") String userId, Model model) {
		Long idSelected = Long.parseLong(userId);
		System.out.println("idSelected to be viewed: " + idSelected);
		
		User user = userService.findById(idSelected);
		model.addAttribute("user", user);
		
		return "admin/users/viewUserProfile";
	}
	

	/////////////////EDIT - SHOW EDIT FORM
	@RequestMapping(value={"/showEditUserForm/{id}"}, method=RequestMethod.GET)
	public String showEditUserForm(@PathVariable("id") String userId, Model model) {
		Long idSelected = Long.parseLong(userId);
		System.out.println("idSelected to be edited: " + idSelected);
		
		User user = userService.findById(idSelected);
		model.addAttribute("user", user);
		
		// To allow drop-down boxes active
		// Get list of roles from service layer
		List<Integer> roles = userService.getListRoles();		
		model.addAttribute("roles", roles); // Admin: 1, Teacher: 2, Student: 3, Guest: 4
		
		// Get list status from service layer
		List<Integer> statusList = userService.getListStatus();		
		model.addAttribute("statusList", statusList);// Active: 1, Inactive: 2
		
		return "admin/users/showEditUserForm";		
	}
	
	//////////////////EDIT - PROCESS EDIT FORM
	@RequestMapping(value={"/showEditUserForm/{id}"}, method=RequestMethod.POST)
	public String processEditUserForm(@ModelAttribute("user") User user, BindingResult bindingResult, HttpServletRequest request, Model model) {
		// Valid inputs
		userValidator.validate(user, bindingResult);
		if(bindingResult.hasErrors()) {
			// To allow drop-down boxes active
			// Get list of roles from service layer
			List<Integer> roles = userService.getListRoles();		
			model.addAttribute("roles", roles); // Admin: 1, Teacher: 2, Student: 3, Guest: 4
			
			// Get list status from service layer
			List<Integer> statusList = userService.getListStatus();		
			model.addAttribute("statusList", statusList);// Active: 1, Inactive: 2
			return "admin/users/showEditUserForm";
		}
		
		// Get user login
		String userlogin = (String) request.getSession().getAttribute("userlogin");	
		userService.update(user, userlogin);
		
		return "redirect:/admin/users";
	}
	
	
	///////////////// DELETE USER
	@RequestMapping(value={"/deleteUser/{id}"}, method=RequestMethod.GET)
	public String deleteUser(@PathVariable("id") String userId, HttpServletRequest request) {
		// Identify userId to be deleted
		Long idSelected = Long.parseLong(userId);
		System.out.println("idSelected to be deleted: " + idSelected);
		
		// Identify userlogin
		String userlogin = (String) request.getSession().getAttribute("userlogin");
		int numberOfRowsAffected = userService.deleteById(idSelected, userlogin);		
		
		if(numberOfRowsAffected > 0) {
			System.out.println("Successfully delete");
		}else{
			System.out.println("Fail to delete");
		}
		return "redirect:/admin/users";		
	}
	
}