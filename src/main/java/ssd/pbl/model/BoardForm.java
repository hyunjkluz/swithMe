package ssd.pbl.model;

import org.springframework.web.multipart.MultipartFile;

public class BoardForm {
	private String title;
	private String type;
	private String content;
	//private MultipartFile upload;
	private String upload;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	//public MultipartFile getUpload() { return upload; } 
	//public void setUpload(MultipartFile upload) { this.upload = upload; }
	 
	
	public String getUpload() {
		return upload;
	}
	public void setUpload(String upload) {
		this.upload = upload;
	}
	
	@Override
	public String toString() {
		return "BoardForm [title=" + title + ", type=" + type + ", content=" + content + ", upload=" + upload + "]";
	}
	
}
