package imic.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import imic.springmvc.dto.UserIdentity;
import imic.springmvc.service.LoginService;
import imic.springmvc.util.StringPool;


@Controller
public class HomeController {
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private UserIdentityValidator userIdentityValidator;
	
	@RequestMapping(value={"/home", "/"})
	public String showHomePage(HttpServletRequest request, Model model) {
		System.out.println("Im in show home page");
		return "home";		
	}
	
	@RequestMapping(value={"/processGoToUserPage", "/home/processGoToUserPage"})
	public String processGoToUserPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		try{
			String dashboardRole =  (String) session.getAttribute("dashboardRole");	
			if(dashboardRole.equals(null)){
				return "home";	
			}else{
				return "redirect:/" + dashboardRole;
			}					
		}catch(Exception e) {
			session.setAttribute("userlogin", "guest");
			return "home"; // need to check why it causes exception??????????
		}
	}
	
	@RequestMapping(value={"/admin", "/admin/home"}, method=RequestMethod.GET)
	public String showAdminHomePage() {		
		return "/admin/adminHome";
	}	
	
	@RequestMapping(value={"/login", "/login.html"}, method=RequestMethod.GET)
	public String showLoginForm(Model model) {
		// Create object UserIdentity to bind its properties with form fields
		model.addAttribute("userIdentity", new UserIdentity());
		return "/login/loginForm";
	}
	
	
	@RequestMapping(value={"/login", "/login.html"}, method=RequestMethod.POST)
	public String processLoginForm(@ModelAttribute("userIdentity") UserIdentity  userIdentity,
				BindingResult bindingResult, HttpServletRequest request, Model model) {
		
		userIdentityValidator.validate(userIdentity, bindingResult);
		if (bindingResult.hasErrors()){
			return "/login/loginForm";
		}
				
		boolean result = loginService.authenticate(userIdentity);
		String dashboardRole = "guest";
		HttpSession httpSession = request.getSession();
		
		if(result) {
			httpSession.setAttribute("userlogin", userIdentity.getUserName());			
			
			int roleId = loginService.authorize(userIdentity);
			if(roleId == Integer.parseInt(StringPool.ADMIN_ROLE)){
				System.out.println("Hi Admin!!!!!!!!!!!!!");		
				dashboardRole = "admin";			
				httpSession.setAttribute("dashboardRole", dashboardRole);				
				return "redirect:/admin";
			}else if(roleId == Integer.parseInt(StringPool.TEACHER_ROLE)){
				dashboardRole = "teacher";		
				httpSession.setAttribute("dashboardRole", dashboardRole);				
				return "redirect:/teacher";
			}else if(roleId == Integer.parseInt(StringPool.STUDENT_ROLE)){	
				dashboardRole = "student";	
				httpSession.setAttribute("dashboardRole", dashboardRole);			
				return "redirect:/student";		
			}else {			
				httpSession.setAttribute("dashboardRole", "guest");
				return "redirect:/home";
			}
		}else{
			System.out.println("Fail to authenticate: (" + userIdentity.getUserName() + "-" + userIdentity.getPassword() + ")");
			return "redirect:/home";
		}		
	}
	
	@RequestMapping(value={"/logout", "/logout.html"}, method=RequestMethod.GET)
	public String processLogout(Model model, HttpServletRequest request) {
		// Invalidate session for this user
		HttpSession session = request.getSession();
		session.removeAttribute("userlogin");
		session.invalidate();		
		
		// Open a new session for guest
		HttpSession aGuestSession = request.getSession();
		model.addAttribute("userlogin", "guest");
		aGuestSession.setAttribute("userlogin", "guest");
		aGuestSession.setAttribute("dashboardForUser", "home");
		return "/home";
	}
	
	
}
