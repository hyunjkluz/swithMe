package ssd.pbl.controller;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.inject.Inject;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import ssd.pbl.exception.PasswordNotMatchingException;
import ssd.pbl.model.FindPWForm;
import ssd.pbl.model.SchoolForm;
import ssd.pbl.model.StudentForm;
import ssd.pbl.model.TeacherForm;
import ssd.pbl.service.AuthService;
import ssd.pbl.service.SearchService;

@Controller
@RequestMapping("/auth")
public class SignUpController extends HandlerInterceptorAdapter implements ApplicationContextAware {

	@Autowired
	private AuthService authService;
	@Autowired
	private SearchService searchService;
	@Inject
    PasswordEncoder passwordEncoder;
	
	private int idCheck = -1;
	
	private WebApplicationContext context;	
	private String uploadDir;

	public void setApplicationContext(ApplicationContext appContext)
		throws BeansException {
		this.context = (WebApplicationContext) appContext;
		this.uploadDir = context.getServletContext().getRealPath("/upload/");
	}
	
	@ModelAttribute("student")
	public StudentForm setEmptyStudentForm() {
	    return new StudentForm();
	}
	
	@ModelAttribute("teacher")
	public TeacherForm setEmptyTeacherForm() {
	    return new TeacherForm();
	}
	
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
	public String signupType(@RequestParam("type") String type, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.removeAttribute("agreement");
		
		if (type.equals("student")) {
			return "redirect:signup/student.do";
		} else {
			return "redirect:signup/teacher.do";
		}
	}
	
	@RequestMapping(value = "/signup/student.do", method = RequestMethod.GET)
	public String signupFormStudent(@ModelAttribute("studentForm") StudentForm studentForm) {
		return "auth/StudentForm";
	}
	
	@RequestMapping(value = "/signup/teacher.do", method = RequestMethod.GET)
	public String signupFormTeacher(@ModelAttribute("teacherForm") TeacherForm teacherForm) {
		return "auth/TeacherForm";
	}
	
	@RequestMapping(value = "/signup/student", method = RequestMethod.POST)
	public String signupStudent(@Valid @ModelAttribute("student") StudentForm student, BindingResult result,
			@RequestParam(defaultValue="") String schoolKeyword, HttpSession session, Model model) {

		if (result.hasErrors()) {
			return "auth/StudentForm";
		}
		
		String email = student.getEmail();
//		MultipartFile report = student.getProfileImg();
//		uploadFile(email, report);
//
//        String filename = report.getOriginalFilename();
        // 다른 controller에서는 이미 저장된 filename을 데이터베이스로부터 검색해 옴
        // ...
//        model.addAttribute("filename", filename);
        
		session.setAttribute("type", "student");
		
		try {
			if (!student.getPassword().equals(student.getCheckedPassword())) {
				throw new PasswordNotMatchingException();
			}
		} catch (PasswordNotMatchingException e) {
			result.reject("passwordNotMatching", "두 비밀번호가 일치하지 않습니다.");
			return "auth/StudentForm";
		}
		
		String encPassword = passwordEncoder.encode(student.getPassword());
        student.setPassword(encPassword);
        authService.createStudent(student);
        student.setSchoolType(searchService.selectSchoolType(student.getSchoolId()));
        int id = authService.selectStudentId(student.getEmail());
        student.setId(id);
        authService.createStudentInfo(student);
		
		return "auth/JoinComplete";
	}
	
	@RequestMapping(value = "/student/idCheck/{email}", method = RequestMethod.GET)
	@ResponseBody
	public int signupStudentIdCheck(@PathVariable String email) {
		System.out.println(email);
		System.out.println(authService.isStudentEmailExist(email));
		return authService.isStudentEmailExist(email);
	}
	
	@RequestMapping(value = "/signup/teacher", method = RequestMethod.POST)
	public String signupTeacher(@Valid @ModelAttribute("teacher") TeacherForm teacher, BindingResult result,
			@RequestParam(defaultValue="") String schoolKeyword, HttpSession session, Model model) {

		if (result.hasErrors()) {
			return "auth/TeacherForm";
		}
		
//		String email = student.getEmail();
//		MultipartFile report = student.getProfileImg();
//		uploadFile(email, report);
//
//        String filename = report.getOriginalFilename();
        // 다른 controller에서는 이미 저장된 filename을 데이터베이스로부터 검색해 옴
        // ...
//        model.addAttribute("filename", filename);
		
		session.setAttribute("type", "teacher");
		
		try {
			if (!teacher.getPassword().equals(teacher.getCheckedPassword())) {
				throw new PasswordNotMatchingException();
			}
		} catch (PasswordNotMatchingException e) {
			result.reject("passwordNotMatching", "두 비밀번호가 일치하지 않습니다.");
			return "auth/TeacherForm";
		}
		
		String encPassword = passwordEncoder.encode(teacher.getPassword());
        teacher.setPassword(encPassword);
        authService.createTeacher(teacher);
        int id = authService.selectTeacherId(teacher.getEmail());
        teacher.setId(id);
        authService.createTeacherInfo(teacher);
		
		return "auth/JoinComplete";
	}
	
	@RequestMapping(value = "/teacher/idCheck/{email}", method = RequestMethod.GET)
	@ResponseBody
	public int signupTeacherIdCheck(@PathVariable String email) {
		return authService.isTeacherEmailExist(email);
	}
	
//	private void uploadFile(String email, MultipartFile report) {
////		System.out.println(email + "가 업로드 한 파일: "
////				+ report.getOriginalFilename());
//		File file = new File(this.uploadDir + report.getOriginalFilename());
//		try {
//			report.transferTo(file);
//		} catch (IllegalStateException | IOException e) {
//			e.printStackTrace();
//		}
//	}
}
