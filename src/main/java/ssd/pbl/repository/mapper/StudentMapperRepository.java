/**
 * 
 */
package ssd.pbl.repository.mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ssd.pbl.model.StudentMatchForm;
import ssd.pbl.model.StudentTest;

/**
 * @author kimhyunjin
 * @date: Jun 11, 2020 1:40:49 PM
 */
@Repository
public class StudentMapperRepository {
	@Autowired
	private StudentMapper studentMapper;

	@Transactional
	public Integer insertStudentMatch(StudentMatchForm studentMatchForm) throws DataAccessException {
		studentMapper.insertStudentMatch(studentMatchForm);
		int studentMatchId = studentMatchForm.getId();

		// 수업 가능한 지역 insert
		for (int dongId : studentMatchForm.getDongIdArr()) {
			studentMapper.insertStudentRegion(studentMatchId, dongId);
		}

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

}
