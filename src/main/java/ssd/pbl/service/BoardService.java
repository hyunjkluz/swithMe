package ssd.pbl.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ssd.pbl.model.Board;
import ssd.pbl.model.BoardForm;

@Service
public class BoardService {
	@Resource(name="fileUtils")
	//private FileUtils fileUtils;

	private Map<String, Board> boardMap = new HashMap<String, Board>();
	public List<Board> list() {
		// TODO Auto-generated method stub
		Board b = new Board(1,"title","����", "content", 1, 1, new Date());
		boardMap.put("a1", b);
		boardMap.put("a2", new Board(2, "title2","type2", "��������",  2, 1, new Date()));
		System.out.print(b.toString());
		return  new ArrayList<Board>(boardMap.values());
	}
	
	public Board getBoardContent(String bId) {
		return boardMap.get(bId);
	}
	
	public void write(BoardForm boardForm, MultipartHttpServletRequest mpRequest) {
		// TODO Auto-generated method stub
		
	}

}
