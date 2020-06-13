package ssd.pbl.model;

import java.util.ArrayList;
import java.util.List;

public class TeacherMatchForm {
	private int id;
	private int subjectId;
	private String subjectName;
	private String gender;
	private int level;
	private String dongIds;
	private ArrayList<Integer> dongIdArr;
	private List<String> time;
	private int ch1, ch2, ch3, ch4, ch5;
	private String intro1;
	private String intro2;

	public TeacherMatchForm() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public List<String> getTime() {
		return time;
	}

	public void setTime(List<String> time) {
		this.time = time;
	}

	public String getIntro1() {
		return intro1;
	}

	public void setIntro1(String intro1) {
		this.intro1 = intro1;
	}

	public String getIntro2() {
		return intro2;
	}

	public void setIntro2(String intro2) {
		this.intro2 = intro2;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public ArrayList<Integer> getDongIdArr() {
		return dongIdArr;
	}

	public void setDongIdArr(ArrayList<Integer> dongIdArr) {
		this.dongIdArr = dongIdArr;
	}

	public String getDongIds() {
		return dongIds;
	}

	public void setDongIds(String dongIds) {
		this.dongIds = dongIds;
	}

	public int getCh1() {
		return ch1;
	}

	public void setCh1(int ch1) {
		this.ch1 = ch1;
	}

	public int getCh2() {
		return ch2;
	}

	public void setCh2(int ch2) {
		this.ch2 = ch2;
	}

	public int getCh3() {
		return ch3;
	}

	public void setCh3(int ch3) {
		this.ch3 = ch3;
	}

	public int getCh4() {
		return ch4;
	}

	public void setCh4(int ch4) {
		this.ch4 = ch4;
	}

	public int getCh5() {
		return ch5;
	}

	public void setCh5(int ch5) {
		this.ch5 = ch5;
	}

	@Override
	public String toString() {
		return "TeacherMatchForm [id=" + id + ", subjectId=" + subjectId + ", subjectName=" + subjectName + ", dongIds=" + dongIds + ", dongIdArr="
				+ dongIdArr + ", level=" + level + ", gender=" + gender + ", time=" + time + ", ch1=" + ch1 + ", ch2=" + ch2 + ", ch3=" + ch3 + ", ch4=" + ch4 + ", ch5=" + ch5
				+ ", intro1=" + intro1 + ", intro2=" + intro2 + "]";
	}

}