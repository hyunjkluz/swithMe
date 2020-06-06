package ssd.pbl.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ssd.pbl.model.Board;
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

	//나의 수업
	@RequestMapping(value = "/connetion", method = RequestMethod.GET)
	public String getAllConnection(Model model) {
		logger.info("ConnetionController-getAllConnection");
		model.addAttribute("connetionList", null);
		return "board/MyClassList";
	}
	
	//나의 수업 -> 강의실 입장
	@RequestMapping(value = "/board/main", method = RequestMethod.GET)
	public String getMyBoard(Model model/* , Criteria cri */) {
		logger.info("BoardController-MyClass");
		model.addAttribute("boardList", boardService.getBoardlist());
		return "board/MyClassMain";
	}
	
	//새로운 글 작성 (글작성 버튼)
	@RequestMapping(value ="/board.do", method = RequestMethod.GET)
	public String getPostForm(Model model) {
		logger.info("BoardController-uploadNewPostForm");
		model.addAttribute("boardForm", new Board());
		
		List<String> boardTypes = new ArrayList<String>();
		boardTypes.add("공지사항");
		boardTypes.add("질문");
		boardTypes.add("과제");
		model.addAttribute("boardTypes", boardTypes);
		return "board/MyClassUploadBoard";
	}
	
	//새로운 글 등록
	@RequestMapping(value ="/board" , method = RequestMethod.POST)
	public String uploadNewPost(@ModelAttribute("boardForm") Board board) throws Exception {
		logger.info("BoardController-uploadNewPost");
		boardService.createBoard(board);
		return "board/MyClassMain";
	}

	//글 상세보기+댓글(제목 클릭)
	@RequestMapping(value ="/board/{boardId}" , method = RequestMethod.GET)
	public String getPostDetail(@RequestParam("boardId") int boardId, Model model) {
		logger.info("BoardController-postDetail");
		model.addAttribute("board", boardService.getBoard(boardId));
		model.addAttribute("replyList", replyService.getAllReply(boardId));
		return "board/MyClassBoardDetail";
	}
	
	/*
	 * //글 수정
	 * 
	 * @RequestMapping(value ="/board/{boardId}" , method = RequestMethod.PUT)
	 * public String updatePost(@ModelAttribute("boardForm") BoardForm boardForm) {
	 * boardService.updateBoard(boardForm); return "board/MyClassBoardDetail"; }
	 * 
	 * //글 삭제
	 * 
	 * @RequestMapping(value = "/board/{boardId}", method = RequestMethod.DELETE)
	 * public String deleteBoard(@RequestParam("boardId") int boardId) throws
	 * Exception { boardService.deleteBoard(boardId); return "board/MyClassMain"; }
	 */
}
