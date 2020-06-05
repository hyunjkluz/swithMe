/**
 * 
 */
package ssd.pbl.model;

import java.io.Serializable;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:57:30 AM
 */
@SuppressWarnings("serial")
public class Dong implements Serializable{
	private int id;
	private String name;
	private Gu gu;

	public Dong() {
	}

	public Dong(int id, String name, Gu gu) {
		this.id = id;
		this.name = name;
		this.gu = gu;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public Gu getGu() {
		return gu;
	}

}
