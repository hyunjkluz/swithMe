package ssd.pbl.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ssd.pbl.model.FindIDForm;
import ssd.pbl.service.AuthService;

@Controller
@RequestMapping("/auth/find")
public class FindLogController {
	
	@Autowired
	private AuthService authService;
	
	@RequestMapping(value = "/id.do", method = RequestMethod.GET)
	public String getFindIDForm(@Valid @ModelAttribute("findIDForm") FindIDForm findIDForm) {		
		return "auth/FindIDForm";
	}
	
	@RequestMapping(value = "/pw.do", method = RequestMethod.GET)
	public String getFindPWForm() {
		return "auth/FindPWForm";
	}
	
	@RequestMapping(value = "/id", method = RequestMethod.POST)
	public String getFindID(@Valid @ModelAttribute("findIDForm") FindIDForm findIDForm, Model model) {
		String id = authService.findID(findIDForm);
		model.addAttribute("id", id);
		
		return "auth/FindIDComplete";
	}
}
