package ssd.pbl.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.model.Board;
import ssd.pbl.model.BoardForm;
import ssd.pbl.repository.mapper.BoardMapperRepository;


@Service
public class BoardService {
	@Autowired
	private BoardMapperRepository boardMapperRepository;

	public List<Board> getBoardlist() {
		return  boardMapperRepository.selectBoardList();
	}
	
	public Board getBoard(int bId) {
		return boardMapperRepository.selectBoardById(bId);
	}
	
	public void createBoard(BoardForm boardForm) {
		boardMapperRepository.insertBoard(boardForm);
	}
	
	public void editBoard(BoardForm boardForm) {
		boardMapperRepository.updateBoard(boardForm);
	}

	public void deleteBoard(int bid) {
		boardMapperRepository.deleteBoard(bid);
	}
	
	public void updateBoard(BoardForm boardForm) {
		boardMapperRepository.updateBoard(boardForm);
	}
}
