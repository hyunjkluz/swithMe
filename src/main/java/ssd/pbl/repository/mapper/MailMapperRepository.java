/**
 * 
 */
package ssd.pbl.repository.mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssd.pbl.model.FindPWForm;

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
	
	public void insertSecurityCode(FindPWForm findPWForm) {
		mailMapper.insertSecurityCode(findPWForm);
	}
	
	public Integer selectSecurityCode(String email) {
		return mailMapper.selectSecurityCode(email);
	}

}
