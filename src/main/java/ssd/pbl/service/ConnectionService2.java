package ssd.pbl.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.model.ConnectionCard;
import ssd.pbl.repository.mapper.ConnectionMapperRepository2;


@Service
public class ConnectionService2 {
	@Autowired
	private ConnectionMapperRepository2 connectionMapperRepository2;

	public List<ConnectionCard> getConnectionlist(int sid) {
		return  connectionMapperRepository2.selectConnectionList(sid);
	}

}
