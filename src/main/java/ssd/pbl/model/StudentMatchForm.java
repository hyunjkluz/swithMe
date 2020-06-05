/**
 * 
 */
package ssd.pbl.model;

import java.util.ArrayList;
import java.util.Arrays;

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
	@Min(value=1, message = "선택한 과목에 대한 난이도를 선택해주세요")
	private int level;
	@NotNull(message = "희망하는 선생님의 성멸을 선택해주세요")
	private String gender;
	@NotNull(message = "희망하는 수업 시간을 선택해주세요")
	private String time;
	private SubjectTestPaper[] testPaper;
	private String gradeMemo;
	private String memo;
	private int teacherId;

	public StudentMatchForm() {
	}

	public StudentMatchForm(int id, @Min(value = 1, message = "과목을 선택해주세요") int subjectId,
			@NotBlank(message = "지역을 하나 이상 선택해주세요") String dongIds, ArrayList<Integer> dongIdArr,
			@Positive(message = "선택한 과목에 대한 난이도를 선택해주세요") int level,
			@NotBlank(message = "희망하는 선생님의 성멸을 선택해주세요") String gender,
			@NotBlank(message = "희망하는 수업 시간을 선택해주세요") String time, SubjectTestPaper[] testPaper, String gradeMemo,
			String memo, int teacherId) {
		super();
		this.id = id;
		this.subjectId = subjectId;
		this.dongIds = dongIds;
		this.dongIdArr = dongIdArr;
		this.level = level;
		this.gender = gender;
		this.time = time;
		this.testPaper = testPaper;
		this.gradeMemo = gradeMemo;
		this.memo = memo;
		this.teacherId = teacherId;
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

	public SubjectTestPaper[] getTestPaper() {
		return testPaper;
	}

	public String getGradeMemo() {
		return gradeMemo;
	}

	public String getMemo() {
		return memo;
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

	public void setTestPaper(SubjectTestPaper[] testPaper) {
		this.testPaper = testPaper;
	}

	public void setGradeMemo(String gradeMemo) {
		this.gradeMemo = gradeMemo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	@Override
	public String toString() {
		return "StudentMatchForm [id=" + id + ", subjectId=" + subjectId + ", dongIds=" + dongIds + ", dongIdArr="
				+ dongIdArr + ", level=" + level + ", gender=" + gender + ", time=" + time + ", testPaper="
				+ Arrays.toString(testPaper) + ", gradeMemo=" + gradeMemo + ", memo=" + memo + ", teacherId="
				+ teacherId + "]";
	}

	
}