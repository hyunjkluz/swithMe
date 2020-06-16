/**
 * 
 */
package ssd.pbl.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

import ssd.pbl.model.ClassCard;
import ssd.pbl.model.Dong;
import ssd.pbl.model.Gu;
import ssd.pbl.model.RadioButton;
import ssd.pbl.model.Sido;
import ssd.pbl.model.StudentMatchForm;
import ssd.pbl.model.StudentTest;
import ssd.pbl.model.Subject;
import ssd.pbl.model.SubjectTestPaper;
import ssd.pbl.service.CharacterService;
import ssd.pbl.service.ClassService;
import ssd.pbl.service.RegionService;
import ssd.pbl.service.StudentService;
import ssd.pbl.service.SubjectService;

/**
 * @author kimhyunjin
 * @date: May 22, 2020 2:23:58 AM
 */

@Controller
@RequestMapping("/student/match")
@SessionAttributes({ "studentMatchForm", "subjects", "sidos", "gus", "dongs", "char1", "char2", "char3", "char4",
		"char5", "classCardList" })
public class AutoMatchController {
	private static final Logger LOGGER = LoggerFactory.getLogger(AutoMatchController.class);

	@Autowired
	private StudentService studentService;
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private RegionService regionService;
	@Autowired
	private CharacterService characterService;
	@Autowired
	private ClassService classService;

	@ModelAttribute("studentMatchForm")
	public StudentMatchForm formBacking() {
		StudentMatchForm smf = new StudentMatchForm();

		return smf;
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

	@ModelAttribute("levels")
	public List<RadioButton> levelFormBacking() {
		return Arrays.asList(new RadioButton("하", 1, null), new RadioButton("중", 2, null),
				new RadioButton("상", 3, null));
	}

	@ModelAttribute("genders")
	public List<RadioButton> genderFormBacking() {
		return Arrays.asList(new RadioButton("성별 무관", 0, "any"), new RadioButton("여자", 0, "women"),
				new RadioButton("남자", 0, "man"));
	}

	@ModelAttribute("times")
	public List<RadioButton> timeFormBacking() {
		return Arrays.asList(new RadioButton("오전", 0, "am"), new RadioButton("오후", 0, "pm"),
				new RadioButton("저녁", 0, "eve"));
	}

	@ModelAttribute("classCardList")
	public List<ClassCard> classCardFormBacking() {
		return null;
	}

	@RequestMapping(value = "/form.do", method = RequestMethod.GET)
	public String getAutoMatchForm() {
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
	public String postAutoMathForm1(@Valid @ModelAttribute("studentMatchForm") StudentMatchForm sMatchForm,
			BindingResult bindingResult) {
		LOGGER.info(sMatchForm.toString());

		if (bindingResult.hasErrors()) {
			LOGGER.info("유효성 검사 실패");
			return "automatch/InputAutoMInfoStudentClassInfo";
		}

		LOGGER.info("유효성 검사 완료");
		ArrayList<Integer> intDongIds = regionService.changDongStrToIntArray(sMatchForm.getDongIds());
		sMatchForm.setDongIdArr(intDongIds);

		List<SubjectTestPaper> stp = subjectService.getTestPaperBySubjectId(sMatchForm.getSubjectId());
		List<StudentTest> stList = new ArrayList<>();

		for (SubjectTestPaper stpN : stp) {
			stList.add(new StudentTest(stpN, ""));
		}
		sMatchForm.setSubjectTest(stList);

		return "automatch/InputAutoMInfoLevelTest";

	}

	@RequestMapping(value = "/step2", method = RequestMethod.POST)
	public String postAutoMathForm2(@ModelAttribute("studentMatchForm") StudentMatchForm sMatchForm) {

		return "automatch/InputAutoMInfoMyChar";
	}

	@RequestMapping(value = "/step3", method = RequestMethod.POST)
	public String postAutoMathForm3(@ModelAttribute("studentMatchForm") StudentMatchForm sMatchForm,
			BindingResult bindingResult) {

		if (sMatchForm.getCh1() < 1) {
			bindingResult.rejectValue("ch1", "empty", "둘 중 하나의 유형을 선택해주세요");
		}

		if (sMatchForm.getCh2() < 2) {
			bindingResult.rejectValue("ch2", "empty", "둘 중 하나의 유형을 선택해주세요");
		}

		if (sMatchForm.getCh3() < 3) {
			bindingResult.rejectValue("ch3", "empty", "둘 중 하나의 유형을 선택해주세요");
		}

		if (sMatchForm.getCh4() < 4) {
			bindingResult.rejectValue("ch4", "empty", "둘 중 하나의 유형을 선택해주세요");
		}

		if (sMatchForm.getCh4() < 5) {
			bindingResult.rejectValue("ch5", "empty", "둘 중 하나의 유형을 선택해주세요");
		}

		if (bindingResult.hasErrors()) {
			LOGGER.info("step3: 유효성 검사 실패");
			return "automatch/InputAutoMInfoMyChar";
		}
		LOGGER.info(sMatchForm.toString());
		return "automatch/InputAutoMInfoAddInfo";
	}

	@RequestMapping(value = "/step4", method = RequestMethod.POST)
	public String postAutoMathForm4(@ModelAttribute("classCardList") List<ClassCard> ccList,
			@ModelAttribute("studentMatchForm") StudentMatchForm sMatchForm, BindingResult bindingResult,
			HttpServletRequest request) {
		LOGGER.info(sMatchForm.toString());

		if (sMatchForm.getMemo().trim().length() <= 0) {
			bindingResult.rejectValue("memo", "empty", "성적을 입력해주세요");
		}

		if (bindingResult.hasErrors()) {
			LOGGER.info("step4: 유효성 검사 실패");
			return "automatch/InputAutoMInfoAddInfo";
		}

		HttpSession session = request.getSession();
		List<ClassCard> cc = classService.getAutoMatchClasses(sMatchForm);
		session.setAttribute("classCardList", cc);

		return "automatch/AutoMInfoResult";
	}

	@RequestMapping(value = "/fin", method = RequestMethod.POST)
	public String autoMatch(@ModelAttribute("studentMatchForm") StudentMatchForm sMatchForm,
			BindingResult bindingResult, SessionStatus sessionStatus, HttpServletRequest request) {
		if (sMatchForm.getTeacherId() < 1) {
			bindingResult.rejectValue("teacherId", "empty", "선생님 선택 후 수업 신청 버튼을 눌러주세요!");
		}

		if (bindingResult.hasErrors()) {
			LOGGER.info("fin:" + "유효성 검사 실패");
			return "automatch/AutoMInfoResult";
		}

		UserSession userSession = (UserSession) WebUtils.getSessionAttribute(request, "userSession");
		LOGGER.info("로그인된 유저 정보 : " + userSession.getId());

//		studentService.postAutoMatching(userSession.getId(), sMatchForm);
		sessionStatus.isComplete();

		return "match/ClassRequestFinish";
	}

}
