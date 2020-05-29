/**
 * 
 */
package ssd.pbl.model;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:35:27 AM
 */
public class StudentMatchForm {
	private int id;
	private Subject subject;
	private int level;
	private String gender;
	private String time;
	private Gu[] gu;
	private SubjectTestPaper[] testPaper;
	private String gradeMemo;
	private String memo;
	private int teacherId;

	public StudentMatchForm() {
	}

	public StudentMatchForm(int id, Subject subject, int level, String gender, String time, Gu[] gu,
			SubjectTestPaper[] testPaper, String gradeMemo, String memo, int teacherId) {
		super();
		this.id = id;
		this.subject = subject;
		this.level = level;
		this.gender = gender;
		this.time = time;
		this.gu = gu;
		this.testPaper = testPaper;
		this.gradeMemo = gradeMemo;
		this.memo = memo;
		this.teacherId = teacherId;
	}

	public int getId() {
		return id;
	}

	public Subject getSubject() {
		return subject;
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

	public Gu[] getGu() {
		return gu;
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

	public void setSubject(Subject subject) {
		this.subject = subject;
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

	public void setGu(Gu[] gu) {
		this.gu = gu;
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

}
