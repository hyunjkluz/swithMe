package ssd.pbl.repository.mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssd.pbl.controller.UserSession;
import ssd.pbl.model.FindIDForm;

@Repository
public class TeacherMapperRepository {
	
	@Autowired
	private TeacherMapper teacherMapper;
	
	public String selectEmailByNameAndPhone(FindIDForm findIDForm) {
		return teacherMapper.selectEmailByNameAndPhone(findIDForm);
	}
	
//	public UserSession selectTeacherUserInfo(String email) {
//		return teacherMapper.selectTeacherUserInfo(email);
//	}
}
