package ssd.pbl.model;

public class SubjectLevel {
	
	private Subject subject;
	private int level;
	
	public SubjectLevel() {
		
	}
	
	public SubjectLevel(Subject subject, int level) {
		super();
		this.subject = subject;
		this.level = level;
	}
	
	public int getLevel() {
		return level;
	}

	public Subject getSubject() {
		return subject;
	}
	
	public void setLevel(int level) {
		this.level = level;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

}
