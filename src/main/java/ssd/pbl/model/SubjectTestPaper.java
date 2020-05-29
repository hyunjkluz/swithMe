/**
 * 
 */
package ssd.pbl.model;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:42:52 AM
 */
public class SubjectTestPaper {
	private int id;
	private int subjectId;
	private String question;
	private String answer;
	private int level;

	public SubjectTestPaper(int id, int subjectId, String question, String answer, int level) {
		super();
		this.id = id;
		this.subjectId = subjectId;
		this.question = question;
		this.answer = answer;
		this.level = level;
	}

	public int getId() {
		return id;
	}

	public int getSubjectId() {
		return subjectId;
	}

	public String getQuestion() {
		return question;
	}

	public String getAnswer() {
		return answer;
	}

	public int getLevel() {
		return level;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

}
