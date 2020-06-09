package ssd.pbl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.SessionAttributes;

import ssd.pbl.model.Subject;
import ssd.pbl.model.SubjectLevel;
import ssd.pbl.service.SubjectService;

@Controller
@RequestMapping("/teacher/match")
@SessionAttributes("tminfo")
public class MatchController {
	private static final Logger LOGGER = LoggerFactory.getLogger(MatchController.class);
	
	private static final String STEP1_FORM_VIEW = "jointeacher/InputMInfoTeacherSubject";
	private static final String STEP2_FORM_VIEW = "jointeacher/InputMInfoTeacherClassType";
	private static final String STEP3_FORM_VIEW = "jointeacher/InputMInfoTeacherCommonInfo";
	private static final String STEP4_FORM_VIEW = "jointeacher/InputMInfoTeacherChar";
	private static final String STEP5_FORM_VIEW = "jointeacher/InputMInfoTeacherProfiles";
	private static final String DONE = "jointeacher/InputMInfoTeacherFinish";
	
	@ModelAttribute("tminfo")
	public MatchCommand formBacking() {
		MatchCommand tmf = new MatchCommand();
		return tmf;
	}   
	
	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping(value = "/form.do", method = RequestMethod.GET)
	public String step1() {
		List<Subject> subjects = subjectService.getAllAubject();
		
		return STEP1_FORM_VIEW;
	}
	
	@RequestMapping(value = "/step1", method = RequestMethod.GET)
	public String step1FromStep2() {
		return STEP1_FORM_VIEW;
	} // step2 > step1
	
	@RequestMapping(value = "/step2", method = RequestMethod.POST)
	public String step2(@Valid @ModelAttribute("tminfo") MatchCommand tmInfo, BindingResult result, 
			HttpServletRequest request) {
		System.out.println("command 객체: " + tmInfo);
		// 유효성 검사
		return STEP2_FORM_VIEW;
	}
	
	@RequestMapping(value = "/step2", method = RequestMethod.GET)
	public String step2FromStep3() {
		return STEP2_FORM_VIEW;
	} // step3 > step2
	
	@RequestMapping(value = "/step3", method = RequestMethod.POST)
	public String step3(@Valid @ModelAttribute("tminfo") MatchCommand tmInfo, BindingResult result) {
		System.out.println("command 객체: " + tmInfo);
		// 유효성 검사
		return STEP3_FORM_VIEW;
	}
	
	@RequestMapping(value = "/step3", method = RequestMethod.GET)
	public String step3FromStep4() {
		return STEP3_FORM_VIEW;
	} // step4 > step3
	
	@RequestMapping(value = "/step4", method = RequestMethod.POST)
	public String step4(@Valid @ModelAttribute("tminfo") MatchCommand tmInfo, BindingResult result) {
		System.out.println("command 객체: " + tmInfo);
		return STEP4_FORM_VIEW;
	}
	
	@RequestMapping(value = "/step4", method = RequestMethod.GET)
	public String step4FromStep5() {
		return STEP4_FORM_VIEW;
	}
	
	@RequestMapping(value = "/step5", method = RequestMethod.POST)
	public String step5(@Valid @ModelAttribute("tmInfo") MatchCommand tmInfo, BindingResult result) {
		System.out.println("command 객체: " + tmInfo);
		return STEP5_FORM_VIEW;
	}
	
	@RequestMapping(value = "/step5", method = RequestMethod.GET)
	public String step5FromFin() {
		return STEP5_FORM_VIEW;
	}
	
	@RequestMapping(value = "/fin", method = RequestMethod.POST)
	public String fin() {
		return DONE;
	}
		
}
