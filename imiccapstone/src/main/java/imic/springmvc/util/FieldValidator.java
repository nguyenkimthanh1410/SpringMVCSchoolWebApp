package imic.springmvc.util;

public class FieldValidator {
	private String regExNumber = "\\d*";
	private String regExFloat = "[-+]?[0-9]*\\.?[0-9]+$";
	private String regExAlphabet = "\\D\\w*";
	private String regExDate = "^\\d{1,2}[-/.]\\d{1,2}[-/.]\\d{1,4}$";
	/*private String regExEmail = "^(.+)@(.+)$";*/
	/*private String regExPhone = "^([0-9\\(\\)\\/\\+ \\-]*)$";*/
	private String regExSentence = "[^A-Za-z0-9-\\s.,]+$";
	private String regExSimplePassword = ".{8,}";
	//-----------Dattv---------------------
	/*private String regExEmail = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]{3,60}+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";*/
	private String regExEmail="^(\\s)*\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,4})+(\\s)*$";
	/*private String regExAddress = "(^[a-zA-Z0-9\\p{IsLatin}.-/, ,-_}]{2,128}$)";*/
	/*private String regExCommon = "(^[a-zA-Z0-9\\p{IsLatin}.-/, ,-_}]{2,128}$)";*/
	/*private String regExAddressOnlyNumber = "^[0-9]{1,45}$";*/
	/*private String regExCommon = "(^[\\D\\w*\\p{IsLatin}]{1,255}$)";*/
	private String regExPhone = "^(\\s)*0(?:[0-9]){7,15}(\\s)*$";
	private String regExExt = "^(\\s)*[0-9]+(\\s)*$";
	private String regExWebsite= "^(\\s)*[a-zA-Z0-9\\-\\.]+\\.(com|org|net|mil|edu|vn|VN|COM|ORG|NET|MIL|EDU|com\\.vn|org\\.vn|COM\\.VN|ORG\\.VN)+(\\s)*$";

	//----------------End-----------------------
	// or alternate
	// "(?=^.{8,}$)((?=.*\\d)|(?=.*\\W+))(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$"
	private String regExPassword = "^(?=.{8,})(?=.*[a-z])(?=.*[A-Z])(?=.*[\\d])(?=.*[\\W]).*$";

	private String regExPattern;

	public FieldValidator() {
		regExPattern = null;
	}

	public FieldValidator(String pattern) {
		regExPattern = pattern;
	}

	public boolean isPattern(String key) throws Exception {
		if (regExPattern != null)
			return key.matches(regExPattern);
		else
			throw new Exception("Custom Pattern Not Defined");
	}

	public boolean isNumber(String key) {
		return key.matches(regExNumber);
	}

	public boolean isFloat(String key) {
		return key.matches(regExFloat);
	}

	public boolean isAlphabet(String key) {
		return key.matches(regExAlphabet);
	}

	public boolean isDate(String key) {
		return key.matches(regExDate);
	}

	public boolean isDate(String key, String formatpattern) {
		return key.matches(formatpattern);
	}


	public boolean isSimplePassword(String key) {
		return key.matches(regExSimplePassword);
	}

	public boolean isPassword(String key) {
		return key.matches(regExPassword);
	}

	public boolean isSentence(String key) {
		return key.matches(regExSentence);
	}
	//------------Dattv------------------------
	//-----------check  regEx -----------------
	public boolean isEmail(String key) {
		return key.matches(regExEmail);
	}
	public boolean isPhone(String key) {
		return key.matches(regExPhone);
	}
	public boolean isWebsite(String key) {
		return key.matches(regExWebsite);
	}
	public boolean isExt(String key) {
		return key.matches(regExExt);
	}
	//------------Check length -----------------
	public boolean isLenght(String key,int value) {
		return key.matches(regExPhone);
	}
}
