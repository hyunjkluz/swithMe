/**
 * 
 */
package ssd.pbl.model;

import java.io.Serializable;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:42:52 AM
 */
@SuppressWarnings("serial")
public class SubjectTestPaper implements Serializable {
	private int id;
	private int subjectId;
	private String question;
	private String answer;
	private int ability;

	public SubjectTestPaper() {
	}

	public SubjectTestPaper(int id, int subjectId, String question, String answer, int ability) {
		super();
		this.id = id;
		this.subjectId = subjectId;
		this.question = question;
		this.answer = answer;
		this.ability = ability;
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

	public int getAbility() {
		return ability;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public void setAbility(int ability) {
		this.ability = ability;
	}

}