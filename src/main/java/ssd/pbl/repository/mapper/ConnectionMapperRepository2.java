package ssd.pbl.repository.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssd.pbl.model.ConnectionCard;

@Repository
public class ConnectionMapperRepository2 {
	@Autowired
	private ConnectionMapper2 connectionMaper2;

	public List<ConnectionCard> selectConnectionList(int sid) {
		return connectionMaper2.selectConnectionList(sid);
	}
}
