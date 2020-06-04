/**
 * 
 */
package ssd.pbl.model;

import java.io.Serializable;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:57:15 AM
 */
@SuppressWarnings("serial")
public class Sido implements Serializable {
	private int id;
	private String name;

	public Sido() {
	}

	public Sido(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

}
