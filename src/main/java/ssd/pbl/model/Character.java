/**
 * 
 */
package ssd.pbl.model;

import java.io.Serializable;

/**
 * @author kimhyunjin
 * @date: Jun 9, 2020 3:45:48 PM
 */
@SuppressWarnings("serial")
public class Character implements Serializable {
	private int id;
	private String name;
	private String description;

	public Character() {
	}

	public Character(int id, String name, String description) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getDescription() {
		return description;
	}

}
