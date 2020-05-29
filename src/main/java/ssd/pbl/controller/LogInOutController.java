package ssd.pbl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/auth")
public class LogInOutController {
	
	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String getLoginForm() {
		return "login/LoginForm";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		return "main/index.do";
	}
	
}
