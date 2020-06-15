/**
 * 
 */
package ssd.pbl.model;

import java.io.Serializable;

/**
 * @author kimhyunjin
 * @date: Jun 12, 2020 12:28:24 AM
 */
@SuppressWarnings("serial")
public class Major implements Serializable {
	private Integer id;
	private String name;
	private University university;

	public Major() {
	}

	public Major(Integer id, String name, University university) {
		super();
		this.id = id;
		this.name = name;
		this.university = university;
	}

	public Integer getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public University getUniversity() {
		return university;
	}

}
