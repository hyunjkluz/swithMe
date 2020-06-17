package ssd.pbl.repository.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssd.pbl.model.ConnectionCard;
import ssd.pbl.model.StudentRequest;

@Repository
public class ConnectionMapperRepository {
	@Autowired
	private ConnectionMapper connectionMaper;

	public List<ConnectionCard> selectConnectionList(int sid) {
		return connectionMaper.selectConnectionList(sid);
	}

	public Integer insertConnection(Integer studentId, Integer teacherId, Integer subjectId, Integer studentMatchId) {
		return connectionMaper.insertConnection(studentId, teacherId, subjectId, studentMatchId);
	}

	public List<ConnectionCard> selectTeachersConnectionByTeacherId(int teacherId) {
		return connectionMaper.selectTeachersConnectionByTeacherId(teacherId);
	}

	public List<ConnectionCard> selectStudentsConnectionByStudentId(int studentId) {
		return connectionMaper.selectStudentsConnectionByStudentId(studentId);
	}
	
	public StudentRequest selectStudentRequestByConnectionId(int connectionId) {
		return connectionMaper.selectStudentRequestByConnectionId(connectionId);
	}

	public Integer updateConnectionState(Integer connectionId, String step) {
		return connectionMaper.updateConnectionState(connectionId, step);
	}
}
