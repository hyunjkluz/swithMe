package ssd.pbl.model;

import javax.validation.constraints.NotEmpty;

public class FindIDForm {
	@NotEmpty(message="타입을 설정해주세요.")
	private String type;
	@NotEmpty(message="이름을 입력해주세요.")
	private String name;
	@NotEmpty(message="번호를 입력해주세요.")
	private String phone;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
