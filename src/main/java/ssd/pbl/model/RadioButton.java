/**
 * 
 */
package ssd.pbl.model;

/**
 * @author kimhyunjin
 * @date: Jun 10, 2020 1:48:57 PM
 */
public class RadioButton {
	private String name;
	private int intVal;
	private String stringVal;

	public RadioButton() {

	}

	public RadioButton(String name, int intVal, String stringVal) {
		super();
		this.name = name;
		this.intVal = intVal;
		this.stringVal = stringVal;
	}

	public String getName() {
		return name;
	}

	public int getIntVal() {
		return intVal;
	}

	public String getStringVal() {
		return stringVal;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setIntVal(int intVal) {
		this.intVal = intVal;
	}

	public void setStringVal(String stringVal) {
		this.stringVal = stringVal;
	}

}
