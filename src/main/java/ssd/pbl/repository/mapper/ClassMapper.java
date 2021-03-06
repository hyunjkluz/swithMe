/**
 * 
 */
package ssd.pbl.repository.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import ssd.pbl.model.ClassCard;
import ssd.pbl.model.ClassTeacherDetail;
import ssd.pbl.model.StudentMatchForm;

/**
 * @author kimhyunjin
 * @date: Jun 12, 2020 12:45:17 AM
 */
public interface ClassMapper {
	List<ClassCard> selectAutoMatchClass(StudentMatchForm stm);

	List<ClassCard> selectAllClass();
	
	List<ClassCard> selectClassBySubjectId(@Param("subIds") List<Integer> subIds);

	ClassTeacherDetail selectClassTeacherDetailByClassId(@Param("classId") int classId);
	
	Map<String,Integer> selectTeacherAndSubjectByClassId(@Param("classId") int classId);
}
