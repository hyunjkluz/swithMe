package ssd.pbl.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ssd.pbl.model.BoardForm;
import ssd.pbl.model.Board;

public interface BoardMapper {
	List<BoardForm> selectBoardList(@Param("connectionId")int connectionId, @Param("category")String category);
	
	Board selectBoardById(int bId);
	
	void insertBoard(Board board);
	
	void updateBoard(@Param("boardId")int boardId, @Param("boardForm")BoardForm boardForm);
	
	void deleteBoard(@Param("boardId")int boardId);
}
