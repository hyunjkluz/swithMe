package ssd.pbl.repository.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssd.pbl.model.ConnectionCard;

@Repository
public class ConnectionMapperRepository {
	@Autowired
	private ConnectionMapper connectionMaper;

	public List<ConnectionCard> selectConnectionList(int sid) {
		return connectionMaper.selectConnectionList(sid);
	}
}
