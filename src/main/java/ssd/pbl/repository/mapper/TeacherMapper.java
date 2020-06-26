package ssd.pbl.repository.mapper;

import org.apache.ibatis.annotations.Param;

import ssd.pbl.controller.UserSession;
import ssd.pbl.model.FindIDForm;
import ssd.pbl.model.FindPWForm;
import ssd.pbl.model.LoginForm;
import ssd.pbl.model.ResetPWForm;
import ssd.pbl.model.Teacher;
import ssd.pbl.model.TeacherMatchForm;

public interface TeacherMapper {
	String selectEmailByNameAndPhone(FindIDForm findIDForm);
	
	UserSession selectTeacherUserInfo(String email);
	
	LoginForm selectTeacher(String email);
	
	Teacher selectTeacherById(@Param("id") Integer id);
	
	Integer selectTeacherMatchIdByTeacherId(@Param("teacherId") Integer teacherId);
	
	Integer selectTeacherByEmailAndName(FindPWForm findPWForm);
	
	void updateTeacherPW(ResetPWForm resetPWForm);
	
	Integer insertTeacherMatch(TeacherMatchForm tmInfo);
	
	Integer insertTeacherRegion(@Param("id") int id, @Param("dongId") int dongId);
	
	Integer insertStudentTime(@Param("id") int id, @Param("time") String time);

	Integer insertStudentCharacter(@Param("id")int id, @Param("characterId") int characterId);
	
}
