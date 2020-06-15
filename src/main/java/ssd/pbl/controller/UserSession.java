package ssd.pbl.controller;

import java.io.File;

public class UserSession {
	private String type;
	private String email;
	private String name;
	private File profileImg;
	
	public UserSession() {}
	
	public UserSession(String email) {
		super();
		this.email = email;
	}
	
	public UserSession(String type, String id, String name, File profileImg) {
		super();
		this.type = type;
		this.email = email;
		this.name = name;
		this.profileImg = profileImg;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return email;
	}
	public void setId(String id) {
		this.email = id;
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
	
	
}
