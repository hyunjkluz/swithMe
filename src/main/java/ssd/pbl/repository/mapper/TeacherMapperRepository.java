package ssd.pbl.repository.mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssd.pbl.controller.UserSession;
import ssd.pbl.model.FindIDForm;
import ssd.pbl.model.FindPWForm;
import ssd.pbl.model.LoginForm;
import ssd.pbl.model.ResetPWForm;
import ssd.pbl.model.Teacher;

@Repository
public class TeacherMapperRepository {
	
	@Autowired
	private TeacherMapper teacherMapper;
	
	public String selectEmailByNameAndPhone(FindIDForm findIDForm) {
		return teacherMapper.selectEmailByNameAndPhone(findIDForm);
	}
	
	public UserSession selectTeacherUserInfo(String email) {
		return teacherMapper.selectTeacherUserInfo(email);
	}
	
	public LoginForm selectTeacher(String email) {
		return teacherMapper.selectTeacher(email);
	}
	
	public Teacher selectTeacherById(Integer id) {
		return teacherMapper.selectTeacherById(id);
	}
	
	public Integer selectTeacherMatchIdByTeacherId(Integer teacherId) {
		return teacherMapper.selectTeacherMatchIdByTeacherId(teacherId);
	}
	
	public Integer selectTeacherByEmailAndName(FindPWForm findPWForm) {
		return teacherMapper.selectTeacherByEmailAndName(findPWForm);
	}
	
	public void updateTeacherPW(ResetPWForm resetPWForm) {
		teacherMapper.updateTeacherPW(resetPWForm);
	}
}
