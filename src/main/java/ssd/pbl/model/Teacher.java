/**
 * 
 */
package ssd.pbl.model;

import java.io.Serializable;

/**
 * @author kimhyunjin
 * @date: Jun 11, 2020 11:45:48 PM
 */
@SuppressWarnings("serial")
public class Teacher implements Serializable {
	private Integer id;
	private String email;
	private String name;
	private String rank;
	private Double rate;
	private String phone;
	private String step;
	private TeacherInfo teacherInfo;
	// TeacherMatch 추후 추가

	public Teacher() {
	}

	public Teacher(Integer id, String email, String name, String rank, Double rate, String phone, String step,
			TeacherInfo teacherInfo) {
		super();
		this.id = id;
		this.email = email;
		this.name = name;
		this.rank = rank;
		this.rate = rate;
		this.phone = phone;
		this.step = step;
		this.teacherInfo = teacherInfo;
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

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
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

	public TeacherInfo getTeacherInfo() {
		return teacherInfo;
	}

	public void setTeacherInfo(TeacherInfo teacherInfo) {
		this.teacherInfo = teacherInfo;
	}

	@Override
	public String toString() {
		return "Teacher [id=" + id + ", email=" + email + ", name=" + name + ", rank=" + rank + ", rate=" + rate
				+ ", phone=" + phone + ", step=" + step + ", teacherInfo=" + teacherInfo + "]";
	}

}
