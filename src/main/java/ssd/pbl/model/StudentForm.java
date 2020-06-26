package ssd.pbl.model;

import java.io.File;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

public class StudentForm {
	private int id;
	private String email;
	private String password;
	private boolean agreement;
	private String checkedPassword;
	private String name;
	private String phone;
	private String gender;
	private String schoolCategory;
	private String schoolType;
	private String status;
	private int schoolId;
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
