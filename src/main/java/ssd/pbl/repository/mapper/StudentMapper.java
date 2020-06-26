package ssd.pbl.repository.mapper;

import java.util.List;

import ssd.pbl.controller.UserSession;
import ssd.pbl.model.FindIDForm;
import ssd.pbl.model.FindPWForm;
import ssd.pbl.model.LoginForm;
import ssd.pbl.model.ResetPWForm;
import ssd.pbl.model.SchoolForm;
import ssd.pbl.model.StudentForm;

import org.apache.ibatis.annotations.Param;

import ssd.pbl.model.StudentMatchForm;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:37:26 AM
 */
public interface StudentMapper {
	Integer insertStudentMatch(StudentMatchForm studentMatchForm);

	Integer insertStudentRegion(@Param("id") int id, @Param("dongId") int dongId);
	
	Integer insertStudentTime(@Param("id") int id, @Param("time") String time);

	Integer insertStudentCharacter(@Param("id")int id, @Param("characterId") int characterId);

	Integer insertStudentTestResult(@Param("id")int id, @Param("testId") int testId, @Param("answer") String answer);

	LoginForm selectStudent(String email);
	
	Integer selectCountStudentEmail(String email);
	
	List<SchoolForm> selectSchoolListBySchoolName(String school);
	
	String selectEmailByNameAndPhone(FindIDForm findIDForm);
	
	UserSession selectStudentUserInfo(String email);
	
	Integer updateStudentPW(String pw);
	
	Integer selectStudentByEmailAndName(FindPWForm findPWForm);
	
	void updateStudentPW(ResetPWForm resetPWForm);
	
	void insertStudent(StudentForm student);
	
	void insertStudentInfo(StudentForm student);
	
	String selectSchoolType(int id);
	
	Integer selectStudentId(String email);
}
