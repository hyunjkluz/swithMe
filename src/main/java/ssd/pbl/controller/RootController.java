/**
 * 
 */
package ssd.pbl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author kimhyunjin
 * @date: Jun 19, 2020 4:43:23 PM
 */
@Controller
@RequestMapping("/")
public class RootController {

	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		return "redirect:/main";
	}

}