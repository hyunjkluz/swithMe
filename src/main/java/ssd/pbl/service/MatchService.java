/**
 * 
 */
package ssd.pbl.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssd.pbl.controller.AutoMatchController;
import ssd.pbl.model.TeacherMatchForm;
import ssd.pbl.repository.mapper.MatchMapperRepository;

@Service
public class MatchService {
	private static final Logger LOGGER = LoggerFactory.getLogger(AutoMatchController.class);

	@Autowired
	private MatchMapperRepository matchMapperRepository;

	public void createMatch(TeacherMatchForm teacherMatchForm) {
		matchMapperRepository.insertMatch(teacherMatchForm);
	}

}
