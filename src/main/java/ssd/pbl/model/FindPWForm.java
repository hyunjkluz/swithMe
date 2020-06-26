package ssd.pbl.model;

import javax.validation.constraints.NotEmpty;

public class FindPWForm {
	@NotEmpty(message="타입을 설정해주세요.")
	private String type;
	@NotEmpty(message="이메일을 입력해주세요.")
	private String email;
	@NotEmpty(message="이름을 입력해주세요.")
	private String name;
	private int code;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
