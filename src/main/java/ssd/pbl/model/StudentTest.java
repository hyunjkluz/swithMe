/**
 * 
 */
package ssd.pbl.model;

/**
 * @author kimhyunjin
 * @date: Jun 9, 2020 3:16:55 PM
 */
public class StudentTest {
	private SubjectTestPaper studentTestPaper;
	private String studentAnswer;

	public StudentTest() {
	}

	public StudentTest(SubjectTestPaper studentTestPaper, String studentAnswer) {
		super();
		this.studentTestPaper = studentTestPaper;
		this.studentAnswer = studentAnswer;
	}

	public SubjectTestPaper getStudentTestPaper() {
		return studentTestPaper;
	}

	public String getStudentAnswer() {
		return studentAnswer;
	}

	public void setStudentTestPaper(SubjectTestPaper studentTestPaper) {
		this.studentTestPaper = studentTestPaper;
	}

	public void setStudentAnswer(String studentAnswer) {
		this.studentAnswer = studentAnswer;
	}

}
