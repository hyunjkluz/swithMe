/**
 * 
 */
package ssd.pbl.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ssd.pbl.model.Subject;
import ssd.pbl.model.SubjectTestPaper;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:40:00 AM
 */
public interface SubjectMapper {
	Integer insertSubject(@Param("name") String name, @Param("category") String category);

	List<Subject> selectAllSubject();
	
	List<SubjectTestPaper> selectTestQuestionBySubjectId(@Param("subjectId") int subjectId);
}
