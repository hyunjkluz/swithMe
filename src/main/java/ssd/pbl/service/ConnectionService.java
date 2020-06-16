package ssd.pbl.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.model.ConnectionCard;
import ssd.pbl.repository.mapper.ConnectionMapperRepository;


@Service
public class ConnectionService {
	@Autowired
	private ConnectionMapperRepository connectionMapperRepository;

	public List<ConnectionCard> getConnectionlist(int sid) {
		return  connectionMapperRepository.selectConnectionList(sid);
	}

}
