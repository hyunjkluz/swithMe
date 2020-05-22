/**
 * 
 */
package ssd.pbl.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author kimhyunjin
 * @date: May 22, 2020 3:12:43 AM
 */
@Controller
public class ClassController {

	@RequestMapping(value = "/class/{classId}", method = RequestMethod.GET)
	public String getAutoMathForm2(@PathVariable int classId, Model model, HttpSession session) {
		return "match/TeacherDetail";
	}

	@RequestMapping(value = "/main/class", method = RequestMethod.GET)
	public String getClassList() {
		return "main/FindClass";
	}
}
