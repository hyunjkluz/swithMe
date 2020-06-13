/**
 * 
 */
package ssd.pbl.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ssd.pbl.model.ClassCard;
import ssd.pbl.model.ClassTeacherDetail;

/**
 * @author kimhyunjin
 * @date: Jun 12, 2020 12:45:17 AM
 */
public interface ClassMapper {
	List<ClassCard> selectAutoMatchClass();

	List<ClassCard> selectAllClass();

	ClassTeacherDetail selectClassTeacherDetailByClassId(@Param("classId") int classId);
}