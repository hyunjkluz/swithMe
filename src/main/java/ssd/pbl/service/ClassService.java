/**
 * 
 */
package ssd.pbl.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.model.ClassCard;
import ssd.pbl.repository.mapper.ClassMapperRepository;

/**
 * @author kimhyunjin
 * @date: Jun 12, 2020 12:47:41 AM
 */
@Service
public class ClassService {
	private static final Logger LOGGER = LoggerFactory.getLogger(ClassService.class);

	@Autowired
	private ClassMapperRepository classMapperRepo;

	public List<ClassCard> getAutoMatchClasses() {
		List<ClassCard> list = classMapperRepo.selectAutoMatchClass();
		LOGGER.info(list.get(0).toString());
		return list;

//		return classMapperRepo.selectAutoMatchClass();
	}

}
