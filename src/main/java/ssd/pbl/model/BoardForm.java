package ssd.pbl.model;

import java.util.Date;

public class BoardForm {
	private Board board;
	private int writer;
	private int writerType;
	private Date creationDate;
	
	public Board getBoard() {
		return board;
	}
	public void setBoard(Board board) {
		this.board = board;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
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
