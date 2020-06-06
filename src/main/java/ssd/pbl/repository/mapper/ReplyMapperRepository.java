package ssd.pbl.repository.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssd.pbl.model.Reply;
@Repository
public class ReplyMapperRepository {
	@Autowired
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
	
	public void deleteComment(int cId) {
		replyMapper.deleteReply(cId);
	}
	
}
