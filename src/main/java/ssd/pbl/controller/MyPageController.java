package ssd.pbl.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ssd.pbl.model.ConnectionCard;
import ssd.pbl.service.ConnectionService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	private static final Logger LOGGER = LoggerFactory.getLogger(MyPageController.class);

	@Autowired
	private ConnectionService connectionService;

	@RequestMapping(value = "/student.do", method = RequestMethod.GET)
	public ModelAndView mypagestudent(HttpSession session) {
//		UserSession userSession = (UserSession) session.getAttribute("userSession");

		List<ConnectionCard> studentConnections = connectionService.getStudentsConnection(4);
//		List<ConnectionCard> studentConnections = connectionService.getStudentsConnection(userSession.getId());

		ModelAndView mav = new ModelAndView("mypage/MyPageStudent");
		mav.addObject("connections", studentConnections);

		return mav;
	}

	@RequestMapping(value = "/student", method = RequestMethod.GET)
	public String backtomypagestudent() {
		return "mypage/MyPageStudent";
	}

	@RequestMapping(value = "/teacher.do", method = RequestMethod.GET)
	public ModelAndView mypageteacher(HttpSession session) {
		UserSession userSession = (UserSession) session.getAttribute("userSession");

		List<ConnectionCard> teacherConnections = connectionService.getTeachersConnection(userSession.getId());

		ModelAndView mav = new ModelAndView("mypage/MyPageTeacher");
		mav.addObject("connections", teacherConnections);

		return mav;
	}

	@RequestMapping(value = "/teacher", method = RequestMethod.GET)
	public String backtomypageteacher() {
		return "mypage/MyPageTeacher";
	}

	@RequestMapping(value = "/student/request", method = RequestMethod.GET)
	public String studentrequest() {
		return "mypage/MyPageStudentRequest";
	}

	@RequestMapping(value = "/teacher/request", method = RequestMethod.GET)
	public String teacherrequest() {
		return "mypage/MyPageTeacherRequest";
	}

	@RequestMapping(value = "/student/class", method = RequestMethod.GET)
	public String studentclass() {
		return "mypage/MyPageStudentClass";
	}

	@RequestMapping(value = "/teacher/class", method = RequestMethod.GET)
	public String teacherclass() {
		return "mypage/MyPageTeacherClass";
	}

}
