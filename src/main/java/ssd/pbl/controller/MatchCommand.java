package ssd.pbl.controller;

import ssd.pbl.model.Gu;
import ssd.pbl.model.SubjectLevel;
import ssd.pbl.model.TeacherMatchForm;

public class MatchCommand {
	private int id;
	private SubjectLevel[] level;
	private String gender;
	private String time;
	private Gu[] gu;
	private String intro1;
	private String intro2;
	
	public MatchCommand(TeacherMatchForm tm) {
		if(tm != null) {
			id = tm.getId();
			level = tm.getSubjectLevel();
			gender = tm.getGender();
			time = tm.getTime();
			gu = tm.getGu();
			intro1 = tm.getIntro1();
			intro2 = tm.getIntro2();
		}
	}
	
	public MatchCommand() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public SubjectLevel[] getLevel() {
		return level;
	}

	public void setLevel(SubjectLevel[] level) {
		this.level = level;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Gu[] getGu() {
		return gu;
	}

	public void setGu(Gu[] gu) {
		this.gu = gu;
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

}
