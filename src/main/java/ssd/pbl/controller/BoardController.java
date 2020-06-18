package ssd.pbl.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ssd.pbl.model.Board;
import ssd.pbl.model.BoardForm;
import ssd.pbl.model.Reply;
import ssd.pbl.service.BoardService;
import ssd.pbl.service.ReplyService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/connection/{connectionId}")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyService replyService;
	
	//나의 수업 -> 강의실 입장
	@RequestMapping(value = "/board/main", method = RequestMethod.GET)
	public String getMyBoard(@PathVariable("connectionId") int connectionId, Model model) {
		logger.info("BoardController-MyClass");
		model.addAttribute("boardList", boardService.getBoardlist(connectionId));
		model.addAttribute("connectionId", connectionId);
		return "board/MyClassMain";
	}
	
	@ModelAttribute("boardTypes")
	public List<String> getBoardList() {
		List<String> boardTypes = new ArrayList<String>();
		boardTypes.add("공지사항");
		boardTypes.add("질문");
		boardTypes.add("과제");
		return boardTypes;
	}
	
	//새로운 글 작성 (글작성 버튼)
	@RequestMapping(value ="/board.do", method = RequestMethod.GET)
	public String getPostForm(@PathVariable("connectionId") int connectionId, Model model) {
		logger.info("BoardController-uploadNewPostForm");
		model.addAttribute("boardForm", new BoardForm());		
		model.addAttribute("connectionId", connectionId);
		
		return "board/MyClassUploadBoard";
	}
	
	//새로운 글 등록
	@RequestMapping(value ="/board" , method = RequestMethod.POST)
	public String uploadNewPost(@PathVariable int connectionId, @ModelAttribute("boardForm") BoardForm boardForm, HttpSession session) throws Exception {
		logger.info("BoardController-uploadNewPost"+connectionId);
		UserSession userSession= (UserSession) session.getAttribute("userSession");
		int id = userSession.getId();
		logger.info("BoardController-uploadNewPost"+id);
		String type = userSession.getType();
		Board board = new Board(connectionId, boardForm, id, type);
		boardService.createBoard(board);
		return "redirect:board/main";
	}

	//글 상세보기+댓글(제목 클릭)
	@RequestMapping(value ="/board/{boardId}" , method = RequestMethod.GET)
	public String getPostDetail(@PathVariable("connectionId") int connectionId, @PathVariable("boardId") int boardId, Model model) {
		logger.info("BoardController-postDetail");
		model.addAttribute("connectionId", connectionId);
		model.addAttribute("board", boardService.getBoard(boardId));
		model.addAttribute("reply", new Reply());
		return "board/MyClassBoardDetail";
	}
	

	@ResponseBody
	@RequestMapping(value = "/board/{boardId}/reply", method = RequestMethod.GET)
	public List<Reply> getReplyList(int boardId) throws Exception{
		return replyService.getAllReply(boardId);
	}
	
	@RequestMapping(value = "/board/{boardId}/reply", method = RequestMethod.POST)
	public Map<String, Object> saveReply(@RequestBody Reply reply) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			replyService.saveReply(reply);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}

		return result;
	}
	
	
	  //글 수정 페이지  
	  @RequestMapping(value ="/board/{boardId}/edit" , method = RequestMethod.GET)
	  public String updatePostPage(@PathVariable("connectionId") int connectionId, @PathVariable("boardId") int boardId, Model model) {
		  model.addAttribute("connectionId", connectionId);
		  model.addAttribute("board", boardService.getBoard(boardId));
		  return "board/MyClassUpdateBoard"; 
	  }
	//글 수정	  
	  @RequestMapping(value ="/board/{boardId}" , method = RequestMethod.PUT)
	  public String updatePost(@PathVariable("connectionId") int connectionId, @PathVariable("boardId") int boardId, @ModelAttribute("boardForm") BoardForm boardForm) {
		  boardService.updateBoard(boardId, boardForm); 
		  return "redirect:{boardId}"; 
	  }
	  
	  //글 삭제
	  @RequestMapping(value = "/board/{boardId}", method = RequestMethod.DELETE)
	  public String deleteBoard(@PathVariable("boardId") int boardId) throws Exception { 
		  logger.info("BoardController-delete");
		  boardService.deleteBoard(boardId); 
		  return "redirect:main"; 
	  }
	 
}
