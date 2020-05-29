/**
 * 
 */
package ssd.pbl.model;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:57:25 AM
 */
public class Gu {
	private int id;
	private String name;
	private Sido sido;

	public Gu() {
	}

	public Gu(int id, String name, Sido sido) {
		this.id = id;
		this.name = name;
		this.sido = sido;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public Sido getSido() {
		return sido;
	}

}
