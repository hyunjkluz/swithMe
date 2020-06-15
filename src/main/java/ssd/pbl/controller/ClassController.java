/**
 * 
 */
package ssd.pbl.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import ssd.pbl.model.ClassCard;
import ssd.pbl.model.ClassTeacherDetail;
import ssd.pbl.model.Subject;
import ssd.pbl.service.ClassService;
import ssd.pbl.service.SubjectService;

/**
 * @author kimhyunjin
 * @date: May 22, 2020 3:12:43 AM
 */
@Controller
@SessionAttributes("subjects")
public class ClassController {
	private static final Logger LOGGER = LoggerFactory.getLogger(ClassController.class);

	@Autowired
	private ClassService classService;
	@Autowired
	private SubjectService subjectService;

	@ModelAttribute("subjects")
	public List<Subject> subjectFormBacking() {
		return subjectService.getAllAubject();
	}

	@RequestMapping(value = "/class/{classId}", method = RequestMethod.GET)
	public ModelAndView getAutoMathForm2(@PathVariable int classId, Model model, HttpSession session) {
		ModelAndView mav = new ModelAndView("match/TeacherDetail");

		ClassTeacherDetail ctd = classService.getClassTeacherDetailByClassId(classId);
		mav.addObject("detail", ctd);

		return mav;
	}

	@RequestMapping(value = "/main/class", method = RequestMethod.GET)
	public ModelAndView getClassList() {
		ModelAndView mav = new ModelAndView("main/FindClass");
		mav.addObject("classCardList", classService.getAllClass());

		return mav;
	}

//	@RequestMapping(value="/class/subject", method=RequestMethod.GET)
//	@ResponseBody
//	public List<ClassCard> getClassListSelectBySubjectId() {
//		
//	}
}
