package ssd.pbl.repository.mapper;

import org.apache.ibatis.annotations.Param;

import ssd.pbl.controller.UserSession;
import ssd.pbl.model.FindIDForm;
import ssd.pbl.model.LoginForm;
import ssd.pbl.model.Teacher;

public interface TeacherMapper {
	String selectEmailByNameAndPhone(FindIDForm findIDForm);
	
	UserSession selectTeacherUserInfo(String email);
	
	LoginForm selectTeacher(String email);
	
	Teacher selectTeacherById(@Param("id") Integer id);
}
