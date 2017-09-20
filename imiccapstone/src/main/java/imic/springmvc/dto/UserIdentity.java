package imic.springmvc.dto;

public class UserIdentity {
	private String userName;
	private String password;	
	
	public UserIdentity(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}
	public UserIdentity() {
	
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "UserIdentity [userName=" + userName + ", password=" + password + "]";
	}
	@Override
	public boolean equals(Object obj) {
		String userName = ((UserIdentity) obj).getUserName();
		String password = ((UserIdentity) obj).getPassword();
		
		return (this.userName.equals(userName) && this.password.equals(password)) ;
	}
	
	@Override
	public int hashCode() {
		return (this.userName.hashCode() + this.password.hashCode());
	}
}
