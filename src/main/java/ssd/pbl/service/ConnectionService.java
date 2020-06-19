package ssd.pbl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.model.ConnectionCard;
import ssd.pbl.model.RequestTeacher;
import ssd.pbl.model.StudentRequest;
import ssd.pbl.repository.mapper.ConnectionMapperRepository;

@Service
public class ConnectionService {
	@Autowired
	private ConnectionMapperRepository connectionMapperRepository;

	/*
	 * public List<ConnectionCard> getConnectionlist(int sid) { return
	 * connectionMapperRepository.selectConnectionList(sid); }
	 */
	public List<ConnectionCard> getMyClassTeachersConnection(Integer teacherId) {
		return connectionMapperRepository.selectMyClassTeachersConnectionByTeacherId(teacherId);
	}

	public List<ConnectionCard> getMyClassStudentsConnection(Integer studentId) {
		return connectionMapperRepository.selectMyClassStudentsConnectionByStudentId(studentId);
	}
	

	public Integer postConnection(Integer studentId, Integer teacherId, Integer subjectId, Integer studentMatchId) {
		return connectionMapperRepository.insertConnection(studentId, teacherId, subjectId, studentMatchId);
	}

	public List<ConnectionCard> getTeachersConnection(Integer teacherId) {
		return connectionMapperRepository.selectTeachersConnectionByTeacherId(teacherId);
	}

	public List<ConnectionCard> getStudentsConnection(Integer studentId) {
		return connectionMapperRepository.selectStudentsConnectionByStudentId(studentId);
	}

	public StudentRequest getStudentRequestByConnectionId(Integer connectionId) {
		return connectionMapperRepository.selectStudentRequestByConnectionId(connectionId);
	}
	
	public Integer putConnectionState(Integer connectionId, String step) {
		return connectionMapperRepository.updateConnectionState(connectionId, step);
	}
	
	public RequestTeacher getResuestTeacherByConnectionId(Integer connectionId) {
		return connectionMapperRepository.selectResuestTeacherByConnectionId(connectionId);
	}
	
	public ConnectionCard getConnectionCardByConnectionId(Integer connectionId) {
		return connectionMapperRepository.selectConnectionCardByConnectionId(connectionId);
	}
}
