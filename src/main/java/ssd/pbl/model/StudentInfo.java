/**
 * 
 */
package ssd.pbl.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author kimhyunjin
 * @date: Jun 17, 2020 1:46:26 PM
 */
@SuppressWarnings("serial")
public class StudentInfo implements Serializable {
	private Integer id;
	private Integer student;
	private String studentGender;
	private SchoolForm school;
	private String schoolCategory;
	private String schoolType;
	private String status;
	private Integer grade;
	private String profileImg;
	private Date updatedAt;

	public StudentInfo() {
	}

	public StudentInfo(Integer id, Integer student, String studentGender, SchoolForm school, String schoolCategory,
			String schoolType, String status, Integer grade, String profileImg, Date updatedAt) {
		super();
		this.id = id;
		this.student = student;
		this.studentGender = studentGender;
		this.school = school;
		this.schoolCategory = schoolCategory;
		this.schoolType = schoolType;
		this.status = status;
		this.grade = grade;
		this.profileImg = profileImg;
		this.updatedAt = updatedAt;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStudent() {
		return student;
	}

	public void setStudent(Integer student) {
		this.student = student;
	}

	public String getStudentGender() {
		return studentGender;
	}

	public void setStudentGender(String studentGender) {
		this.studentGender = studentGender;
	}

	public SchoolForm getSchool() {
		return school;
	}

	public void setSchool(SchoolForm school) {
		this.school = school;
	}

	public String getSchoolCategory() {
		return schoolCategory;
	}

	public void setSchoolCategory(String schoolCategory) {
		this.schoolCategory = schoolCategory;
	}

	public String getSchoolType() {
		return schoolType;
	}

	public void setSchoolType(String schoolType) {
		this.schoolType = schoolType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

}
