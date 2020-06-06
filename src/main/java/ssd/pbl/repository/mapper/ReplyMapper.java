package ssd.pbl.repository.mapper;

import java.util.List;

import ssd.pbl.model.Reply;

public interface ReplyMapper {
	List<Reply> selectAllReplyByBoardId(int bId);
	
	void insertReply(Reply reply);
	
	void updateReply(Reply reply);
	
	void deleteReply(int cId);
}
