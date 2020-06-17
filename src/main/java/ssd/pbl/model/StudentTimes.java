/**
 * 
 */
package ssd.pbl.model;

import java.io.Serializable;

/**
 * @author kimhyunjin
 * @date: Jun 16, 2020 9:21:18 PM
 */
@SuppressWarnings("serial")
public class StudentTimes implements Serializable {
	private Integer id;
	private Integer studentMatch;
	private String time;

	public StudentTimes() {
	}

	public StudentTimes(Integer id, String time) {
		super();
		this.id = id;
		this.time = time;
	}

	public StudentTimes(Integer id, Integer studentMatch, String time) {
		super();
		this.id = id;
		this.studentMatch = studentMatch;
		this.time = time;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStudentMatch() {
		return studentMatch;
	}

	public void setStudentMatch(Integer studentMatch) {
		this.studentMatch = studentMatch;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "TeacherTimes [id=" + id + ", studentMatch=" + studentMatch + ", time=" + time + "]";
	}

}
