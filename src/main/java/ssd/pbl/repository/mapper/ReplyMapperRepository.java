package ssd.pbl.repository.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssd.pbl.model.Reply;
@Repository
public class ReplyMapperRepository {
	@Autowired
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
