package ssd.pbl.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ssd.pbl.service.ConnectionService2;

@Controller
public class ConnectionController2 {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private ConnectionService2 connectionService2;
	
	//나의 수업-학생
	@RequestMapping(value = "/connection/student", method = RequestMethod.GET)
	public String getAllStudentConnection(Model model, HttpSession session) {
		logger.info("ConnectionController2-getAllStudentConnection");
		//int sid = (int) session.getAttribute("id");
		int sid=4;
		model.addAttribute("connectionList", connectionService2.getConnectionlist(sid));
		return "board/MyClassList";
	}
	
	//나의 수업-선생님
	@RequestMapping(value = "/connection/teacher", method = RequestMethod.GET)
	public String getAllTeacherConnection(Model model) {
		logger.info("ConnectionController2-getAllTeacherConnection");
		model.addAttribute("connectionList", null);
		return "board/MyClassList";
	}
	
}
