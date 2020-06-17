/**
 * 
 */
package ssd.pbl.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ssd.pbl.model.ConnectionCard;
import ssd.pbl.model.RequestTeacher;
import ssd.pbl.model.StudentMatchForm;
import ssd.pbl.model.StudentRequest;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:34:55 AM
 */
public interface ConnectionMapper {
	Integer insertConnection(@Param("studentId") Integer studentId, @Param("teacherId") Integer teacherId,
			@Param("subjectId") Integer subjectId, @Param("studentMatchId") Integer studentMatchId);

	List<ConnectionCard> selectConnectionList(int sid);
	
	List<ConnectionCard> selectTeachersConnectionByTeacherId(@Param("teacherId") int teacherId);
	
	List<ConnectionCard> selectStudentsConnectionByStudentId(@Param("studentId") int studentId);
	
	StudentRequest selectStudentRequestByConnectionId(@Param("connectionId") int connectionId);
	
	Integer updateConnectionState(@Param("connectionId") Integer connectionId, @Param("step") String step);
	
	RequestTeacher selectResuestTeacherByConnectionId(@Param("connectionId") Integer connectionId);
	
	ConnectionCard selectConnectionCardByConnectionId(@Param("connectionId") int connectionId);
}
