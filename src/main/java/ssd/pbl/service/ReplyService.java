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
	
	public List<Reply> getAllReply(int bId) {
		return replyMapperRepository.selectAllReplyByBoardId(bId);
	}
	
	public void saveReply(Reply reply) {
		replyMapperRepository.insertReply(reply);
	}
	
	public void editReply(int replyId, String content) {
		replyMapperRepository.updateReply(replyId, content);
	}
	
	public void deleteReply(int replyId) {
		replyMapperRepository.deleteReply(replyId);
	}
	
}
