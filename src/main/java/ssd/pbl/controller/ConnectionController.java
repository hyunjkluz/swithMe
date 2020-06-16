/**
 * 
 */
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

import ssd.pbl.service.ConnectionService;

/**
 * @author kimhyunjin
 * @date: May 22, 2020 3:10:56 AM
 */
@Controller
public class ConnectionController {
	
	@RequestMapping(value = "/class/{classId}/request", method = RequestMethod.POST)
	public String postClassNewRequest(@PathVariable int classId, Model model, HttpSession session) {
		return "match/ClassRequestFinish";
	}
	
	//board 관련 connection Controller
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private ConnectionService connectionService;
	
	//나의 수업-학생
	@RequestMapping(value = "/connection/student", method = RequestMethod.GET)
	public String getAllStudentConnection(Model model, HttpSession session) {
		logger.info("ConnectionController2-getAllStudentConnection");
		UserSession userSession= (UserSession) session.getAttribute("userSession");
		String email = userSession.getId();
		
		//model.addAttribute("connectionList", connectionService.getConnectionlist(sid));
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
