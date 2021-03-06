/**
 * 
 */
package ssd.pbl.repository.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssd.pbl.model.ClassCard;
import ssd.pbl.model.ClassTeacherDetail;
import ssd.pbl.model.StudentMatchForm;

/**
 * @author kimhyunjin
 * @date: Jun 12, 2020 12:46:31 AM
 */
@Repository
public class ClassMapperRepository {
	@Autowired
	private ClassMapper classMapper;

	public List<ClassCard> selectAutoMatchClass(StudentMatchForm stm) {
		return classMapper.selectAutoMatchClass(stm);
	}
	
	public List<ClassCard> selectAllClass() {
		return classMapper.selectAllClass();
	}
	
	public List<ClassCard> selectClassBySubjectId(List<Integer> subIds) {
		return classMapper.selectClassBySubjectId(subIds);
	}
	
	public ClassTeacherDetail selectClassTeacherDetailByClassId(int classId) {
		return classMapper.selectClassTeacherDetailByClassId(classId);
	}
	
	public Map<String,Integer> selectTeacherAndSubjectByClassId(int classId) {
		return classMapper.selectTeacherAndSubjectByClassId(classId);
	}

}
