/**
 * 
 */
package ssd.pbl.repository.mapper;

import java.util.List;

import ssd.pbl.model.Dong;
import ssd.pbl.model.Gu;
import ssd.pbl.model.Sido;

/**
 * @author kimhyunjin
 * @date: May 29, 2020 11:57:01 AM
 */
public interface RegionMapper {
	List<Sido> selectAllSido();
	
	List<Gu> selectGuBySidoId(int sidoId);
	
	List<Dong> selectDongByGuId(int guId);

}
