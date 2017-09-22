package imic.springmvc.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
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
import imic.springmvc.dto.Registration;
import imic.springmvc.dto.User;
import imic.springmvc.service.RegistrationService;
import imic.springmvc.service.SClassService;
import imic.springmvc.service.UserService;
import imic.springmvc.util.StringPool;


@Controller
@RequestMapping(value={"/admin"})
public class RegistrationController {
	
	@Autowired
	private RegistrationService registrationService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SClassService sClassService;
	
	@Autowired
	private RegistrationValidator registrationValidator;	
	
	// WebDataBinder binds the CustomDateEditor web request parameter to attribute Date.class in JavaBean.
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
		dateFormat.setLenient(false);
		webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	/////////// READ All
	@RequestMapping(value={"/registrations"}, method=RequestMethod.GET)
	public String showRegistrationsManagement(Model model){
		List<Registration> registrations = registrationService.getAll();
		model.addAttribute("registrations",registrations);		
		return "admin/registrations/registrationsManagement";
	}
			
	
	/////////////CREATE - blank form
	@RequestMapping(value={"/createRegistrationForm"}, method=RequestMethod.GET)
	public String showCreateRegistrationForm(Model model, HttpServletRequest request) throws SQLException {
		String userlogin = (String) request.getSession().getAttribute("userlogin");
		Registration registration = registrationService.createEmptyRegistration(userlogin);
		model.addAttribute("registration", registration);		
		
		// Get list of students from service layer!!!!!GET STUDENTS ONLY
		List<Long> userIds = userService.getIdsByRole(Integer.parseInt(StringPool.STUDENT_ROLE));		
		model.addAttribute("userIds", userIds);
		
		// Get list of sClassIds from service layer
		List<Long> sClassIds = sClassService.getListSclassIds();	
		Collections.sort(sClassIds);
		model.addAttribute("sClassIds", sClassIds);
		
		return "admin/registrations/createRegistrationForm";
	}
	
	
	///////////////CREATE - process form input	
	@RequestMapping(value={"/createRegistrationForm"}, method=RequestMethod.POST)
	public String processCreateRegistrationForm(@ModelAttribute("registration") Registration registration, BindingResult bindingResult, 
										Model model, HttpServletRequest request) {
							
		registrationValidator.validate(registration, bindingResult);
		if(bindingResult.hasErrors()) {
			// To allow drop-down boxes active
			// Get list of students from service layer!!!!!GET STUDENTS ONLY
			List<Long> userIds = userService.getIdsByRole(Integer.parseInt(StringPool.STUDENT_ROLE));		
			model.addAttribute("userIds", userIds);
			
			// Get list of sClassIds from service layer
			List<Long> sClassIds = sClassService.getListSclassIds();
			Collections.sort(sClassIds);
			model.addAttribute("sClassIds", sClassIds);
			
			return "admin/registrations/createRegistrationForm";// check again
		}
		
		// Get user login
		String userlogin = (String) request.getSession().getAttribute("userlogin");
		System.out.println(registration);
		registrationService.insert(registration, userlogin);
		
		return "redirect:/admin/registrations";
	}
	

	//////////////////READ - by Id	
	@RequestMapping(value={"/viewRegistrationDetail/{id}"}, method=RequestMethod.GET)
	public String viewRegistrationDetail(@PathVariable("id") String regisId, Model model) {
		Long idSelected = Long.parseLong(regisId);
		System.out.println("idSelected to be viewed: " + idSelected);
		
		Registration registration = registrationService.findById(idSelected);
		model.addAttribute("registration", registration);
		
		return "admin/registrations/viewRegistrationDetail";
	}
	

	/////////////////EDIT - SHOW EDIT FORM
	@RequestMapping(value={"/showEditRegistrationForm/{id}"}, method=RequestMethod.GET)
	public String showEditRegistrationForm(@PathVariable("id") String regisId, Model model) {
		Long idSelected = Long.parseLong(regisId);
		System.out.println("idSelected to be edited: " + idSelected);
		
		Registration registration = registrationService.findById(idSelected);
		model.addAttribute("registration", registration);
		
		// To allow drop-down boxes active
		// Get list of students from service layer!!!!!GET STUDENTS ONLY
		List<Long> userIds = userService.getIdsByRole(Integer.parseInt(StringPool.STUDENT_ROLE));		
		model.addAttribute("userIds", userIds);
		
		// Get list of sClassIds from service layer
		List<Long> sClassIds = sClassService.getListSclassIds();
		Collections.sort(sClassIds);
		model.addAttribute("sClassIds", sClassIds);
		
		return "admin/registrations/showEditRegistrationForm";		
	}
	
	
	//////////////////EDIT - PROCESS EDIT FORM
	@RequestMapping(value={"/showEditRegistrationForm/{id}"}, method=RequestMethod.POST)
	public String processEditRegistrationForm(@ModelAttribute("registration") Registration registration, 
					BindingResult bindingResult, HttpServletRequest request, Model model) {
		// Valid inputs
		registrationValidator.validate(registration, bindingResult);
		if(bindingResult.hasErrors()) {
			// To allow drop-down boxes active
			// Get list of students from service layer!!!!!GET STUDENTS ONLY
			List<Long> userIds = userService.getIdsByRole(Integer.parseInt(StringPool.STUDENT_ROLE));		
			model.addAttribute("userIds", userIds);
			
			// Get list of sClassIds from service layer
			List<Long> sClassIds = sClassService.getListSclassIds();	
			Collections.sort(sClassIds);// sort in ascending order
			model.addAttribute("sClassIds", sClassIds);
			return "admin/registrations/showEditRegistrationForm";
		}
		
		// Get user login
		String userlogin = (String) request.getSession().getAttribute("userlogin");	
		registrationService.update(registration, userlogin);
		
		return "redirect:/admin/registrations";
	}
	

	///////////////// DELETE USER
	@RequestMapping(value={"/deleteRegistration/{id}"}, method=RequestMethod.GET)
	public String deleteRegistration(@PathVariable("id") String regisId, HttpServletRequest request) {
		// Identify userId to be deleted
		Long idSelected = Long.parseLong(regisId);
		System.out.println("idSelected to be deleted: " + idSelected);
		
		// Identify userlogin
		String userlogin = (String) request.getSession().getAttribute("userlogin");
		int numberOfRowsAffected = registrationService.deleteById(idSelected, userlogin);		
		
		if(numberOfRowsAffected > 0) {
			System.out.println("Successfully delete");
		}else{
			System.out.println("Fail to delete");
		}
		return "redirect:/admin/registrations";		
	}
	
}