package imic.springmvc.controller;


import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import imic.springmvc.dto.UserLogin;
import imic.springmvc.util.StringUtils;

@Component("userLoginValidator")
public class UserLoginValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return UserLogin.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		UserLogin userIdentity = (UserLogin) target;
		
		// User Name//
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "error.required.userName");
		if (!(userIdentity.getUserName() != null && userIdentity.getUserName().isEmpty())
				&& !StringUtils.length(userIdentity.getUserName(), 50))
			errors.rejectValue("userName", "error.maxlength.userName");


		// Password//
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "error.required.password");
		if (!(userIdentity.getPassword() != null && userIdentity.getPassword().isEmpty())
				&& !StringUtils.length(userIdentity.getPassword(), 15))
			errors.rejectValue("password", "error.maxlength.password");
	}

}
