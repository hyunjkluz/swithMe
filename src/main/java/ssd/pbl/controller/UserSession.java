package ssd.pbl.controller;

import java.io.File;

public class UserSession {
	private String type;
	private String email;
	private String name;
	private File profileImg;
	private String id;
	private String step;
	
	public UserSession() {}
	
	public UserSession(String email) {
		super();
		this.email = email;
	}
	
	public UserSession(String type, String email, String name, File profileImg, String id, String step) {
		super();
		this.type = type;
		this.email = email;
		this.name = name;
		this.profileImg = profileImg;
		this.id = id;
		this.step = step;
	}

	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public File getProfileImg() {
		return profileImg;
	}
	
	public void setProfileImg(File profileImg) {
		this.profileImg = profileImg;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}
	
	
}
