/**
 * 
 */
package ssd.pbl.repository.mapper;

import ssd.pbl.model.StudentMatchForm;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:37:26 AM
 */
public interface StudentMapper {
	Integer insertStudentMatch(StudentMatchForm studentMatchForm);

	Integer insertStudentRegion(int id, int dongId);

	Integer insertStudentCharacter(int id, int characterId);

	Integer insertStudentTestResult(int id, int testId, String answer);

}
