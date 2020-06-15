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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.util.WebUtils;

import ssd.pbl.exception.IDPWNotMatchingException;
import ssd.pbl.model.LoginForm;
import ssd.pbl.service.AuthService;

@Controller
@RequestMapping("/auth")
@SessionAttributes("userSession")
public class LogInOutController {
	
	@Autowired
	private AuthService authService;
	
	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String getLoginForm(@ModelAttribute("loginForm") LoginForm loginForm) {
		return "auth/LoginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@Valid @ModelAttribute("loginForm") LoginForm loginForm,
			@RequestParam("type") String type, HttpSession session, BindingResult result, Model model) throws Exception {
		if (result.hasErrors()) {
			return "auth/LoginForm";
		}
		try {
			loginForm.setType(type);
			if (authService.login(loginForm)) {
				UserSession userSession = authService.getInfo(loginForm);
				session.setAttribute("userSession", userSession);
				return "main";
			} else {
				return "auth/LoginForm";
			}
			
		} catch (IDPWNotMatchingException e) {
			result.reject("invalidIdOrPassword", 
					new Object[] { loginForm.getEmail() }, null);
			return "auth/LoginForm";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		return "main/index.do";
	}
	
}
