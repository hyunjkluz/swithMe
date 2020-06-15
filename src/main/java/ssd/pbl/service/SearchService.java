package ssd.pbl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.model.SchoolForm;
import ssd.pbl.repository.mapper.StudentMapperRepository;

@Service
public class SearchService {

	@Autowired
	private StudentMapperRepository studentMapperRepository;
	
	
	public List<SchoolForm> searchSchool(String school) {
		return studentMapperRepository.selectSchool(school);
	}
}
