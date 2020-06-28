package ssd.pbl.model;

import java.io.File;
import java.util.Date;

public class TeacherForm {
	private int id;
	private String email;
	private String password;
	private boolean agreement;
	private String checkedPassword;
	private String name;
	private String phone;
	private String gender;
	private int grade;
	private String status;
	private int universityId;
	private int majorId;
	private int enteranceYear;
	private File profileImg;
	private File univCertImg;
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getUniversityId() {
		return universityId;
	}
	public void setUniversityId(int universityId) {
		this.universityId = universityId;
	}
	public int getMajorId() {
		return majorId;
	}
	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}
	public int getEnteranceYear() {
		return enteranceYear;
	}
	public void setEnteranceYear(int enteranceYear) {
		this.enteranceYear = enteranceYear;
	}
	public File getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(File profileImg) {
		this.profileImg = profileImg;
	}
	public File getUnivCertImg() {
		return univCertImg;
	}
	public void setUnivCertImg(File univCertImg) {
		this.univCertImg = univCertImg;
	}
	
	
}
