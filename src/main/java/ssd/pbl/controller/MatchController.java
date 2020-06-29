package ssd.pbl.controller;

import java.util.Arrays;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.util.WebUtils;

import ssd.pbl.model.Dong;
import ssd.pbl.model.Gu;
import ssd.pbl.model.RadioButton;
import ssd.pbl.model.Sido;
import ssd.pbl.model.Subject;
import ssd.pbl.model.SubjectLevel;
import ssd.pbl.model.TeacherMatchForm;
import ssd.pbl.service.CharacterService;
import ssd.pbl.service.MatchService;
import ssd.pbl.service.RegionService;
import ssd.pbl.service.SubjectService;

@Controller
@RequestMapping("/teacher/match")
@SessionAttributes("tmInfo")
public class MatchController {
	private static final Logger LOGGER = LoggerFactory.getLogger(MatchController.class);
	
	private static final String STEP1_FORM_VIEW = "jointeacher/InputMInfoTeacherSubject";
	private static final String STEP2_FORM_VIEW = "jointeacher/InputMInfoTeacherClassType";
	private static final String STEP3_FORM_VIEW = "jointeacher/InputMInfoTeacherCommonInfo";
	private static final String STEP4_FORM_VIEW = "jointeacher/InputMInfoTeacherChar";
	private static final String STEP5_FORM_VIEW = "jointeacher/InputMInfoTeacherProfiles";
	private static final String DONE = "jointeacher/InputMInfoTeacherFinish";
	
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private CharacterService characterService;
	@Autowired
	private RegionService regionService;
	@Autowired
	private MatchService matchService;
	
	@ModelAttribute("tmInfo")
	public TeacherMatchForm formBacking() {
		TeacherMatchForm tmf = new TeacherMatchForm();
		return tmf;
	}
	
	@ModelAttribute("subjects")
	public List<Subject> subjFormBacking() {
		return subjectService.getAllAubject();
	}
	
	@ModelAttribute("sidos")
	public List<Sido> sidoFormBacking() {
		return regionService.getAllSido();
	}

	@ModelAttribute("gus")
	public List<Gu> guFormBacking() {
		return regionService.getGuBySidoId(1);
	}

	@ModelAttribute("dongs")
	public List<Dong> dongFormBacking() {
		return regionService.getDongByGuId(1);
	}
	
	@ModelAttribute("levels")
	public List<RadioButton> levelFormBacking() {
		return Arrays.asList(new RadioButton("기초", 1, null), new RadioButton("보통", 2, null),
				new RadioButton("심화", 3, null));
	}

	@ModelAttribute("genders")
	public List<RadioButton> genderFormBacking() {
		return Arrays.asList(new RadioButton("성별 무관", 0, "ANY"), new RadioButton("여자", 0, "WOMAN"),
				new RadioButton("남자", 0, "MAN"));
	}
	
	@ModelAttribute("times")
	public List<RadioButton> timeFormBacking() {
		return Arrays.asList(new RadioButton("오전", 0, "am"), new RadioButton("오후", 0, "pm"),
				new RadioButton("저녁", 0, "eve"));
	}
	
	@ModelAttribute("char1")
	public List<Character> character1FormBacking() {
		return characterService.getTwoCharacterById(11, 12);
	}

	@ModelAttribute("char2")
	public List<Character> character2FormBacking() {
		return characterService.getTwoCharacterById(13, 14);
	}

	@ModelAttribute("char3")
	public List<Character> character3FormBacking() {
		return characterService.getTwoCharacterById(15, 16);
	}

	@ModelAttribute("char4")
	public List<Character> character4FormBacking() {
		return characterService.getTwoCharacterById(17, 18);
	}

	@ModelAttribute("char5")
	public List<Character> character5FormBacking() {
		return characterService.getTwoCharacterById(19, 20);
	}
	
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
	public String step2(@Valid @ModelAttribute("tmInfo") TeacherMatchForm tmInfo, BindingResult result, 
			HttpServletRequest request) {
		System.out.println("command 객체: " + tmInfo.toString());
		// 유효성 검사
		return STEP2_FORM_VIEW;
	}
	
	@RequestMapping(value = "/step2", method = RequestMethod.GET)
	public String step2FromStep3() {
		return STEP2_FORM_VIEW;
	} // step3 > step2
	
	@RequestMapping(value = "/step3", method = RequestMethod.POST)
	public String step3(@Valid @ModelAttribute("tmInfo") TeacherMatchForm tmInfo, BindingResult result) {
		System.out.println("command 객체: " + tmInfo.toString());
		// 유효성 검사
		return STEP3_FORM_VIEW;
	}
	
	@RequestMapping(value = "/step3", method = RequestMethod.GET)
	public String step3FromStep4() {
		return STEP3_FORM_VIEW;
	} // step4 > step3
	
	@RequestMapping(value = "/step4", method = RequestMethod.POST)
	public String step4(@Valid @ModelAttribute("tmInfo") TeacherMatchForm tmInfo, BindingResult result) {
		System.out.println("command 객체: " + tmInfo.toString());
		return STEP4_FORM_VIEW;
	}
	
	@RequestMapping(value = "/step4", method = RequestMethod.GET)
	public String step4FromStep5() {
		return STEP4_FORM_VIEW;
	}
	
	@RequestMapping(value = "/step5", method = RequestMethod.POST)
	public String step5(@Valid @ModelAttribute("tmInfo") TeacherMatchForm tmInfo, BindingResult result) {
		
		if (tmInfo.getCh1() < 1) {
			result.rejectValue("ch1", "empty", "둘 중 하나의 유형을 선택해주세요");
		}

		if (tmInfo.getCh2() < 2) {
			result.rejectValue("ch2", "empty", "둘 중 하나의 유형을 선택해주세요");
		}

		if (tmInfo.getCh3() < 3) {
			result.rejectValue("ch3", "empty", "둘 중 하나의 유형을 선택해주세요");
		}

		if (tmInfo.getCh4() < 4) {
			result.rejectValue("ch4", "empty", "둘 중 하나의 유형을 선택해주세요");
		}

		if (tmInfo.getCh4() < 5) {
			result.rejectValue("ch5", "empty", "둘 중 하나의 유형을 선택해주세요");
		}

		
		System.out.println("command 객체: " + tmInfo.toString());
		return STEP5_FORM_VIEW;
	}
	
	@RequestMapping(value = "/step5", method = RequestMethod.GET)
	public String step5FromFin() {
		return STEP5_FORM_VIEW;
	}
	
	@RequestMapping(value = "/fin", method = RequestMethod.POST)
	public String fin(HttpServletRequest request, @Valid @ModelAttribute("tmInfo") TeacherMatchForm tmInfo, BindingResult result,
			SessionStatus status) {
		UserSession userSession = (UserSession) WebUtils.getSessionAttribute(request, "userSession");
		tmInfo.setId(userSession.getId());
		System.out.println("=========================");
		System.out.println(tmInfo.toString());
		System.out.println("=========================");
		matchService.createMatch(tmInfo);
		return DONE;
	}
		
}
