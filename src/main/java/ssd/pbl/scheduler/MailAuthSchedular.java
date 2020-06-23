/**
 * 
 */
package ssd.pbl.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import ssd.pbl.repository.mapper.MailMapperRepository;

/**
 * @author kimhyunjin
 * @date: Jun 23, 2020 8:09:43 PM
 */
@Component
public class MailAuthSchedular {
	@Autowired
	private MailMapperRepository mailMapperRepo;
	
	@Scheduled(cron="0 0 4 * * ?")
	public void deleteMailAuth() {
		System.out.println("스케줄러 시작");
		mailMapperRepo.deleteAllData();
		System.out.println("스케줄러 성공");
	}

}
