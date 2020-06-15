/**
 * 
 */
package ssd.pbl.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ssd.pbl.model.ClassFeedback;
import ssd.pbl.model.StudentMatchForm;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:34:55 AM
 */
public interface FeedbackMapper {
	List<ClassFeedback> selectClassFeedBackByTeacherId(@Param("teacherId") int teacherId);

}
