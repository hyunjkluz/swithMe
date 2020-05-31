/**
 * 
 */
package ssd.pbl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.model.Subject;
import ssd.pbl.repository.mapper.SubjectMapper;

/**
 * @author kimhyunjin
 * @date: May 31, 2020 10:55:41 PM
 */
@Service
public class SubjectService {
	@Autowired
	private SubjectMapper subjectMapper;
	
	public List<Subject> getAllAubject() {
		return subjectMapper.selectAllSubject();
	}
	
	public Integer postSubject(String name, String category) {
		return subjectMapper.insertSubject(name, category);
	}
	

}
