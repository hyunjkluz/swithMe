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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ssd.pbl.model.BoardForm;
//import ssd.pbl.domain.Criteria;
//import ssd.pbl.domain.PageMaker;
import ssd.pbl.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	///connection/{connectionId}/board?category={category}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String MyClass(Model model/* , Criteria cri */) {
		logger.info("BoardController-MyClass");
		
		//model.addAttribute("list", service.list(cri));
		model.addAttribute("boardList", boardService.list());
		//PageMaker pageMaker = new PageMaker();
		//pageMaker.setCri(cri);
		//pageMaker.setTotalCount(service.listCount());
		
		//model.addAttribute("pageMaker", pageMaker);
		

		
		
		return "MyClassMain";
	}
	
	//�Խñ� �ۼ� ������ �̵�
	@RequestMapping("/board.do")
	public String boardForm( Model model) {
		logger.info("BoardController-uploadNewPost");
		model.addAttribute("boardForm", new BoardForm());
		
		List<String> boardTypes = new ArrayList<String>();
		boardTypes.add("��������");
		boardTypes.add("����");
		boardTypes.add("����");
		model.addAttribute("boardTypes", boardTypes);
		return "MyClassUploadBoard";
	}
	
	//�Խñ� �ۼ� ���
	@RequestMapping("/board")
	public String uploadNewPost(@ModelAttribute("boardForm") BoardForm boardForm, 
			MultipartHttpServletRequest mpRequest)throws Exception {
		logger.info("BoardController-uploadNewPost");
		//��� ����
		boardService.write(boardForm, mpRequest);
		return "MyClassMain";
	}

	//�Խñ� �󼼺���
	@RequestMapping("/board/{boardId}")
	public String postDetail(@RequestParam("boardId") String boardId, Model model) {
		//Ư�� �Խñ� ��������
		//���
		//List<Reply> replyList = replyService.readReply()
		logger.info("BoardController-postDetail");
		model.addAttribute("board", boardService.getBoardContent(boardId));
		return "MyClassBoardDetail";
	}
	
	
}
