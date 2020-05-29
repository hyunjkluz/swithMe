package ssd.pbl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/auth/find")
public class FindLogController {
	
	@RequestMapping(value = "/id.do", method = RequestMethod.GET)
	public String getFindIDForm() {
		return "login/FindIDForm";
	}
	
	@RequestMapping(value = "/pw.do", method = RequestMethod.GET)
	public String getFindPWForm() {
		return "login/FindPWForm";
	}
}
