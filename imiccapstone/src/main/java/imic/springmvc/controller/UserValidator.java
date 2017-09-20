package imic.springmvc.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import imic.springmvc.dto.User;
import imic.springmvc.util.StringUtils;

@Component("userValidator")
public class UserValidator implements Validator{

	private static final String REGEX_EMAIL = "^(\\s)*\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,4})+(\\s)*$";
	private static final String REGEX_MOBILE = "^(\\s)*0(?:[0-9]){7,15}(\\s)*$";
	private Pattern pattern;
	private Matcher matcher;

	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user = (User) target;

		// Password//
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "error.required.password");
		if (!(user.getPassword() != null && user.getPassword().isEmpty())
				&& !StringUtils.length(user.getPassword(), 15))
			errors.rejectValue("password", "error.maxlength.password");
		
		// First Name//
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "error.required.firstName");
		if (!(user.getFirstName() != null && user.getFirstName().isEmpty())
				&& !StringUtils.length(user.getFirstName(), 50))
			errors.rejectValue("firstName", "error.maxlength.firstName");

		// Last Name//
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "error.required.lastName");
		if (!(user.getLastName() != null && user.getLastName().isEmpty())
				&& !StringUtils.length(user.getLastName(), 50))
			errors.rejectValue("lastName", "error.maxlength.lastName");

		// Email//
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "error.required.email");
		if (!(user.getEmail() != null && user.getEmail().isEmpty())) {
			pattern = Pattern.compile(REGEX_EMAIL);
			matcher = pattern.matcher(user.getEmail());
			if (!matcher.matches()) {
				errors.rejectValue("email", "error.emailformat");
			}
		}

		// mobile//
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mobile", "error.required.mobile");
		if (!(user.getMobile() != null && user.getMobile().isEmpty())) {
			pattern = Pattern.compile(REGEX_MOBILE);
			matcher = pattern.matcher(user.getMobile());
			if (!matcher.matches()) {
				errors.rejectValue("mobile", "error.mobileformat");
			}
		}

		// Address//
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "error.required.address");
		if (!(user.getAddress() != null && user.getAddress().isEmpty())
				&& !StringUtils.length(user.getAddress(), 200))
			errors.rejectValue("address", "error.maxlength.address");

	}

}
