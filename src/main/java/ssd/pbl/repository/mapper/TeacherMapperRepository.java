package ssd.pbl.repository.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssd.pbl.controller.UserSession;
import ssd.pbl.model.FindIDForm;
import ssd.pbl.model.FindPWForm;
import ssd.pbl.model.LoginForm;
import ssd.pbl.model.Major;
import ssd.pbl.model.ResetPWForm;
import ssd.pbl.model.StudentForm;
import ssd.pbl.model.Teacher;
import ssd.pbl.model.TeacherForm;
import ssd.pbl.model.University;

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
	
	public void insertTeacher(TeacherForm teacher) {
		teacherMapper.insertTeacher(teacher);
	}
	
	public void insertTeacherInfo(TeacherForm teacher) {
		teacherMapper.insertTeacherInfo(teacher);
	}
	
	public Integer selectTeacherId(String email) {
		return teacherMapper.selectTeacherId(email);
	}
	
	public List<University> selectUniversity(String university) {
		return teacherMapper.selectUniversity(university);
	}
	
	public int selectCountTeacherEmail(String email) {
		return teacherMapper.selectCountTeacherEmail(email);
	}
	
	public List<Major> selectMajor(int major) {
		return teacherMapper.selectMajor(major);
	}
}
