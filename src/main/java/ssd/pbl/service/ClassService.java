/**
 * 
 */
package ssd.pbl.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.model.ClassCard;
import ssd.pbl.model.ClassTeacherDetail;
import ssd.pbl.model.StudentMatchForm;
import ssd.pbl.repository.mapper.ClassMapperRepository;
import ssd.pbl.repository.mapper.FeedbackMapper;

/**
 * @author kimhyunjin
 * @date: Jun 12, 2020 12:47:41 AM
 */
@Service
public class ClassService {
	private static final Logger LOGGER = LoggerFactory.getLogger(ClassService.class);

	@Autowired
	private ClassMapperRepository classMapperRepo;
	@Autowired
	private FeedbackMapper feedbackMapper;

	public List<ClassCard> getAutoMatchClasses(StudentMatchForm stm) {
		return classMapperRepo.selectAutoMatchClass(stm);
	}

	public List<ClassCard> getAllClass() {
		return classMapperRepo.selectAllClass();

	}

	public ClassTeacherDetail getClassTeacherDetailByClassId(int classId) {
		ClassTeacherDetail ctd = classMapperRepo.selectClassTeacherDetailByClassId(classId);
		ctd.setFeedback(feedbackMapper.selectClassFeedBackByTeacherId(ctd.getTeacher().getId()));

		LOGGER.info(ctd.getFeedback().toString());

		return ctd;
	}

	public List<ClassCard> getClassBySubjectId(List<Integer> subIds) {
		return classMapperRepo.selectClassBySubjectId(subIds);
	}

	public Map<String, Integer> getTeacherAndSubjectByClassId(int classId) {
		return classMapperRepo.selectTeacherAndSubjectByClassId(classId);
	}

}
