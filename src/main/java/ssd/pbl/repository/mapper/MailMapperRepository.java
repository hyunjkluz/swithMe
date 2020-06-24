/**
 * 
 */
package ssd.pbl.repository.mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @author kimhyunjin
 * @date: Jun 23, 2020 9:47:44 PM
 */
@Repository
public class MailMapperRepository {
	@Autowired
	private MailMapper mailMapper;

	public Integer deleteAllData() {
		return mailMapper.deleteAllData();
	}

}
