/**
 * 
 */
package ssd.pbl.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ssd.pbl.model.Subject;
import ssd.pbl.service.SubjectService;

/**
 * @author kimhyunjin
 * @date: May 22, 2020 2:23:58 AM 
 */

@Controller
@RequestMapping("/student/match")
public class AutoMatchController {
	private static final Logger LOGGER = LoggerFactory.getLogger(AutoMatchController.class);
	
	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping(value = "/form.do", method = RequestMethod.GET)
	public String getAutoMatchForm() {
		List<Subject> subjects = subjectService.getAllAubject();
		
		return "automatch/InputAutoMInfoStudentClassInfo";
	}

	@RequestMapping(value = "/step1", method = RequestMethod.GET)
	public String getAutoMathForm1() {
		return "automatch/InputAutoMInfoStudentClassInfo";
	}

	@RequestMapping(value = "/step2", method = RequestMethod.GET)
	public String getAutoMathForm2() {
		return "automatch/InputAutoMInfoLevelTest";
	}

	@RequestMapping(value = "/step3", method = RequestMethod.GET)
	public String getAutoMathForm3() {
		return "automatch/InputAutoMInfoMyChar";
	}

	@RequestMapping(value = "/step4", method = RequestMethod.GET)
	public String getAutoMathForm4() {
		return "automatch/InputAutoMInfoAddInfo";
	}
	
	@RequestMapping(value = "/step5", method = RequestMethod.GET)
	public String getAutoMathForm5() {
		return "automatch/AutoMInfoResult";
	}
	
	@RequestMapping(value = "/step1", method = RequestMethod.POST)
	public String postAutoMathForm1() {
		return "automatch/InputAutoMInfoLevelTest";
	}
	
	@RequestMapping(value = "/step2", method = RequestMethod.POST)
	public String postAutoMathForm2() {
		return "automatch/InputAutoMInfoMyChar";
	}

	@RequestMapping(value = "/step3", method = RequestMethod.POST)
	public String postAutoMathForm3() {
		return "automatch/InputAutoMInfoAddInfo";
	}

	@RequestMapping(value = "/step4", method = RequestMethod.POST)
	public String postAutoMathForm4() {
		return "automatch/AutoMInfoResult";
	}
	
}
