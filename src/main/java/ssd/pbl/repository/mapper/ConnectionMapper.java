/**
 * 
 */
package ssd.pbl.repository.mapper;

import java.util.List;

import ssd.pbl.model.ConnectionCard;
import ssd.pbl.model.StudentMatchForm;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:34:55 AM
 */
public interface ConnectionMapper {
	Integer insertConnection(StudentMatchForm studentMatchForm);

	List<ConnectionCard> selectConnectionList(int sid);
}
