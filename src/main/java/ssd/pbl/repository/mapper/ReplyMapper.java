package ssd.pbl.repository.mapper;

import java.util.List;

import ssd.pbl.model.Reply;

public interface ReplyMapper {
	List<Reply> selectAllCommentByBoardId(int bId);
	
	void insertComment(Reply reply);
	
	void updateComment(Reply reply);
	
	void deleteComment(int cId);
}
