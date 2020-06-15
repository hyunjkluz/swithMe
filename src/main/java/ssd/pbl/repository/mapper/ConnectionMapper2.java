package ssd.pbl.repository.mapper;

import java.util.List;

import ssd.pbl.model.ConnectionCard;

public interface ConnectionMapper2 {
	List<ConnectionCard> selectConnectionList(int sid);
}
