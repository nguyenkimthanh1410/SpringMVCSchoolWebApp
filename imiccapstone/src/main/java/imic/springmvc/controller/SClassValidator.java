package imic.springmvc.controller;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import imic.springmvc.dto.SClass;
import imic.springmvc.util.StringUtils;

@Component("sClassValidator")
public class SClassValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return SClass.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		SClass sClass = (SClass) target;

		// Class Name//
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sClassName", "error.required.sClassName");
		if (!(sClass.getsClassName() != null && sClass.getsClassName().isEmpty())
				&& !StringUtils.length(sClass.getsClassName(), 50)){
			errors.rejectValue("sClassName", "error.maxlength.sClassName");
		}
		
		/*// teacherId//
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "teacherId", "error.required.teacherId");
		if (!(sClass.getTeacherId() != null && sClass.getTeacherId()==0)){				
			errors.rejectValue("teacherId", "error.required.teacherId");
		}
*/
	}

}
