package imic.springmvc.util;

import java.util.Date;

import org.springframework.validation.Errors;


public class ValidationUtils implements StringPool
{
    private Errors errors;

    private ValidationUtils(Errors errors)
    {
        this.errors = errors;
    }

    public static ValidationUtils getInstance(Errors errors)
    {
        return new ValidationUtils(errors);
    }

    public void compare(String[] value, String path, String errorCode, Object... errorArgs)
    {
        String f = value[0];
        for (int i = 1; i < value.length; i++)
        {
            if (!f.equals(value[i]))
            {
                errors.rejectValue(path, errorCode, errorArgs, getDefaultMessage(errorCode));
            }
        }
    }

    //---------------- Check empty or null--------------------
    public void emptyOrNull(String value, String path, String errorCode, Object... errorArgs)
    {
        if (StringUtils.isNullOrEmpty(value))
            errors.rejectValue(path, errorCode, errorArgs, getDefaultMessage(errorCode));
    }

    public <T extends Number> void emptyOrNullNumber(T value, String path, String errorCode, Object... errorArgs)
    {
        if (value == null)
        {
            errors.rejectValue(path, errorCode, errorArgs, getDefaultMessage(errorCode));
        }
    }

    public void emptyOrNullDate(Date value, String path, String errorCode, Object... errorArgs)
    {
        if (value == null)
        {
            errors.rejectValue(path, errorCode, errorArgs, getDefaultMessage(errorCode));
        }
    }

    public void checkNull(Object value, String path, String errorCode, Object... errorArgs)
    {
        if (value == null)
        {
            errors.rejectValue(path, errorCode, errorArgs, getDefaultMessage(errorCode));
        }
    }

    public void compareDate(Date lesser, Date greater, String path, String errorCode, Object... errorArgs)
    {
    	if (lesser != null && greater != null)
	        if (lesser.getTime() > greater.getTime())
	        {
	            errors.rejectValue(path, errorCode, errorArgs, getDefaultMessage(errorCode));
	        }
    }

    //--------------- Check regEx ----------------------
    public void email(String value, String path, String errorCode, Object... errorArgs)
    {
        if (!new FieldValidator().isEmail(value))
            errors.rejectValue(path, errorCode, errorArgs, getDefaultMessage(errorCode));
    }

    public void phone(String value, String path, String errorCode, Object... errorArgs)
    {
        if (!new FieldValidator().isPhone(value))
            errors.rejectValue(path, errorCode, errorArgs, getDefaultMessage(errorCode));
    }

    public void website(String value, String path, String errorCode, Object... errorArgs)
    {
        if (!new FieldValidator().isWebsite(value))
            errors.rejectValue(path, errorCode, errorArgs, getDefaultMessage(errorCode));
    }

    public void ext(String value, String path, String errorCode, Object... errorArgs)
    {
        if (!new FieldValidator().isExt(value))
            errors.rejectValue(path, errorCode, errorArgs, getDefaultMessage(errorCode));
    }

    public void so(String value, String path, String errorCode, Object... errorArgs)
    {
        if (!new FieldValidator().isNumber(value))
            errors.rejectValue(path, errorCode, errorArgs, getDefaultMessage(errorCode));
    }

    //---------------------------End check regEx--------------------------------

    //---------------------------Check length ----------------------

    public void lengthPhone(String value, int min, int max, String path, String errorCode, Object... errorArgs)
    {
        if (!StringUtils.lenghtPhone(value, min, max))
            errors.rejectValue(path, errorCode, errorArgs, getDefaultMessage(errorCode));
    }

    public void length(String value, int max, String path, String errorCode, Object... errorArgs)
    {
        if (!StringUtils.length(value, max))
            errors.rejectValue(path, errorCode, errorArgs, getDefaultMessage(errorCode));
    }

    //--------------------------End check length--------------------
    private static String getDefaultMessage(String errorCode)
    {
        return errorCode;
    }

    // check if not choose @author:quynq

    public void isNotChoose(Long value, String path, String errorCode, Object... errorArgs)
    {
        if (null == value)
            errors.rejectValue(path, errorCode, errorArgs, getDefaultMessage(errorCode));
    }

    public void isNotChoose(Integer value, String path, String errorCode, Object... errorArgs)
    {
        if (null == value)
            errors.rejectValue(path, errorCode, errorArgs, getDefaultMessage(errorCode));
    }
}
