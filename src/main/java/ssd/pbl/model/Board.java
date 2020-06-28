package ssd.pbl.model;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class Board implements Serializable{
	private int boardId;
	private int connectionId;
	public BoardForm boardForm;
	private int writerId;
	private String writerType;
	private Date creationDate;
	
	public Board() {
		super();
	}
	public Board(int boardId, int connectionId, BoardForm boardForm, int writerId, String writerType,
			Date creationDate) {
		super();
		this.boardId = boardId;
		this.connectionId = connectionId;
		this.boardForm = boardForm;
		this.writerId = writerId;
		this.writerType = writerType;
		this.creationDate = creationDate;
	}
	public Board(int connectionId, BoardForm boardForm, int id, String type) {
		this.connectionId = connectionId;
		this.boardForm = boardForm;
		this.writerId = id;
		this.writerType = type;
	}
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
	public String getWriterType() {
		return writerType;
	}
	public void setWriterType(String writerType) {
		this.writerType = writerType;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	
}
