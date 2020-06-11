/**
 * 
 */
package ssd.pbl.service;

import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.controller.AutoMatchController;
import ssd.pbl.model.Subject;
import ssd.pbl.model.SubjectTestPaper;
import ssd.pbl.repository.mapper.SubjectMapper;

/**
 * @author kimhyunjin
 * @date: May 31, 2020 10:55:41 PM
 */
@Service
public class SubjectService {
	private static final Logger LOGGER = LoggerFactory.getLogger(AutoMatchController.class);

	@Autowired
	private SubjectMapper subjectMapper;

	public List<Subject> getAllAubject() {
		return subjectMapper.selectAllSubject();
	}

	public Integer postSubject(String name, String category) {
		return subjectMapper.insertSubject(name, category);
	}

	public List<SubjectTestPaper> getTestPaperBySubjectId(int subjectId) {
//		SubjectTestPaper st1 = new SubjectTestPaper(4, 1, "문제1", "", 1);
//		SubjectTestPaper st2 = new SubjectTestPaper(5, 1, "문제2", "", 3);
//		SubjectTestPaper st3 = new SubjectTestPaper(6, 1, "문제2", "", 2);
//		List<SubjectTestPaper> list = Arrays.asList(st1, st2, st3);

		return subjectMapper.selectTestQuestionBySubjectId(subjectId);
//		return list;
	}

}
