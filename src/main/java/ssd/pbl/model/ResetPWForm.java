package ssd.pbl.model;

public class ResetPWForm {
	private String type;
	private String password;
	private String checkedPassword;
	private String email;
	
	public ResetPWForm() {
		super();
	}

	public ResetPWForm(String type, String password, String checkedPassword, String email) {
		super();
		this.type = type;
		this.password = password;
		this.checkedPassword = checkedPassword;
		this.email = email;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getCheckedPassword() {
		return checkedPassword;
	}
	
	public void setCheckedPassword(String checkedPassword) {
		this.checkedPassword = checkedPassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
