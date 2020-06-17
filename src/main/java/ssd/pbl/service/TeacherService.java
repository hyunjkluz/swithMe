/**
 * 
 */
package ssd.pbl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.model.Teacher;
import ssd.pbl.repository.mapper.TeacherMapperRepository;

/**
 * @author kimhyunjin
 * @date: Jun 17, 2020 11:18:24 PM
 */
@Service
public class TeacherService {
	@Autowired
	private TeacherMapperRepository teacherMapperRepo;
	
	public Teacher getTeacherByid(Integer teacherId) {
		return teacherMapperRepo.selectTeacherById(teacherId);
	}
	
	public Integer getTeacherMatchIdByTeacherId(Integer teacherId) {
		return teacherMapperRepo.selectTeacherMatchIdByTeacherId(teacherId);
	}

}
