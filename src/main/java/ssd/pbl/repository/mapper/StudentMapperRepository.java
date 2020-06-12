package ssd.pbl.repository.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssd.pbl.controller.UserSession;
import ssd.pbl.model.FindIDForm;
import ssd.pbl.model.LoginForm;
import ssd.pbl.model.SchoolForm;

@Repository
public class StudentMapperRepository {

	@Autowired
	private StudentMapper studentMapper;
	
	public LoginForm selectStudent(String email) {
		return studentMapper.selectStudent(email);
	}
	
	public boolean selectCountStudentEmail(String email) {
		if (studentMapper.selectCountStudentEmail(email) == 0) {
			return false;
		} else {
			return true;
		}
	}
		
	public List<SchoolForm> selectSchool(String school) {
		return studentMapper.selectSchoolListBySchoolName(school);
	}
	
	public String selectEmailByNameAndPhone(FindIDForm findIDForm) {
		return studentMapper.selectEmailByNameAndPhone(findIDForm);
	}
	
	public UserSession selectStudentUserInfo(String email) {
		return studentMapper.selectStudentUserInfo(email);
	}
}
