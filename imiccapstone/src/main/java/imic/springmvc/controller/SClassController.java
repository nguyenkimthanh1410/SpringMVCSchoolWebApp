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
import imic.springmvc.dto.SClass;
import imic.springmvc.dto.User;
import imic.springmvc.service.SClassService;
import imic.springmvc.service.UserService;
import imic.springmvc.util.StringPool;


@Controller
@RequestMapping(value={"/admin"})
public class SClassController {
	
	@Autowired
	private SClassService sClassService;
	@Autowired
	private UserService userService;
	
	@Autowired
	private SClassValidator sClassValidator;	
	
	// WebDataBinder binds the CustomDateEditor web request parameter to attribute Date.class in JavaBean.
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
		dateFormat.setLenient(false);
		webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	/////////// READ All
	@RequestMapping(value={"/classes"}, method=RequestMethod.GET)
	public String showClassesManagement(Model model){
		List<SClass> sClasses = sClassService.getAll();
		model.addAttribute("sClasses",sClasses);		
		return "admin/classes/classesManagement";
	}
			
	
	/////////////CREATE - blank form
	@RequestMapping(value={"/createClassForm"}, method=RequestMethod.GET)
	public String showCreateClassForm(Model model, HttpServletRequest request) throws SQLException {
		
		// Send SClass object to form for binding purpose
		String userlogin = (String) request.getSession().getAttribute("userlogin");
		SClass sClass = sClassService.createEmptyClass(userlogin);
		model.addAttribute("sClass", sClass);
		
		// Get list of Teacher ids from UserService Layer
		List<Long> teacherIds = userService.getIdsByRole(Integer.parseInt(StringPool.TEACHER_ROLE));//3
		Collections.sort(teacherIds); // sort in ascending order
		model.addAttribute("teacherIds", teacherIds);
	
		return "admin/classes/createClassForm";
	}
	
	///////////////CREATE - process form input	
	@RequestMapping(value={"/createClassForm"}, method=RequestMethod.POST)
	public String processCreateClassForm(@ModelAttribute("sClass") SClass sClass, BindingResult bindingResult, 
			HttpServletRequest request, Model model) {
							
		sClassValidator.validate(sClass, bindingResult);
		if(bindingResult.hasErrors()) {
			
			// Get list of Teacher ids from UserService Layer (!!!!Why need add this to make drop-down work after error occured
			List<Long> teacherIds = userService.getIdsByRole(Integer.parseInt(StringPool.TEACHER_ROLE));
			Collections.sort(teacherIds); // sort in ascending order
			model.addAttribute("teacherIds", teacherIds);
			return "admin/classes/createClassForm";
		}
		
		// Get user login
		String userlogin = (String) request.getSession().getAttribute("userlogin");		
		sClassService.insert(sClass, userlogin);
		
		return "redirect:/admin/classes";
	}
	

	//////////////////READ - by Id
	//viewUserProfile
	@RequestMapping(value={"/viewClassDetail/{id}"}, method=RequestMethod.GET)
	public String viewUserProfile(@PathVariable("id") String sClassId, Model model) {
		Long idSelected = Long.parseLong(sClassId);
		System.out.println("idSelected to be viewed: " + idSelected);
		
		SClass sClass = sClassService.findById(idSelected);
		model.addAttribute("sClass", sClass);
		
		return "admin/classes/viewClassDetail";
	}
	

	/////////////////EDIT - SHOW EDIT FORM
	@RequestMapping(value={"/showEditClassForm/{id}"}, method=RequestMethod.GET)
	public String showEditUserForm(@PathVariable("id") String classId, Model model) {
		Long idSelected = Long.parseLong(classId);
		System.out.println("idSelected to be edited: " + idSelected);
		
		SClass sClass = sClassService.findById(idSelected);
		model.addAttribute("sClass", sClass);
		
		// Get list of Teacher ids from UserService Layer
		List<Long> teacherIds = userService.getIdsByRole(Integer.parseInt(StringPool.TEACHER_ROLE));
		Collections.sort(teacherIds); // sort in ascending order.
		model.addAttribute("teacherIds", teacherIds);		
			
		return "admin/classes/showEditClassForm";		
	}
	

	//////////////////EDIT - PROCESS EDIT FORM
	@RequestMapping(value={"/showEditClassForm/{id}"}, method=RequestMethod.POST)
	public String processEditUserForm(@ModelAttribute("sClass") SClass sClass, 
				BindingResult bindingResult, HttpServletRequest request, Model model) {
		// Valid inputs
		sClassValidator.validate(sClass, bindingResult);
		if(bindingResult.hasErrors()) {
			// Get list of Teacher ids from UserService Layer (!!!!Why need add this to make drop-down work after error occured
			List<Long> teacherIds = userService.getIdsByRole(Integer.parseInt(StringPool.TEACHER_ROLE));
			Collections.sort(teacherIds); // sort in ascending order
			model.addAttribute("teacherIds", teacherIds);
			return "admin/classes/showEditClassForm";
		}
		
		// Get user login
		String userlogin = (String) request.getSession().getAttribute("userlogin");	
		System.out.println("----------userlogin: " + userlogin);
		sClassService.update(sClass, userlogin);
		
		return "redirect:/admin/classes";
	}
	

	///////////////// DELETE
	@RequestMapping(value={"/deleteClass/{id}"}, method=RequestMethod.GET)
	public String deleteUser(@PathVariable("id") String sClassId, HttpServletRequest request) {
		// Identify userId to be deleted
		Long idSelected = Long.parseLong(sClassId);
		System.out.println("idSelected to be deleted: " + idSelected);
		
		// Identify userlogin
		String userlogin = (String) request.getSession().getAttribute("userlogin");
		int numberOfRowsAffected = sClassService.deleteById(idSelected, userlogin);		
		
		if(numberOfRowsAffected > 0) {
			System.out.println("Successfully delete");
		}else{
			System.out.println("Fail to delete");
		}
		return "redirect:/admin/classes";		
	}

}