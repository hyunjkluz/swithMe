/**
 * 
 */
package ssd.pbl.repository.mapper;

import org.apache.ibatis.annotations.Param;

import ssd.pbl.model.StudentMatchForm;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:37:26 AM
 */
public interface StudentMapper {
	Integer insertStudentMatch(StudentMatchForm studentMatchForm);

	Integer insertStudentRegion(@Param("id") int id, @Param("dongId") int dongId);

	Integer insertStudentCharacter(@Param("id")int id, @Param("characterId") int characterId);

	Integer insertStudentTestResult(@Param("id")int id, @Param("testId") int testId, @Param("answer") String answer);

}
