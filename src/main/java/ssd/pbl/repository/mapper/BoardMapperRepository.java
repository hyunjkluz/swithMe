package ssd.pbl.repository.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssd.pbl.model.Board;
import ssd.pbl.model.BoardForm;
import ssd.pbl.model.Reply;
@Repository
public class BoardMapperRepository {
	@Autowired
	private BoardMapper boardMapper;

	public List<Board> selectBoardList() {
		return boardMapper.selectBoardList();
	}
	
	public Board selectBoardById(int bId) {
		return boardMapper.selectBoardById(bId);//boardMap.get(bId);
	}
	
	public void insertBoard(BoardForm boardForm) {
		boardMapper.insertBoard(boardForm);
	}
	
	public void updateBoard(BoardForm boardForm) {
		boardMapper.updateBoard(boardForm);
	}
	
	public void deleteBoard(int bId) {
		boardMapper.deleteBoard(bId);
	}
	
	private ReplyMapper replyMapper;
	
	public List<Reply> selectAllCommentByBoardId(int bId) {
		return replyMapper.selectAllCommentByBoardId(bId);
	}
	
	public void insertComment(Reply reply) {
		replyMapper.insertComment(reply);
	}
	
	public void updateComment(Reply reply) {
		replyMapper.updateComment(reply);
	}
	
	public void deleteComment(int cId) {
		replyMapper.deleteComment(cId);
	}
}
