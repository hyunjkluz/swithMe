/**
 * 
 */
package ssd.pbl.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author kimhyunjin
 * @date: Jun 16, 2020 9:19:41 PM
 */
@SuppressWarnings("serial")
public class TeacherMatch implements Serializable {
	private Integer id;
	private Integer teacher;
	private String profileIntro;
	private String profileCareer;
	private String profileStyle;
	private String studentGender;
	private Date updatedAt;

	public TeacherMatch() {
	}

	public TeacherMatch(Integer id, Integer teacher, String profileIntro, String profileCareer, String profileStyle,
			String studentGender, Date updatedAt) {
		super();
		this.id = id;
		this.teacher = teacher;
		this.profileIntro = profileIntro;
		this.profileCareer = profileCareer;
		this.profileStyle = profileStyle;
		this.studentGender = studentGender;
		this.updatedAt = updatedAt;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTeacher() {
		return teacher;
	}

	public void setTeacher(Integer teacher) {
		this.teacher = teacher;
	}

	public String getProfileIntro() {
		return profileIntro;
	}

	public void setProfileIntro(String profileIntro) {
		this.profileIntro = profileIntro;
	}

	public String getProfileCareer() {
		return profileCareer;
	}

	public void setProfileCareer(String profileCareer) {
		this.profileCareer = profileCareer;
	}

	public String getProfileStyle() {
		return profileStyle;
	}

	public void setProfileStyle(String profileStyle) {
		this.profileStyle = profileStyle;
	}

	public String getStudentGender() {
		return studentGender;
	}

	public void setStudentGender(String studentGender) {
		this.studentGender = studentGender;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	@Override
	public String toString() {
		return "TeacherMatch [id=" + id + ", teacher=" + teacher + ", profileIntro=" + profileIntro + ", profileCareer="
				+ profileCareer + ", profileStyle=" + profileStyle + ", studentGender=" + studentGender + ", updatedAt="
				+ updatedAt + "]";
	}

}
