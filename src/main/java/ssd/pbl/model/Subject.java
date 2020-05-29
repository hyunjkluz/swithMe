/**
 * 
 */
package ssd.pbl.model;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:40:09 AM
 */
public class Subject {
	private int id;
	private String name;
	private String category;

	public Subject() {
	}

	public Subject(int id, String name, String category) {
		super();
		this.id = id;
		this.name = name;
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getCategory() {
		return category;
	}

}
