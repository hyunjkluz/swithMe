package ssd.pbl.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.controller.UserSession;
import ssd.pbl.exception.IDPWNotMatchingException;
import ssd.pbl.model.FindIDForm;
import ssd.pbl.model.LoginForm;
import ssd.pbl.repository.mapper.StudentMapperRepository;
import ssd.pbl.repository.mapper.TeacherMapperRepository;

@Service
public class AuthService {
	
	@Autowired
	private StudentMapperRepository studentMapperRepository;
	@Autowired
	private TeacherMapperRepository teacherMapperRepository;
	
	public AuthService(StudentMapperRepository studentMapperRepository,
			TeacherMapperRepository teacherMapperRepository) {
		super();
		this.studentMapperRepository = studentMapperRepository;
		this.teacherMapperRepository = teacherMapperRepository;
	}

	public boolean login(LoginForm loginForm) throws Exception {
		if (loginForm.getEmail() == null || loginForm.getPassword() == null) {
//			throw new IDPWNotMatchingException();
			return false;
		}
		
		LoginForm dbLoginForm;
		
		if (loginForm.getType().equals("student")) {
			dbLoginForm = studentMapperRepository.selectStudent(loginForm.getEmail());
		} else {
			dbLoginForm = teacherMapperRepository.selectTeacher(loginForm.getEmail());
		}
		
		
		if (dbLoginForm.getPassword().equals(loginForm.getPassword())) {
//			throw new IDPWNotMatchingException();
			return true;
		} else {
			return false;
		}
	}
	
	public UserSession getInfo(LoginForm loginForm) {
		if (loginForm.getType().equals("student")) {
			return studentMapperRepository.selectStudentUserInfo(loginForm.getEmail());
		} else {
			return teacherMapperRepository.selectTeacherUserInfo(loginForm.getEmail());
		}
	}
	
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	public String findID(FindIDForm findIDForm) {
		if (findIDForm.getType().equals("student")) {
			System.out.println(studentMapperRepository.selectEmailByNameAndPhone(findIDForm));
			return studentMapperRepository.selectEmailByNameAndPhone(findIDForm);
		} else {
			System.out.println("teacher" + teacherMapperRepository.selectEmailByNameAndPhone(findIDForm));
			return teacherMapperRepository.selectEmailByNameAndPhone(findIDForm);
		}
		
	}
	
//	public LoginForm findPW() {
//		
//	}
	
	public void resetPW() {
		
	}
	
	public boolean isEmailExist(String email) {
		return studentMapperRepository.selectCountStudentEmail(email);
	}
	
	public void createStudent() {
		
	}
	
	public void createTeacher() {
		
	}
}
