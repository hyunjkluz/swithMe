/**
 * 
 */
package ssd.pbl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.model.ReviewForm;
import ssd.pbl.repository.mapper.FeedbackMapper;
import ssd.pbl.repository.mapper.FeedbackMapperRepository;

/**
 * @author kimhyunjin
 * @date: Jun 18, 2020 2:28:53 AM
 */
@Service
public class FeedbackService {
	@Autowired
	private FeedbackMapperRepository feedbackMapperRepo;
	
	public Integer postFeedback(ReviewForm reviewForm) {
		return feedbackMapperRepo.insertFeedback(reviewForm);
	}
	

}
