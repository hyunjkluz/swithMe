package ssd.pbl.repository.mapper;

import java.util.List;

import ssd.pbl.model.BoardForm;
import ssd.pbl.model.Board;

public interface BoardMapper {
	List<BoardForm> selectBoardList();
	
	BoardForm selectBoardById(int bId);
	
	void insertBoard(Board board);
	
	void updateBoard(Board board);
	
	void deleteBoard(int bId);
}
