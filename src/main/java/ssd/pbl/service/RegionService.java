/**
 * 
 */
package ssd.pbl.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.model.Dong;
import ssd.pbl.model.Gu;
import ssd.pbl.model.Sido;
import ssd.pbl.repository.mapper.RegionMapper;

/**
 * @author kimhyunjin
 * @date: Jun 5, 2020 1:07:55 AM
 */
@Service
public class RegionService {
	@Autowired
	private RegionMapper regionMapper;

	public List<Sido> getAllSido() {
		return regionMapper.selectAllSido();
	}

	public List<Gu> getGuBySidoId(int sidoId) {
		return regionMapper.selectGuBySidoId(sidoId);
	}

	public List<Dong> getDongByGuId(int guId) {
		return regionMapper.selectDongByGuId(guId);
	}

	public ArrayList<Integer> changDongStrToIntArray(String dongIds) {
		String[] strDongIds = dongIds.split(",");
		ArrayList<Integer> intDongIds = new ArrayList<Integer>();

		for (String strDongId : strDongIds) {
			intDongIds.add(Integer.parseInt(strDongId));
		}

		return intDongIds;
	}
}
