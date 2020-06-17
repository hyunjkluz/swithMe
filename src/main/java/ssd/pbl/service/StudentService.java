/**
 * 
 */
package ssd.pbl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.model.StudentMatchForm;
import ssd.pbl.model.StudentTest;
import ssd.pbl.repository.mapper.StudentMapperRepository;

/**
 * @author kimhyunjin
 * @date: Jun 11, 2020 11:01:40 PM
 */
@Service
public class StudentService {
	@Autowired
	private StudentMapperRepository studentMapperRepository;
	
	public int postAutoMatching(int studentId, StudentMatchForm studentMatchForm) {
		int testResult = 0;
		for (StudentTest st : studentMatchForm.getSubjectTest()) {
			testResult += st.gradeTest();
		}
		studentMatchForm.setTestResult(testResult);
		
		int studentMatchId = studentMapperRepository.insertStudentMatch(studentId, studentMatchForm);
		
		return studentMatchId;
	}

}
