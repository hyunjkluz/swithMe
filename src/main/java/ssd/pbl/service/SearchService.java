package ssd.pbl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.model.SchoolForm;
import ssd.pbl.model.University;
import ssd.pbl.repository.mapper.StudentMapperRepository;
import ssd.pbl.repository.mapper.TeacherMapperRepository;

@Service
public class SearchService {

	@Autowired
	private StudentMapperRepository studentMapperRepository;
	@Autowired
	private TeacherMapperRepository teacherMapperRepository;
	
	
	public List<SchoolForm> searchSchool(String school) {
		return studentMapperRepository.selectSchool(school);
	}
	
	public String selectSchoolType(int id) {
		return studentMapperRepository.selectSchoolType(id);
	}
	
	public List<University> searchUniversity(String university) {
		return teacherMapperRepository.selectUniversity(university);
	}
}
