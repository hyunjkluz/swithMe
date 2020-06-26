/**
 * 
 */
package ssd.pbl.repository.mapper;

import ssd.pbl.model.FindPWForm;

/**
 * @author kimhyunjin
 * @date: Jun 23, 2020 9:47:17 PM
 */
public interface MailMapper {
	Integer deleteAllData();

	void insertSecurityCode(FindPWForm findPWForm);
	
	Integer selectSecurityCode(String email);
}
