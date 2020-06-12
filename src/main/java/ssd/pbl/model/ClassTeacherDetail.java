/**
 * 
 */
package ssd.pbl.model;

import java.util.List;

/**
 * @author kimhyunjin
 * @date: Jun 12, 2020 12:51:14 PM
 */
public class ClassTeacherDetail {
	private Integer classId;
	private int ability;
	private String studentGender;
	private Teacher teacher;
	private TeacherInfo teacherInfo;
	// teacherMatch, teacherRegion 등 추가 예정
	private Subject subject;
	private List<ClassFeedback> feedback;

	public ClassTeacherDetail() {
	}

	public ClassTeacherDetail(Integer classId, int ability, String studentGender, Teacher teacher,
			TeacherInfo teacherInfo, Subject subject, List<ClassFeedback> feedback) {
		super();
		this.classId = classId;
		this.ability = ability;
		this.studentGender = studentGender;
		this.teacher = teacher;
		this.teacherInfo = teacherInfo;
		this.subject = subject;
		this.feedback = feedback;
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public TeacherInfo getTeacherInfo() {
		return teacherInfo;
	}

	public void setTeacherInfo(TeacherInfo teacherInfo) {
		this.teacherInfo = teacherInfo;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public List<ClassFeedback> getFeedback() {
		return feedback;
	}

	public void setFeedback(List<ClassFeedback> feedback) {
		this.feedback = feedback;
	}

	public int getAbility() {
		return ability;
	}

	public void setAbility(int ability) {
		this.ability = ability;
	}

	public String getStudentGender() {
		return studentGender;
	}

	public void setStudentGender(String studentGender) {
		this.studentGender = studentGender;
	}

	@Override
	public String toString() {
		return "ClassTeacherDetail [classId=" + classId + ", ability=" + ability + ", studentGender=" + studentGender
				+ ", teacher=" + teacher + ", teacherInfo=" + teacherInfo + ", subject=" + subject + ", feedback="
				+ feedback + "]";
	}

}
