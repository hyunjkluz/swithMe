package ssd.pbl.model;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class Reply implements Serializable{
	int relpyId;
	String content;
	int boardId;
	int writerId;
	String writerType;
	Date registerdAt;
	Date updatedAt;
	public int getRelpyId() {
		return relpyId;
	}
	public void setRelpyId(int relpyId) {
		this.relpyId = relpyId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public int getWriterId() {
		return writerId;
	}
	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}
	public String getWriterType() {
		return writerType;
	}
	public void setWriterType(String writerType) {
		this.writerType = writerType;
	}
	public Date getRegisterdAt() {
		return registerdAt;
	}
	public void setRegisterdAt(Date registerdAt) {
		this.registerdAt = registerdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
}
