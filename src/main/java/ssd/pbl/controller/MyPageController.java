package ssd.pbl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mypage/")
public class MyPageController {

	@RequestMapping(value = "/student.do", method = RequestMethod.GET)
	public String mypagestudent() {
		return "mypage/MyPageStudent";
	}
	
	@RequestMapping(value = "/student", method = RequestMethod.GET)
	public String backtomypagestudent() {
		return "mypage/MyPageStudent";
	}
	
	@RequestMapping(value = "/teacher.do", method = RequestMethod.GET)
	public String mypageteacher() {
		return "mypage/MyPageTeacher";
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
