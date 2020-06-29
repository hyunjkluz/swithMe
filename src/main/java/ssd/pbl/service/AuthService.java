package ssd.pbl.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.core.io.FileSystemResource;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;
import org.springframework.mail.javamail.JavaMailSender;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.controller.UserSession;
import ssd.pbl.exception.FindPWNotMatchingException;
import ssd.pbl.exception.IDPWNotMatchingException;
import ssd.pbl.exception.SecurityCodeNotMatching;
import ssd.pbl.model.FindIDForm;
import ssd.pbl.model.FindPWForm;
import ssd.pbl.model.LoginForm;
import ssd.pbl.model.ResetPWForm;
import ssd.pbl.model.StudentForm;
import ssd.pbl.model.TeacherForm;
import ssd.pbl.repository.mapper.MailMapperRepository;
import ssd.pbl.repository.mapper.StudentMapperRepository;
import ssd.pbl.repository.mapper.TeacherMapperRepository;

import javax.inject.Inject;

@Service
public class AuthService {

	@Autowired
	private StudentMapperRepository studentMapperRepository;
	@Autowired
	private TeacherMapperRepository teacherMapperRepository;
	@Autowired
	private MailMapperRepository mailMapperRepository;
	private JavaMailSender mailSender;
	@Inject
    PasswordEncoder passwordEncoder;
	
	public AuthService(StudentMapperRepository studentMapperRepository,
			TeacherMapperRepository teacherMapperRepository) {
		super();
		this.studentMapperRepository = studentMapperRepository;
		this.teacherMapperRepository = teacherMapperRepository;
	}

	public boolean login(LoginForm loginForm) throws Exception {
		LoginForm dbLoginForm;

		if (loginForm.getType().equals("student")) {
			dbLoginForm = studentMapperRepository.selectStudent(loginForm.getEmail());
		} else {
			dbLoginForm = teacherMapperRepository.selectTeacher(loginForm.getEmail());
		}
		
		if (dbLoginForm != null && passwordEncoder.matches(loginForm.getPassword(), dbLoginForm.getPassword())) {
			return true;
		} else {
			throw new IDPWNotMatchingException();
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

	public boolean findPW(FindPWForm findPWForm) throws Exception {
		int id = -1;
		if (findPWForm.getType().equals("student")) {
			if (studentMapperRepository.selectStudentByEmailAndName(findPWForm) == null) {
				throw new FindPWNotMatchingException();
			} else {
				id = studentMapperRepository.selectStudentByEmailAndName(findPWForm);
			}
			System.out.println(id);
		} else {
			if (teacherMapperRepository.selectTeacherByEmailAndName(findPWForm) == null) {
				throw new FindPWNotMatchingException();
			} else {
				id = teacherMapperRepository.selectTeacherByEmailAndName(findPWForm);
			}
		}
		
		int key;
		if (id != -1) {
			key = send_mail(findPWForm);
			findPWForm.setCode(key);
			mailMapperRepository.insertSecurityCode(findPWForm);
			System.out.println(key);
			return true;
		} else {
			throw new FindPWNotMatchingException();
		}
	}
	
	public boolean checkSecurityCode(int code, FindPWForm findPWForm) throws Exception {
		int key = mailMapperRepository.selectSecurityCode(findPWForm.getEmail());
		
		if (key == code) {
			return true;
		} else {
			throw new SecurityCodeNotMatching();
		}
	}

	public void resetPW(ResetPWForm resetPWForm) {
		if (resetPWForm.getType().equals("student")) {
			studentMapperRepository.updateStudentPW(resetPWForm);
		} else {
			teacherMapperRepository.updateTeacherPW(resetPWForm);
		}
	}

	public int send_mail(FindPWForm findPWForm) throws Exception {
		String setfrom = "subees4136@gmail.com";
		String subject = "swithMe 인증번호입니다.";
		String msg = "";
		int key = create_key();

		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += findPWForm.getName() + "님의 인증번호입니다. 페이지로 돌아가 인증번호를 입력하세요.</h3>";
		msg += "<p>인증번호 : ";
		msg += key + "</p></div>";
	   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(findPWForm.getEmail());     // 받는사람 이메일
	      messageHelper.setSubject(subject); // 메일제목은 생략이 가능하다
	      messageHelper.setText(msg);  // 메일 내용
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	    
	    return key;
	}

	public int create_key() throws Exception {
		int key = 0;
		Random rd = new Random();

		for (int i = 0; i < 8; i++) {
			key = key * 10 + rd.nextInt(10);
		}
		
		return key;
	}

	public int isStudentEmailExist(String email) {
		return studentMapperRepository.selectCountStudentEmail(email);
	}
	
	public int isTeacherEmailExist(String email) {
		return teacherMapperRepository.selectCountTeacherEmail(email);
	}

	public void createStudent(StudentForm student) {
		studentMapperRepository.insertStudent(student);
	}
	
	public void createStudentInfo(StudentForm student) {
		studentMapperRepository.insertStudentInfo(student);
	}

	public int selectStudentId(String email) {
		return studentMapperRepository.selectStudentId(email);
	}
	
	public void createTeacher(TeacherForm teacher) {
		teacherMapperRepository.insertTeacher(teacher);
	}
	
	public void createTeacherInfo(TeacherForm teacher) {
		teacherMapperRepository.insertTeacherInfo(teacher);
	}
	
	public int selectTeacherId(String email) {
		return teacherMapperRepository.selectTeacherId(email);
	}
}
