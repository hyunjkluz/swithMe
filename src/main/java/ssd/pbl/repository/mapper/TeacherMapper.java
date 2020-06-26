package ssd.pbl.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ssd.pbl.controller.UserSession;
import ssd.pbl.model.FindIDForm;
import ssd.pbl.model.FindPWForm;
import ssd.pbl.model.LoginForm;
import ssd.pbl.model.ResetPWForm;
import ssd.pbl.model.StudentForm;
import ssd.pbl.model.Teacher;
import ssd.pbl.model.TeacherForm;
import ssd.pbl.model.University;

public interface TeacherMapper {
	String selectEmailByNameAndPhone(FindIDForm findIDForm);
	
	UserSession selectTeacherUserInfo(String email);
	
	LoginForm selectTeacher(String email);
	
	Teacher selectTeacherById(@Param("id") Integer id);
	
	Integer selectTeacherMatchIdByTeacherId(@Param("teacherId") Integer teacherId);
	
	Integer selectTeacherByEmailAndName(FindPWForm findPWForm);
	
	void updateTeacherPW(ResetPWForm resetPWForm);
	
	void insertTeacher(TeacherForm teacher);
	
	void insertTeacherInfo(TeacherForm teacher);
	
	Integer selectTeacherId(String email);
	
	List<University> selectUniversity(String university);
}
