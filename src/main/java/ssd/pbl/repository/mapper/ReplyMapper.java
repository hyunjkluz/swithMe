package ssd.pbl.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ssd.pbl.model.Reply;

public interface ReplyMapper {
	List<Reply> selectAllReplyByBoardId(int bId);
	
	void insertReply(Reply reply);
	
	void updateReply(@Param("replyId")int replyId, @Param("content")String content);
	
	void deleteReply(@Param("replyId")int replyId);
}
