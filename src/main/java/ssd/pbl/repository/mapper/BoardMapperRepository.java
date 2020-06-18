package ssd.pbl.repository.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssd.pbl.model.BoardForm;
import ssd.pbl.model.Board;
import ssd.pbl.model.Reply;
@Repository
public class BoardMapperRepository {
	@Autowired
	private BoardMapper boardMapper;

	public List<BoardForm> selectBoardList(int connectionId) {
		return boardMapper.selectBoardList(connectionId);
	}
	
	public Board selectBoardById(int bId) {
		return boardMapper.selectBoardById(bId);//boardMap.get(bId);
	}
	
	public void insertBoard(Board board) {
		boardMapper.insertBoard(board);
	}
	
	public void updateBoard(int boardId, BoardForm boardForm) {
		boardMapper.updateBoard(boardId, boardForm);
	}
	
	public void deleteBoard(int boardId) {
		boardMapper.deleteBoard(boardId);
	}
	
	private ReplyMapper replyMapper;
	
	public List<Reply> selectAllReplyByBoardId(int bId) {
		return replyMapper.selectAllReplyByBoardId(bId);
	}
	
	public void insertReply(Reply reply) {
		replyMapper.insertReply(reply);
	}
	
	public void updateReply(Reply reply) {
		replyMapper.updateReply(reply);
	}
	
	public void deleteReply(int cId) {
		replyMapper.deleteReply(cId);
	}
}
