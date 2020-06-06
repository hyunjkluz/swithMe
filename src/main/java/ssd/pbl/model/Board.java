package ssd.pbl.model;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class Board implements Serializable{
	private int boardId;
	private int connectionId;
	private BoardForm boardForm;
	private int writerId;
	private int writerType;
	private Date creationDate;
	
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public int getConnectionId() {
		return connectionId;
	}
	public void setConnectionId(int connectionId) {
		this.connectionId = connectionId;
	}
	public BoardForm getBoardForm() {
		return boardForm;
	}
	public void setBoardForm(BoardForm boardForm) {
		this.boardForm = boardForm;
	}
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
	
}
