package ssd.pbl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	private static final Logger LOGGER = LoggerFactory.getLogger(LogInOutController.class);

	@Autowired
	private AuthService authService;

	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String getLoginForm(@ModelAttribute("loginForm") LoginForm loginForm) {
		return "auth/LoginForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("loginForwardAction") String forwardAction,
			@Valid @ModelAttribute("loginForm") LoginForm loginForm, @RequestParam("type") String type,
			HttpSession session, BindingResult result, Model model) throws Exception {
		if (result.hasErrors()) {
			return "auth/LoginForm";
		}
		try {
			loginForm.setType(type);
			if (authService.login(loginForm)) {
				UserSession userSession = authService.getInfo(loginForm);
				session.setAttribute("userSession", userSession);

				LOGGER.info("이전 URL : " + forwardAction);
				// 로그인 이전 페이지가 학생 자동매칭이면 다시 원래 페이지로 돌아감.
				if (forwardAction.contains("/student/match")) {
					LOGGER.info("자동매칭중");
					return "redirect:http://localhost:8080/swithMe/student/match/step5";
				}
				if (forwardAction.contains("/class")) {
					LOGGER.info("수업요청 중");
					String[] paths = forwardAction.split("/");
					String classId = paths[5];

					return "redirect:http://localhost:8080/swithMe/class/" + classId;
				}
				return "main";
			} else {
				return "auth/LoginForm";
			}

		} catch (IDPWNotMatchingException e) {
			result.reject("invalidIdOrPassword", new Object[] { loginForm.getEmail() }, null);
			return "auth/LoginForm";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		return "main/index.do";
	}

}
