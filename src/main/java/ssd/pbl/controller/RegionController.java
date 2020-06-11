/**
 * 
 */
package ssd.pbl.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ssd.pbl.model.Dong;
import ssd.pbl.model.Gu;
import ssd.pbl.service.RegionService;

/**
 * @author kimhyunjin
 * @date: Jun 11, 2020 11:16:27 AM
 */
@Controller
public class RegionController {
	private static final Logger LOGGER = LoggerFactory.getLogger(RegionController.class);

	@Autowired
	private RegionService regionService;

	@RequestMapping(value = "/sido/{sidoId}", method = RequestMethod.GET)
	@ResponseBody
	public List<Gu> getGuListBySidoId(@PathVariable int sidoId) {
		return regionService.getGuBySidoId(sidoId);
	}

	@RequestMapping(value = "/gu/{guId}", method = RequestMethod.GET)
	@ResponseBody
	public List<Dong> getDongListBySidoId(@PathVariable int guId) {
		LOGGER.info("동찾기");
		return regionService.getDongByGuId(guId);
	}
}
