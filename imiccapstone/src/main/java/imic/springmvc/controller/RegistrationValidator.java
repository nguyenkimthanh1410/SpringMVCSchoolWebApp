package imic.springmvc.controller;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import imic.springmvc.dto.Registration;

@Component("registrationValidator")
public class RegistrationValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Registration.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		//userId//
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userId", "error.required.userId");
		
		//sClassId//
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sClassId", "error.required.sClassId");		

		// regisDate//
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "regisDate", "error.required.regisDate");
	}	

}
