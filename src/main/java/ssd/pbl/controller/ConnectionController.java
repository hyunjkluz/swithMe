/**
 * 
 */
package ssd.pbl.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import ssd.pbl.service.ClassService;
import ssd.pbl.service.ConnectionService;

/**
 * @author kimhyunjin
 * @date: May 22, 2020 3:10:56 AM
 */
@Controller
public class ConnectionController {
	private static final Logger LOGGER = LoggerFactory.getLogger(ConnectionController.class);
	
	@Autowired
	private ClassService classService;
	@Autowired
	private ConnectionService connectionService;
	
	// 수업 상세보기 > 수업 요청 전송
	@RequestMapping(value = "/class/{classId}/request", method = RequestMethod.POST)
	public String postClassNewRequest(@PathVariable int classId, HttpServletRequest request) {
		UserSession userSession = (UserSession) WebUtils.getSessionAttribute(request, "userSession");
		LOGGER.info("로그인된 유저 정보 : " + userSession.getId());
		
		Map<String, Integer> classDetailId = classService.getTeacherAndSubjectByClassId(classId);
//		Integer connectionId = connectionService.postConnection(userSession.getId(), classDetailId.get("teacherId"), classDetailId.get("subjectId"), null);
		
		
		return "match/ClassRequestFinish";
	}
	
	//나의 수업-학생
	@RequestMapping(value = "/connection/student", method = RequestMethod.GET)
	public String getAllStudentConnection(Model model, HttpSession session) {
		LOGGER.info("ConnectionController2-getAllStudentConnection");
		UserSession userSession= (UserSession) session.getAttribute("userSession");
		String email = userSession.getId();
		
		//model.addAttribute("connectionList", connectionService.getConnectionlist(sid));
		return "board/MyClassList";
	}
	
	//나의 수업-선생님
	@RequestMapping(value = "/connection/teacher", method = RequestMethod.GET)
	public String getAllTeacherConnection(Model model) {
		LOGGER.info("ConnectionController2-getAllTeacherConnection");
		model.addAttribute("connectionList", null);
		return "board/MyClassList";
	}

}
