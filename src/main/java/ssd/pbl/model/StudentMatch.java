/**
 * 
 */
package ssd.pbl.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author kimhyunjin
 * @date: Jun 17, 2020 1:42:30 PM
 */
@SuppressWarnings("serial")
public class StudentMatch implements Serializable {
	private Integer id;
	private Integer ability;
	private String teacherGender;
	private String grade;
	private String memo;
	private Integer testResult;
	private List<StudentTimes> times;
	private List<Dong> studentRegion;
	private List<Character> studentCharacter;
	private List<StudentTest> test;
	private Date registeredAt;
	private Date updatedAt;

	public StudentMatch() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getAbility() {
		return ability;
	}

	public void setAbility(Integer ability) {
		this.ability = ability;
	}

	public String getTeacherGender() {
		return teacherGender;
	}

	public void setTeacherGender(String teacherGender) {
		this.teacherGender = teacherGender;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Date getRegisteredAt() {
		return registeredAt;
	}

	public void setRegisteredAt(Date registeredAt) {
		this.registeredAt = registeredAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Integer getTestResult() {
		return testResult;
	}

	public void setTestResult(Integer testResult) {
		this.testResult = testResult;
	}

	public List<Dong> getStudentRegion() {
		return studentRegion;
	}

	public List<StudentTimes> getTimes() {
		return times;
	}

	public void setTimes(List<StudentTimes> times) {
		this.times = times;
	}

	public void setStudentRegion(List<Dong> studentRegion) {
		this.studentRegion = studentRegion;
	}

	public List<Character> getStudentCharacter() {
		return studentCharacter;
	}

	public void setStudentCharacter(List<Character> studentCharacter) {
		this.studentCharacter = studentCharacter;
	}

	public List<StudentTest> getTest() {
		return test;
	}

	public void setTest(List<StudentTest> test) {
		this.test = test;
	}

}
