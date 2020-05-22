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
 * @date: May 22, 2020 3:10:56 AM
 */
@Controller
public class ConnectionController {
	
	@RequestMapping(value = "/class/{classId}/request", method = RequestMethod.POST)
	public String postClassNewRequest(@PathVariable int classId, Model model, HttpSession session) {
		return "match/ClassRequestFinish";
	}

}
