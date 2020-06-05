/**
 * 
 */
package ssd.pbl.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import ssd.pbl.model.Dong;
import ssd.pbl.model.Gu;
import ssd.pbl.model.Sido;
import ssd.pbl.model.StudentMatchForm;
import ssd.pbl.model.Subject;
import ssd.pbl.service.RegionService;
import ssd.pbl.service.SubjectService;

/**
 * @author kimhyunjin
 * @date: May 22, 2020 2:23:58 AM
 */

@Controller
@RequestMapping("/student/match")
@SessionAttributes("studentMatchForm")
public class AutoMatchController {
	private static final Logger LOGGER = LoggerFactory.getLogger(AutoMatchController.class);

	@Autowired
	private SubjectService subjectService;
	@Autowired
	private RegionService regionService;
	
	@ModelAttribute("subjects")
	public List<Subject> subjFormBacking() {
		return subjectService.getAllAubject();
	}

	@ModelAttribute("studentMatchForm")
	public StudentMatchForm formBacking() {
		StudentMatchForm smf = new StudentMatchForm();

		return smf;
	}

	@RequestMapping(value = "/form.do", method = RequestMethod.GET)
	public ModelAndView getAutoMatchForm() {
		ModelAndView mav = new ModelAndView("automatch/InputAutoMInfoStudentClassInfo");

		List<Sido> sidos = regionService.getAllSido();
		List<Gu> gus = regionService.getGuBySidoId(1);
		List<Dong> dongs = regionService.getDongByGuId(9);

		mav.addObject("sidos", sidos);
		mav.addObject("gus", gus);
		mav.addObject("dongs", dongs);

		return mav;
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
	public String postAutoMathForm1(@Valid @ModelAttribute("studentMatchForm") StudentMatchForm sMatchForm,
			BindingResult bindingResult) {
		LOGGER.info(sMatchForm.toString());
		if (!bindingResult.hasErrors()) {
			ArrayList<Integer> intDongIds = regionService.changDongStrToIntArray(sMatchForm.getDongIds());
			sMatchForm.setDongIdArr(intDongIds);
		}

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
