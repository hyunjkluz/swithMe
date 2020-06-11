/**
 * 
 */
package ssd.pbl.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssd.pbl.controller.AutoMatchController;
import ssd.pbl.repository.mapper.CharacterMapperRepo;

/**
 * @author kimhyunjin
 * @date: Jun 9, 2020 3:54:07 PM
 */
@Service
public class CharacterService {
	private static final Logger LOGGER = LoggerFactory.getLogger(CharacterService.class);
	@Autowired
	private CharacterMapperRepo characterMapperRepo;

	public List<Character> getAllCharacters() {
		return characterMapperRepo.selectAllCharacters();
	}

	public List<Character> getTwoCharacterById(int id1, int id2) {
		List<Character> list = characterMapperRepo.selectTwoCharactersById(id1, id2);
		LOGGER.info("캐릭터 배열 --- " + list.toString());
		return characterMapperRepo.selectTwoCharactersById(id1, id2);
	}

}
