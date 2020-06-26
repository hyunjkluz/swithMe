package ssd.pbl.repository.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ssd.pbl.controller.UserSession;
import ssd.pbl.model.FindIDForm;
import ssd.pbl.model.FindPWForm;
import ssd.pbl.model.LoginForm;
import ssd.pbl.model.ResetPWForm;
import ssd.pbl.model.SchoolForm;
import ssd.pbl.model.StudentForm;
import ssd.pbl.model.StudentMatchForm;
import ssd.pbl.model.StudentTest;

@Repository
public class StudentMapperRepository {

	@Autowired
	private StudentMapper studentMapper;
	@Autowired
	private ConnectionMapper connectionMapper;

	@Transactional
	public Integer insertStudentMatch(Integer studentId, StudentMatchForm studentMatchForm) throws DataAccessException {
		studentMapper.insertStudentMatch(studentMatchForm);
		int studentMatchId = studentMatchForm.getId();

		// 수업 가능한 지역 insert
		for (int dongId : studentMatchForm.getDongIdArr()) {
			studentMapper.insertStudentRegion(studentMatchId, dongId);
		}

		// 수업 시간 insert
		studentMapper.insertStudentTime(studentMatchId, studentMatchForm.getTime());
				
		// 성향 insert
		studentMapper.insertStudentCharacter(studentMatchId, studentMatchForm.getCh1());
		studentMapper.insertStudentCharacter(studentMatchId, studentMatchForm.getCh2());
		studentMapper.insertStudentCharacter(studentMatchId, studentMatchForm.getCh3());
		studentMapper.insertStudentCharacter(studentMatchId, studentMatchForm.getCh4());
		studentMapper.insertStudentCharacter(studentMatchId, studentMatchForm.getCh5());

		// 과목 시험 결과 insert
		for (StudentTest st : studentMatchForm.getSubjectTest()) {
			studentMapper.insertStudentTestResult(studentMatchId, st.getStudentTestPaper().getId(),
					st.getStudentAnswer());
		}

		System.out.println("매칭 정보 아이디 : " + studentMatchId);
		connectionMapper.insertConnection(studentId, studentMatchForm.getTeacherId(), studentMatchForm.getSubjectId(), studentMatchId);

		return studentMatchId;
	}

	public Integer insertStudentRegion(int id, int dongId) {
		return studentMapper.insertStudentRegion(id, dongId);
	}

	public Integer insertStudentCharacter(int id, int characterId) {
		return studentMapper.insertStudentCharacter(id, characterId);
	}

	public Integer insertStudentTestResult(int id, int testId, String answer) {
		return studentMapper.insertStudentTestResult(id, testId, answer);
	}

	public LoginForm selectStudent(String email) {
		return studentMapper.selectStudent(email);
	}

	public int selectCountStudentEmail(String email) {
		return studentMapper.selectCountStudentEmail(email);
	}

	public List<SchoolForm> selectSchool(String school) {
		return studentMapper.selectSchoolListBySchoolName(school);
	}

	public String selectEmailByNameAndPhone(FindIDForm findIDForm) {
		return studentMapper.selectEmailByNameAndPhone(findIDForm);
	}

	public UserSession selectStudentUserInfo(String email) {
		return studentMapper.selectStudentUserInfo(email);
	}
	
	public Integer selectStudentByEmailAndName(FindPWForm findPWForm) {
		return studentMapper.selectStudentByEmailAndName(findPWForm);
	}
	
	public void updateStudentPW(ResetPWForm resetPWForm) {
		studentMapper.updateStudentPW(resetPWForm);
	}
	
	public void insertStudent(StudentForm student) {
		studentMapper.insertStudent(student);
	}
	
	public void insertStudentInfo(StudentForm student) {
		studentMapper.insertStudentInfo(student);
	}
	
	public String selectSchoolType(int id) {
		return studentMapper.selectSchoolType(id);
	}
	
	public Integer selectStudentId(String email) {
		return studentMapper.selectStudentId(email);
	}
}