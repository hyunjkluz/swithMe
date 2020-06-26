package ssd.pbl.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import ssd.pbl.model.Reply;
import ssd.pbl.service.ReplyService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/board/{boardId}/reply")
public class ReplyController{
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);

	@Autowired
	private ReplyService replyService;

	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	public List<Reply> getReplyList(@PathVariable("boardId") int boardId) throws Exception{
		logger.info("ReplyController-getReplyList"+boardId);
		List<Reply> replyList = replyService.getAllReply(boardId);
		logger.info("ReplyController-getReplyList"+replyList);
		return replyList;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveReply(@RequestBody String content,
			@PathVariable("boardId") int boardId, 
			HttpSession session) throws Exception {
		Map<String, Object> result = new HashMap<>();
		UserSession userSession= (UserSession) session.getAttribute("userSession");
		int writerId = userSession.getId();
		String writerType = userSession.getType();
		Reply reply = new Reply(content, boardId, writerId, writerType);
		
		try {
			replyService.saveReply(reply);
			result.put("status", "OK");
			logger.info("ReplyController-saveReply"+result.toString());
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}

		return result;
	}
	
	@ResponseBody
	@RequestMapping(value ="/{replyId}/delete")
	public void deleteReply(@PathVariable("replyId") int replyId) throws Exception{
		replyService.deleteReply(replyId);
	}
	
	@ResponseBody
	@RequestMapping(value ="/{replyId}/update")
	public void updateReply(@ModelAttribute("reply") Reply reply) throws Exception{
		replyService.editReply(reply);
	}
}
