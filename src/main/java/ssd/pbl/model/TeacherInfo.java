/**
 * 
 */
package ssd.pbl.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author kimhyunjin
 * @date: Jun 12, 2020 12:25:49 AM
 */
@SuppressWarnings("serial")
public class TeacherInfo implements Serializable {
	private Integer id;
	private Integer teacherId;
	private String teacherGender;
	private University university;
	private Major major;
	private String status;
	private String entranceYear;
	private String univcertImg;
	private String profileImg;
	private Date updatedAt;

	public TeacherInfo() {
	}

	public TeacherInfo(Integer id, Integer teacherId, String teacherGender, University university, Major major,
			String status, String entranceYear, String univcertImg, String profileImg, Date updatedAt) {
		super();
		this.id = id;
		this.teacherId = teacherId;
		this.teacherGender = teacherGender;
		this.university = university;
		this.major = major;
		this.status = status;
		this.entranceYear = entranceYear;
		this.univcertImg = univcertImg;
		this.profileImg = profileImg;
		this.updatedAt = updatedAt;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacherGender() {
		return teacherGender;
	}

	public void setTeacherGender(String teacherGender) {
		this.teacherGender = teacherGender;
	}

	public University getUniversity() {
		return university;
	}

	public void setUniversity(University university) {
		this.university = university;
	}

	public Major getMajor() {
		return major;
	}

	public void setMajor(Major major) {
		this.major = major;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEntranceYear() {
		return entranceYear;
	}

	public void setEntranceYear(String entranceYear) {
		this.entranceYear = entranceYear;
	}

	public String getUnivcertImg() {
		return univcertImg;
	}

	public void setUnivcertImg(String univcertImg) {
		this.univcertImg = univcertImg;
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

	@Override
	public String toString() {
		return "TeacherInfo [id=" + id + ", teacherId=" + teacherId + ", teacherGender=" + teacherGender
				+ ", university=" + university + ", major=" + major + ", status=" + status + ", entranceYear="
				+ entranceYear + ", univcertImg=" + univcertImg + ", profileImg=" + profileImg + ", updatedAt="
				+ updatedAt + "]";
	}

}
