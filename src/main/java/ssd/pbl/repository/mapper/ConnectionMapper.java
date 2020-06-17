/**
 * 
 */
package ssd.pbl.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ssd.pbl.model.ConnectionCard;
import ssd.pbl.model.StudentMatchForm;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:34:55 AM
 */
public interface ConnectionMapper {
	Integer insertConnection(@Param("studentId") Integer studentId, @Param("teacherId") Integer teacherId,
			@Param("subjectId") Integer subjectId, @Param("studentMatchId") Integer studentMatchId);

	List<ConnectionCard> selectConnectionList(int sid);
}
