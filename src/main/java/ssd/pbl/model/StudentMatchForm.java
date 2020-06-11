/**
 * 
 */
package ssd.pbl.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:35:27 AM
 */
public class StudentMatchForm {
	private int id;
	@Min(value = 1, message = "과목을 선택해주세요")
	private int subjectId;
	@NotBlank(message = "지역을 하나 이상 선택해주세요")
	private String dongIds;
	private ArrayList<Integer> dongIdArr;
	@Min(value = 1, message = "선택한 과목에 대한 난이도를 선택해주세요")
	private int level;
	@NotNull(message = "희망하는 선생님의 성멸을 선택해주세요")
	private String gender;
	@NotNull(message = "희망하는 수업 시간을 선택해주세요")
	private String time;
	private List<StudentTest> subjectTest; // 과목별 시험지와 답

	private String ch1, ch2, ch3, ch4, ch5;
	private String memo;
	private String toTeacher;
	private int teacherId;

	public StudentMatchForm() {
	}

	public int getId() {
		return id;
	}

	public int getSubjectId() {
		return subjectId;
	}

	public String getDongIds() {
		return dongIds;
	}

	public ArrayList<Integer> getDongIdArr() {
		return dongIdArr;
	}

	public int getLevel() {
		return level;
	}

	public String getGender() {
		return gender;
	}

	public String getTime() {
		return time;
	}

	public List<StudentTest> getSubjectTest() {
		return subjectTest;
	}

	public String getCh1() {
		return ch1;
	}

	public String getCh2() {
		return ch2;
	}

	public String getCh3() {
		return ch3;
	}

	public String getCh4() {
		return ch4;
	}

	public String getCh5() {
		return ch5;
	}

	public String getMemo() {
		return memo;
	}

	public String getToTeacher() {
		return toTeacher;
	}

	public int getTeacherId() {
		return teacherId;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public void setDongIds(String dongIds) {
		this.dongIds = dongIds;
	}

	public void setDongIdArr(ArrayList<Integer> dongIdArr) {
		this.dongIdArr = dongIdArr;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public void setSubjectTest(List<StudentTest> subjectTest) {
		this.subjectTest = subjectTest;
	}

	public void setCh1(String ch1) {
		this.ch1 = ch1;
	}

	public void setCh2(String ch2) {
		this.ch2 = ch2;
	}

	public void setCh3(String ch3) {
		this.ch3 = ch3;
	}

	public void setCh4(String ch4) {
		this.ch4 = ch4;
	}

	public void setCh5(String ch5) {
		this.ch5 = ch5;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public void setToTeacher(String toTeacher) {
		this.toTeacher = toTeacher;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	public StudentMatchForm(int id, @Min(value = 1, message = "과목을 선택해주세요") int subjectId,
			@NotBlank(message = "지역을 하나 이상 선택해주세요") String dongIds, ArrayList<Integer> dongIdArr,
			@Min(value = 1, message = "선택한 과목에 대한 난이도를 선택해주세요") int level,
			@NotNull(message = "희망하는 선생님의 성멸을 선택해주세요") String gender,
			@NotNull(message = "희망하는 수업 시간을 선택해주세요") String time, List<StudentTest> subjectTest, String ch1, String ch2,
			String ch3, String ch4, String ch5, String memo, String toTeacher, int teacherId) {
		super();
		this.id = id;
		this.subjectId = subjectId;
		this.dongIds = dongIds;
		this.dongIdArr = dongIdArr;
		this.level = level;
		this.gender = gender;
		this.time = time;
		this.subjectTest = subjectTest;
		this.ch1 = ch1;
		this.ch2 = ch2;
		this.ch3 = ch3;
		this.ch4 = ch4;
		this.ch5 = ch5;
		this.memo = memo;
		this.toTeacher = toTeacher;
		this.teacherId = teacherId;
	}

	@Override
	public String toString() {
		return "StudentMatchForm [id=" + id + ", subjectId=" + subjectId + ", dongIds=" + dongIds + ", dongIdArr="
				+ dongIdArr + ", level=" + level + ", gender=" + gender + ", time=" + time + ", subjectTest="
				+ subjectTest + ", ch1=" + ch1 + ", ch2=" + ch2 + ", ch3=" + ch3 + ", ch4=" + ch4 + ", ch5=" + ch5
				+ ", memo=" + memo + ", toTeacher=" + toTeacher + ", teacherId=" + teacherId + "]";
	}

}