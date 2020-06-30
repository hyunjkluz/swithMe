/**
 * 
 */
package ssd.pbl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import ssd.pbl.model.ConnectionCard;
import ssd.pbl.model.ReviewForm;
import ssd.pbl.service.ConnectionService;
import ssd.pbl.service.FeedbackService;

/**
 * @author kimhyunjin
 * @date: Jun 18, 2020 1:10:56 AM
 */
@Controller
@RequestMapping("/review/connection/{connectionId}")
@SessionAttributes("reviewForm")
public class ReviewController {
	private static final Logger LOGGER = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ConnectionService connectionService;
	@Autowired
	private FeedbackService feedbackService;
	
	@ModelAttribute("reviewForm")
	public ReviewForm reviewFormBacking(@PathVariable int connectionId) {
		ConnectionCard cc = connectionService.getConnectionCardByConnectionId(connectionId);
		return new ReviewForm(connectionId, cc.getTeacher(), cc.getSubject(), 0.0, "");
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public String getReviewForm() {
		return "review/WriteReview";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String postReviewForm(@Valid @ModelAttribute("reviewForm") ReviewForm reviewForm, BindingResult bindingResult, SessionStatus sessionStatus) {
		if (bindingResult.hasErrors()) {
			return "review/WriteReview";
		}

		feedbackService.postFeedback(reviewForm);
		
		sessionStatus.isComplete();
		return "redirect:/mypage/student.do";
	}
	

}
