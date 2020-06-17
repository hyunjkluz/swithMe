/**
 * 
 */
package ssd.pbl.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author kimhyunjin
 * @date: Jun 17, 2020 1:42:19 PM
 */
@SuppressWarnings("serial")
public class Student implements Serializable {
	private Integer id;
	private String email;
	private String name;
	private String phone;
	private String step;
	private Date regieteredAt;
	private Date updatedAt;

	public Student() {
	}

	public Student(Integer id, String name, String phone) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	public Date getRegieteredAt() {
		return regieteredAt;
	}

	public void setRegieteredAt(Date regieteredAt) {
		this.regieteredAt = regieteredAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

}
