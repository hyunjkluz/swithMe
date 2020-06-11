/**
 * 
 */
package ssd.pbl.model;

import java.io.Serializable;

/**
 * @author kimhyunjin
 * @date: Jun 11, 2020 11:45:16 PM
 */
@SuppressWarnings("serial")
public class ClassCard implements Serializable {
	private int classId;
	private Teacher teacher;
	private TeacherInfo teacherInfo;
	private Subject subject;

	public ClassCard() {

	}

	public ClassCard(int classId, Teacher teacher, TeacherInfo teacherInfo, Subject subject) {
		super();
		this.classId = classId;
		this.teacher = teacher;
		this.teacherInfo = teacherInfo;
		this.subject = subject;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
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

	@Override
	public String toString() {
		return "ClassCard [classId=" + classId + ", teacher=" + teacher + ", teacherInfo=" + teacherInfo + ", subject="
				+ subject + "]";
	}

}
