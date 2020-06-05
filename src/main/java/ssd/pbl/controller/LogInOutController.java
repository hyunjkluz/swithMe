package ssd.pbl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.util.WebUtils;

import ssd.pbl.model.LoginForm;
import ssd.pbl.service.AuthService;

@Controller
@RequestMapping("/auth")
public class LogInOutController {
	
	@Autowired
	private AuthService authService;
	
	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String getLoginForm() {
		return "auth/LoginForm";
	}
	
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String login(@Valid @ModelAttribute("loginForm") LoginForm loginForm,
//			BindingResult result, HttpSession session) {
//		if (result.hasErrors()) {
//			return "auth/loginForm";
//		}
//		if (authService.login(loginForm)) {
//			UserSession userSession = new UserSession();
//			userSession.setId(loginForm.getEmail());
//			session.setAttribute("userSession", userSession);
//			return "main/index.do";
//		} else {
//			return "login/LoginForm";
//		}
//	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		return "main/index.do";
	}
	
}
