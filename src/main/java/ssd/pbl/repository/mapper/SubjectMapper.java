/**
 * 
 */
package ssd.pbl.repository.mapper;

import java.util.List;

import ssd.pbl.model.Subject;
import ssd.pbl.model.SubjectTestPaper;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:40:00 AM
 */
public interface SubjectMapper {
	
	List<Subject> selectAllSubject();
	
	List<SubjectTestPaper> selectTestQuestionBySubjectId(int subjectId);
}
