package ssd.pbl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import ssd.pbl.model.SchoolForm;
import ssd.pbl.model.StudentForm;
import ssd.pbl.model.TeacherForm;
import ssd.pbl.service.AuthService;
import ssd.pbl.service.SearchService;

@Controller
@RequestMapping("/auth")
public class SignUpController extends HandlerInterceptorAdapter {

	@Autowired
	private AuthService authService;
	@Autowired
	private SearchService searchService;
	private int idCheck = -1;
	
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String getSignupTermForm() {
		return "auth/JoinTerm";
	}
	
	@RequestMapping(value = "/signup/type", method = RequestMethod.GET)
	public String agreeTerm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("agreement", true);
		
		return "auth/JoinType";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signupType(@RequestParam("type") String type, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("agreement");
		
		if (type.equals("student")) {
			return "redirect:signup/student.do";
		} else {
			return "redirect:signup/teacher.do";
		}
	}
	
	@RequestMapping(value = "/signup/student.do", method = RequestMethod.GET)
	public String signupFormStudent(@Valid @ModelAttribute("student") StudentForm student) {
		return "auth/StudentForm";
	}
	
	@RequestMapping(value = "/signup/teacher.do", method = RequestMethod.GET)
	public String signupFormTeacher(@Valid @ModelAttribute("teacher") TeacherForm teacher,
			BindingResult result, Model model) {
		return "auth/TeacherForm";
	}
	
	@RequestMapping(value = "/signup/student", method = RequestMethod.POST)
	public String signupStudent(@Valid @ModelAttribute("student") StudentForm student,
			@RequestParam(defaultValue="") String schoolKeyword, BindingResult result, Model model) {
		
		List<SchoolForm> school = searchService.searchSchool(schoolKeyword);
		if (result.hasFieldErrors("schoolCategory")) {
			return "auth/StudentForm";
		}
		return "auth/JoinComplete";
	}
	
	@RequestMapping(value = "/signup/student/idCheck", method = RequestMethod.POST)
	public String signupStudent(@RequestParam(defaultValue="") String email) {
		if (authService.isEmailExist(email)) {
			idCheck = 1;
		} else {
			idCheck = 0;
		}
		return "redirect:/auth/signup/student";
	}
}
