package ssd.pbl.model;

import java.io.File;
import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class TeacherForm {
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
	@NotNull(message="학년을 입력해주세요.")
	private int grade;
	@NotEmpty(message="학적 상태를 입력해주세요.")
	private String status;
	@NotNull(message="대학교를 입력해주세요.")
	private int universityId;
	private int majorId;
	@NotNull(message="입학년도를 입력해주세요.")
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
