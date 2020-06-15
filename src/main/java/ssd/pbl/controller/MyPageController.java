package ssd.pbl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("mypage/{id}")
public class MyPageController {

	@RequestMapping(value = "/student/main", method = RequestMethod.GET)
	public String student() {
		return "mypage/MyPageStudent";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
