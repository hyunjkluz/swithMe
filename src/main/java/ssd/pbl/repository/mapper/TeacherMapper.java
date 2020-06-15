package ssd.pbl.repository.mapper;

import ssd.pbl.controller.UserSession;
import ssd.pbl.model.FindIDForm;
import ssd.pbl.model.LoginForm;

public interface TeacherMapper {
	String selectEmailByNameAndPhone(FindIDForm findIDForm);
	
	UserSession selectTeacherUserInfo(String email);
	
	LoginForm selectTeacher(String email);
}
