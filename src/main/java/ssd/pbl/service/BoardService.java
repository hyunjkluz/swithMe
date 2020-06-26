package ssd.pbl.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.model.BoardForm;
import ssd.pbl.model.Board;
import ssd.pbl.repository.mapper.BoardMapperRepository;


@Service
public class BoardService {
	@Autowired
	private BoardMapperRepository boardMapperRepository;

	public List<BoardForm> getBoardlist(int connectionId, String category) {
		return  boardMapperRepository.selectBoardList(connectionId, category);
	}
	
	public Board getBoard(int bId) {
		return boardMapperRepository.selectBoardById(bId);
	}
	
	public void createBoard(Board board) {
		boardMapperRepository.insertBoard(board);
	}

	public void deleteBoard(int boardId) {
		boardMapperRepository.deleteBoard(boardId);
	}
	
	public void updateBoard(int boardId, BoardForm boardForm) {
		boardMapperRepository.updateBoard(boardId, boardForm);
	}
}
