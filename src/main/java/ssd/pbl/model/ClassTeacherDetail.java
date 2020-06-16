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
	private TeacherMatch teacherMatch;
	private List<Dong> teacherRegion;
	private List<Character> teacherCharacter;
	private List<TeacherTimes> teacherTimes;
	private Subject subject;
	private List<ClassFeedback> feedback;

	public ClassTeacherDetail() {
	}

	public ClassTeacherDetail(Integer classId, int ability, String studentGender, Teacher teacher,
			TeacherInfo teacherInfo, TeacherMatch teacherMatch, List<Dong> teacherRegion,
			List<Character> teacherCharacter, List<TeacherTimes> teacherTimes, Subject subject,
			List<ClassFeedback> feedback) {
		super();
		this.classId = classId;
		this.ability = ability;
		this.studentGender = studentGender;
		this.teacher = teacher;
		this.teacherInfo = teacherInfo;
		this.teacherMatch = teacherMatch;
		this.teacherRegion = teacherRegion;
		this.teacherCharacter = teacherCharacter;
		this.teacherTimes = teacherTimes;
		this.subject = subject;
		this.feedback = feedback;
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
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

	public TeacherMatch getTeacherMatch() {
		return teacherMatch;
	}

	public void setTeacherMatch(TeacherMatch teacherMatch) {
		this.teacherMatch = teacherMatch;
	}

	public List<Dong> getTeacherRegion() {
		return teacherRegion;
	}

	public void setTeacherRegion(List<Dong> teacherRegion) {
		this.teacherRegion = teacherRegion;
	}

	public List<Character> getTeacherCharacter() {
		return teacherCharacter;
	}

	public void setTeacherCharacter(List<Character> teacherCharacter) {
		this.teacherCharacter = teacherCharacter;
	}

	public List<TeacherTimes> getTeacherTimes() {
		return teacherTimes;
	}

	public void setTeacherTimes(List<TeacherTimes> teacherTimes) {
		this.teacherTimes = teacherTimes;
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

	@Override
	public String toString() {
		return "ClassTeacherDetail [classId=" + classId + ", ability=" + ability + ", studentGender=" + studentGender
				+ ", teacher=" + teacher.toString() + ", teacherInfo=" + teacherInfo.toString() + ", teacherMatch=" + teacherMatch.toString()
				+ ", teacherRegion=" + teacherRegion.toString() + ", teacherCharacter=" + teacherCharacter.toString() + ", teacherTimes="
				+ teacherTimes.toString() + ", subject=" + subject.toString() + ", feedback=" + feedback + "]";
	}

}
