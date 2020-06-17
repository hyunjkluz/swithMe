/**
 * 
 */
package ssd.pbl.repository.mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ssd.pbl.model.ReviewForm;

/**
 * @author kimhyunjin
 * @date: Jun 18, 2020 2:37:00 AM
 */
@Repository
public class FeedbackMapperRepository {
	@Autowired
	private FeedbackMapper feedbackMapper;
	@Autowired
	private ConnectionMapper connectionMapper;
	
	@Transactional
	public Integer insertFeedback(ReviewForm reviewForm) {
		Integer result = feedbackMapper.insertFeedback(reviewForm);
		connectionMapper.updateConnectionState(reviewForm.getConnectionId(), "FINISH");
		
		return result;
	}

}
