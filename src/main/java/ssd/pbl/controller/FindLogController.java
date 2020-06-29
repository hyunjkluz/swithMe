package ssd.pbl.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import ssd.pbl.exception.FindPWNotMatchingException;
import ssd.pbl.exception.PasswordNotMatchingException;
import ssd.pbl.exception.SecurityCodeNotMatching;
import ssd.pbl.model.FindIDForm;
import ssd.pbl.model.FindPWForm;
import ssd.pbl.model.ResetPWForm;
import ssd.pbl.service.AuthService;

import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/auth/find")
@SessionAttributes("findPWForm")
public class FindLogController {
	
	@Autowired
	private AuthService authService;
	@Inject
    PasswordEncoder passwordEncoder;
	
	@ModelAttribute("findPWForm")
	public FindPWForm setEmptyFindPWForm() {

	    return new FindPWForm();

	}
	
	@ModelAttribute("resetPWForm")
	public ResetPWForm setEmptyResetPWForm() {

	    return new ResetPWForm();

	}
	
	@RequestMapping(value = "/id.do", method = RequestMethod.GET)
	public String getFindIDForm(@ModelAttribute("findIDForm") FindIDForm findIDForm) {		
		return "auth/FindIDForm";
	}
	
	@RequestMapping(value = "/pw.do", method = RequestMethod.GET)
	public String getFindPWForm(@ModelAttribute("findPWForm") FindPWForm findPWForm) {
		return "auth/FindPWForm";
	}
	
	@RequestMapping(value = "/id", method = RequestMethod.POST)
	public String getFindID(@Valid @ModelAttribute("findIDForm") FindIDForm findIDForm, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "auth/FindIDForm";
		}
		
		String id = authService.findID(findIDForm);
		if (id == null) {
			id = "일치하는 아이디가 없습니다.";
		}
		model.addAttribute("id", id);
		
		return "auth/FindIDComplete";
	}
	
	@RequestMapping(value = "/pw", method = RequestMethod.POST)
	public String sendPWEmail(@Valid @ModelAttribute("findPWForm") FindPWForm findPWForm, BindingResult result, 
			HttpSession session, Model model) throws Exception {
		if (result.hasErrors()) {
			return "auth/FindPWForm";
		}
		
		try {
			authService.findPW(findPWForm);
		} catch (FindPWNotMatchingException e) {
			result.reject("findPWNotMatching", "일치하는 사용자가 없습니다.");
			return "auth/FindPWForm";
		}
		
		return "auth/FindPWIdentify";
	}
	
	@RequestMapping(value = "/pw/identify", method = RequestMethod.POST)
	public String checkIdentify	(@ModelAttribute("findPWForm") FindPWForm findPWForm, BindingResult result, 
			@RequestParam("code") int code, HttpSession session, Model model, HttpServletResponse response) throws Exception {
		try {
			authService.checkSecurityCode(code, findPWForm);
		} catch (SecurityCodeNotMatching e) {
			result.reject("securityCodeNotMatching", "인증번호가 일치하지 않습니다.");
			return "auth/FindPWIdentify";
		}
		
		return "auth/ResetPW";
	}
	
	@RequestMapping(value = "/pw/reset", method = RequestMethod.POST)
	public String resetPW(@Valid @ModelAttribute("resetPWForm") ResetPWForm resetPWForm, BindingResult result,
			HttpSession session, Model model) throws Exception {
		
		if (result.hasErrors()) {
			return "auth/ResetPW";
		}
		
		FindPWForm findPWForm = (FindPWForm)session.getAttribute("findPWForm");
		String type = findPWForm.getType();
		String email = findPWForm.getEmail();
		
		try {
			if (!resetPWForm.getPassword().contentEquals(resetPWForm.getCheckedPassword())) {
				throw new PasswordNotMatchingException();
			}
		} catch (PasswordNotMatchingException e) {
			result.reject("passwordNotMatching", "두 비밀번호가 일치하지 않습니다.");
			return "auth/ResetPW";
		}
		
		
		String encPassword = passwordEncoder.encode(resetPWForm.getPassword());
		resetPWForm.setPassword(encPassword);

		resetPWForm.setType(type);
		resetPWForm.setEmail(email);
		authService.resetPW(resetPWForm);
		
		return "redirect:/auth/loginForm.do";
	}
}
