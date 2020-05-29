package ssd.pbl.controller;

import java.io.File;

public class UserSession {
	private String type;
	private String id;
	private String name;
	private File profileImg;
	
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
	
	
}
