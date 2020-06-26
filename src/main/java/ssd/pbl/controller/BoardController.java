package ssd.pbl.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ssd.pbl.model.Board;
import ssd.pbl.model.BoardForm;
import ssd.pbl.model.ConnectionCard;
import ssd.pbl.model.Reply;
import ssd.pbl.service.BoardService;
import ssd.pbl.service.ConnectionService;
import ssd.pbl.service.ReplyService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/connection/{connectionId}")
public class BoardController implements ApplicationContextAware {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private ConnectionService connectionService;
	
	//나의 수업 -> 강의실 입장
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String getMyBoard(@PathVariable("connectionId") int connectionId, @RequestParam("category") String category,
			Model model) {
		logger.info("BoardController-MyClass");
		
		model.addAttribute("boardList", boardService.getBoardlist(connectionId, category));
		model.addAttribute("connectionId", connectionId);
		return "board/MyClassMain";
	}
	
	@ModelAttribute("connectioncards")
	public List<ConnectionCard> getConnectionCardList(HttpSession session) {
		UserSession userSession= (UserSession) session.getAttribute("userSession");
		int id = userSession.getId();
		
		List<ConnectionCard> connectioncards = new ArrayList<ConnectionCard>();
		
		if(userSession.getType().equals("student"))
			connectioncards = connectionService.getMyClassStudentsConnection(id);
		else if(userSession.getType().equals("teacher"))
			connectioncards = connectionService.getMyClassTeachersConnection(id);
		return connectioncards;
	}
	
	@ModelAttribute("boardTypes")
	public List<String> getBoardList() {
		List<String> boardTypes = new ArrayList<String>();
		boardTypes.add("NOTICE");
		boardTypes.add("QA");
		boardTypes.add("HOMEWORK");
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
	
	private WebApplicationContext context;	
	private String uploadDir;

	@Override					// life-cycle callback method
	public void setApplicationContext(ApplicationContext appContext)
		throws BeansException {
		this.context = (WebApplicationContext) appContext;
		this.uploadDir = context.getServletContext().getRealPath("/WEB-INF/upload");
	}
	
	//새로운 글 등록
	@RequestMapping(value ="/board" , method = RequestMethod.POST)
	public String uploadNewPost(@ModelAttribute("boardForm") BoardForm boardForm,
			@PathVariable int connectionId, 
			HttpSession session) throws IOException {
		/*
		 * if (result.hasErrors()) return "board/MyClassUploadBoard";
		 */
		logger.info("BoardController-uploadNewPost"+connectionId+ boardForm.toString());
		UserSession userSession= (UserSession) session.getAttribute("userSession");
		int id = userSession.getId();
		logger.info("BoardController-uploadNewPost"+id);
		String type = userSession.getType();
		
		MultipartFile uploadFile = boardForm.getUploadFile();
		if(uploadFile != null) {
		  File file = new File(this.uploadDir + uploadFile.getOriginalFilename());
		  uploadFile.transferTo(file);
		  boardForm.setUpload(uploadFile.getOriginalFilename());
		}

		Board board = new Board(connectionId, boardForm, id, type);
		boardService.createBoard(board);
		String cate = boardForm.getType();
		
		return "redirect:http://localhost:8080/swithMe/connection/{connectionId}/board?category="+cate;
	}
	


	//글 상세보기+댓글(제목 클릭)
	@RequestMapping(value ="/board/{boardId}" , method = RequestMethod.GET)
	public String getPostDetail(@PathVariable("connectionId") int connectionId, 
			@PathVariable("boardId") int boardId, 
			Model model,
			HttpSession session) {
		logger.info("BoardController-postDetail");
		model.addAttribute("connectionId", connectionId);
		model.addAttribute("board", boardService.getBoard(boardId));
		
		return "board/MyClassBoardDetail";
	}

	
	  //글 수정 페이지  
	  @RequestMapping(value ="/board/{boardId}/edit" , method = RequestMethod.GET)
	  public String updatePostPage(@PathVariable("connectionId") int connectionId, @PathVariable("boardId") int boardId, Model model) {
		  model.addAttribute("connectionId", connectionId);
		  model.addAttribute("board", boardService.getBoard(boardId));
		  return "board/MyClassUpdateBoard"; 
	  }
	//글 수정	  
	  @RequestMapping(value ="/board/{boardId}" , method = RequestMethod.POST)
	  public String updatePost(@PathVariable("connectionId") int connectionId, @PathVariable("boardId") int boardId, @ModelAttribute("board") Board board) {
		  logger.info("BoardController-UpdatePost"+connectionId+ board.getBoardForm().toString());
		  MultipartFile file = board.getBoardForm().getUploadFile();  
		  if(file!=null) {
			  board.getBoardForm().setUpload(file.getOriginalFilename());
		  }
		  boardService.updateBoard(boardId, board.getBoardForm()); 
		  return "redirect:http://localhost:8080/swithMe/connection/{connectionId}/board/{boardId}"; 
	  }
	  
	  //글 삭제
	  @RequestMapping(value = "/board/{boardId}", method = RequestMethod.DELETE)
	  public String deleteBoard(@PathVariable("boardId") int boardId) throws Exception { 
		  logger.info("BoardController-delete");
		  boardService.deleteBoard(boardId); 
		  return "redirect:?category=NOTICE";
	  }
	 
}
