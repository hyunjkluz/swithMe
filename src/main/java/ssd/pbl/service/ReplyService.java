package ssd.pbl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.model.Reply;
import ssd.pbl.repository.mapper.ReplyMapperRepository;

@Service
public class ReplyService {
	@Autowired
	private ReplyMapperRepository replyMapperRepository;
	
	public List<Reply> getAllComment(int bId) {
		return replyMapperRepository.selectAllCommentByBoardId(bId);
	}
	
	public void createComment(Reply reply) {
		replyMapperRepository.insertComment(reply);
	}
	
	public void editComment(Reply reply) {
		replyMapperRepository.updateComment(reply);
	}
	
	public void deleteComment(int cId) {
		replyMapperRepository.deleteComment(cId);
	}
	
}
