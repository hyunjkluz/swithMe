package ssd.pbl.model;

public class TeacherMatchForm {
	private int id;
	private SubjectLevel[] level;
	private String gender;
	private String time;
	private Gu[] gu;
	private String intro1;
	private String intro2;
	
	public TeacherMatchForm() {
	}

	public TeacherMatchForm(int id, SubjectLevel[] level, String gender, String time, Gu[] gu, String intro1, String intro2) {
		super();
		this.id = id;
		this.level = level;
		this.gender = gender;
		this.time = time;
		this.gu = gu;
		this.intro1 = intro1;
		this.intro2 = intro2;
	}

	public int getId() {
		return id;
	}
	
	public SubjectLevel[] getSubjectLevel() {
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
	
	public String getIntro1() {
		return intro1;
	}
	
	public String getIntro2() {
		return intro2;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setSubjectLevel(SubjectLevel[] level) {
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
	
	public void setIntro1(String intro1) {
		this.intro1 = intro1;
	}
	
	public void setIntro2(String intro2) {
		this.intro2 = intro2;
	}


}
