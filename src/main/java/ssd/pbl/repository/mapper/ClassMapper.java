/**
 * 
 */
package ssd.pbl.repository.mapper;

import java.util.List;

import ssd.pbl.model.ClassCard;

/**
 * @author kimhyunjin
 * @date: Jun 12, 2020 12:45:17 AM
 */
public interface ClassMapper {
	List<ClassCard> selectAutoMatchClass();
	
	List<ClassCard> selectAllClass();

}
