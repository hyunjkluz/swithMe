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

	public List<BoardForm> getBoardlist() {
		return  boardMapperRepository.selectBoardList();
	}
	
	public BoardForm getBoard(int bId) {
		return boardMapperRepository.selectBoardById(bId);
	}
	
	public void createBoard(Board board) {
		boardMapperRepository.insertBoard(board);
	}
	
	public void editBoard(Board board) {
		boardMapperRepository.updateBoard(board);
	}

	public void deleteBoard(int bid) {
		boardMapperRepository.deleteBoard(bid);
	}
	
	public void updateBoard(Board board) {
		boardMapperRepository.updateBoard(board);
	}
}
