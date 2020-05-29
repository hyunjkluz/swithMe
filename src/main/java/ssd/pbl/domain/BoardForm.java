package ssd.pbl.domain;

import java.io.File;

public class BoardForm {
	private String title;
	private String content;
	private String boardType;
	
	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	//file
	private File file;
}
