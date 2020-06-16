/**
 * 
 */
package ssd.pbl.model;

import java.io.Serializable;

/**
 * @author kimhyunjin
 * @date: Jun 16, 2020 9:22:23 PM
 */
@SuppressWarnings("serial")
public class TeacherCharacter implements Serializable {
	private Integer id;
	private Integer teachermatch;
	private Integer character;

	public TeacherCharacter(Integer id, Integer teachermatch, Integer character) {
		super();
		this.id = id;
		this.teachermatch = teachermatch;
		this.character = character;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTeachermatch() {
		return teachermatch;
	}

	public void setTeachermatch(Integer teachermatch) {
		this.teachermatch = teachermatch;
	}

	public Integer getCharacter() {
		return character;
	}

	public void setCharacter(Integer character) {
		this.character = character;
	}

	@Override
	public String toString() {
		return "TeacherCharacter [id=" + id + ", teachermatch=" + teachermatch + ", character=" + character + "]";
	}

}
