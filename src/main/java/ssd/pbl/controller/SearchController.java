package ssd.pbl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ssd.pbl.model.Dong;
import ssd.pbl.model.Major;
import ssd.pbl.model.SchoolForm;
import ssd.pbl.model.University;
import ssd.pbl.service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {

	@Autowired
	private SearchService searchService;
	
	@RequestMapping(value = "/school/{school}", method = RequestMethod.GET)
	@ResponseBody
	public List<SchoolForm> searchSchool(@PathVariable String school) {
		return searchService.searchSchool(school);
	}
	
	@RequestMapping(value = "/university/{university}", method = RequestMethod.GET)
	@ResponseBody
	public List<University> searchUniversity(@PathVariable String university) {
		return searchService.searchUniversity(university);
	}
	
	@RequestMapping(value = "/major/{major}", method = RequestMethod.GET)
	@ResponseBody
	public List<Major> searchMajor(@PathVariable int major) {
		return searchService.searchMajor(major);
	}
}
