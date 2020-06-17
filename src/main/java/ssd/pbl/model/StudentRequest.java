/**
 * 
 */
package ssd.pbl.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author kimhyunjin
 * @date: Jun 17, 2020 1:41:22 PM
 */
@SuppressWarnings("serial")
public class StudentRequest implements Serializable {
	private Integer id;
	private String step;
	private Subject subject;
	private Student student;
	private StudentInfo studentInfo;
	private StudentMatch studentMatch;
	private Date registeredAt;

	public StudentRequest() {

	}

	public StudentRequest(Integer id, String step, Subject subject, Student student, StudentInfo studentInfo,
			StudentMatch studentMatch, Date registeredAt) {
		super();
		this.id = id;
		this.step = step;
		this.subject = subject;
		this.student = student;
		this.studentInfo = studentInfo;
		this.studentMatch = studentMatch;
		this.registeredAt = registeredAt;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public StudentInfo getStudentInfo() {
		return studentInfo;
	}

	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}

	public StudentMatch getStudentMatch() {
		return studentMatch;
	}

	public void setStudentMatch(StudentMatch studentMatch) {
		this.studentMatch = studentMatch;
	}

	public Date getRegisteredAt() {
		return registeredAt;
	}

	public void setRegisteredAt(Date registeredAt) {
		this.registeredAt = registeredAt;
	}

}
