package ssd.pbl.domain;

import java.util.Date;

public class Board {
	private int bId;
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	private String title;
	private String type;
	private String content;
	//private String file;
	private int writerId;
	private int writerType;
	private Date creationDate;
	

	public Board(int bId, String title, String type, String content,int writerId, int writerType,
			Date creationDate) {
		super();
		this.bId = bId;
		this.title = title;
		this.type = type;
		this.content = content;
		//this.file = file;
		this.writerId = writerId;
		this.writerType = writerType;
		this.creationDate = creationDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	/*
	 * public String getFile() { return file; } 
	 * public void setFile(String file) {
	 * this.file = file; }
	 */
	public int getWriterId() {
		return writerId;
	}
	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}
	public int getWriterType() {
		return writerType;
	}
	public void setWriterType(int writerType) {
		this.writerType = writerType;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	@Override
	public String toString() {
		return "Board [title=" + title + ", type=" + type + ", content=" + content +  ", writerId="
				+ writerId + ", writerType=" + writerType + ", registeredDate=" + creationDate + "]";
	}
	
}
