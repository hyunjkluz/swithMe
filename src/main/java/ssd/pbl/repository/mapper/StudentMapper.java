/**
 * 
 */
package ssd.pbl.repository.mapper;

import java.util.List;

import ssd.pbl.controller.UserSession;
import ssd.pbl.model.FindIDForm;
import ssd.pbl.model.LoginForm;
import ssd.pbl.model.SchoolForm;
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

	LoginForm selectStudent(String email);
	
	Integer selectCountStudentEmail(String email);
	
	List<SchoolForm> selectSchoolListBySchoolName(String school);
	
	String selectEmailByNameAndPhone(FindIDForm findIDForm);
	
	UserSession selectStudentUserInfo(String email);
}
