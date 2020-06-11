/**
 * 
 */
package ssd.pbl.repository.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssd.pbl.model.ClassCard;

/**
 * @author kimhyunjin
 * @date: Jun 12, 2020 12:46:31 AM
 */
@Repository
public class ClassMapperRepository {
	@Autowired
	private ClassMapper classMapper;

	public List<ClassCard> selectAutoMatchClass() {
		return classMapper.selectAutoMatchClass();
	}

}
