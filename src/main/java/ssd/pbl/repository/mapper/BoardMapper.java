package ssd.pbl.repository.mapper;

import java.util.List;

import ssd.pbl.model.Board;
import ssd.pbl.model.BoardForm;

public interface BoardMapper {
	List<Board> selectBoardList();
	
	Board selectBoardById(int bId);
	
	void insertBoard(BoardForm boardForm);
	
	void updateBoard(BoardForm boardForm);
	
	void deleteBoard(int bId);
}
