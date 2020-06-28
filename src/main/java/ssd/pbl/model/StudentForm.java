package ssd.pbl.model;

import java.io.File;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

public class StudentForm {
	private int id;
	@NotEmpty(message="이메일을 입력해주세요.")
	private String email;
	@NotEmpty(message="비밀번호를 입력해주세요.")
	private String password;
	private boolean agreement;
	@NotEmpty(message="비밀번호를 한 번 더 입력해주세요.")
	private String checkedPassword;
	@NotEmpty(message="이름을 입력해주세요.")
	private String name;
	@NotEmpty(message="전화번호를 입력해주세요.")
	private String phone;
	@NotEmpty(message="성별을 입력해주세요.")
	private String gender;
	@NotEmpty(message="학교를 입력해주세요.")
	private String schoolCategory;
	private String schoolType;
	@NotEmpty(message="학적 상태를 입력해주세요.")
	private String status;
	@NotNull(message="학교를 입력해주세요.")
	private int schoolId;
	@NotNull(message="학년을 입력해주세요.")
	private int grade;
//	private MultipartFile profileImg;
	

	public int getSchoolId() {
		return schoolId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSchoolType() {
		return schoolType;
	}
	public void setSchoolType(String schoolType) {
		this.schoolType = schoolType;
	}
	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isAgreement() {
		return agreement;
	}
	public void setAgreement(boolean agreement) {
		this.agreement = agreement;
	}
	public String getCheckedPassword() {
		return checkedPassword;
	}
	public void setCheckedPassword(String checkedPassword) {
		this.checkedPassword = checkedPassword;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getSchoolCategory() {
		return schoolCategory;
	}
	public void setSchoolCategory(String schoolCategory) {
		this.schoolCategory = schoolCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
//	public MultipartFile getProfileImg() {
//		return profileImg;
//	}
//	public void setProfileImg(MultipartFile profileImg) {
//		this.profileImg = profileImg;
//	}
	
	
}
