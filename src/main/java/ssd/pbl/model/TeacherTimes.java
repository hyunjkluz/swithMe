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
public class TeacherTimes implements Serializable {
	private Integer id;
	private Integer teacherMatch;
	private String time;

	public TeacherTimes() {
	}

	public TeacherTimes(Integer id, String time) {
		super();
		this.id = id;
		this.time = time;
	}

	public TeacherTimes(Integer id, Integer teachermatch, String time) {
		super();
		this.id = id;
		this.teacherMatch = teachermatch;
		this.time = time;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTeacherMatch() {
		return teacherMatch;
	}

	public void setTeacherMatch(Integer teachermatch) {
		this.teacherMatch = teachermatch;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "TeacherTimes [id=" + id + ", teachermatch=" + teacherMatch + ", time=" + time + "]";
	}

}
