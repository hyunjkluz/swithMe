/**
 * 
 */
package ssd.pbl.repository.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssd.pbl.model.ClassCard;
import ssd.pbl.model.ClassTeacherDetail;

/**
 * @author kimhyunjin
 * @date: Jun 12, 2020 12:46:31 AM
 */
@Repository
public class ClassMapperRepository {
	@Autowired
	private ClassMapper classMapper;

	public List<ClassCard> selectAutoMatchClass() {
		return classMapper.selectAutoMatchClass();
	}
	
	public List<ClassCard> selectAllClass() {
		return classMapper.selectAllClass();
	}
	
	public ClassTeacherDetail selectClassTeacherDetailByClassId(int classId) {
		return classMapper.selectClassTeacherDetailByClassId(classId);
	}

}
