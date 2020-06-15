/**
 * 
 */
package ssd.pbl.repository.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @author kimhyunjin
 * @date: Jun 9, 2020 4:30:49 PM
 */
@Repository
public class CharacterMapperRepo {
	@Autowired
	private CharacterMapper characterMapper;
	
	public List<Character> selectAllCharacters() {
		return characterMapper.selectAllCharacters();
	}
	
	public List<Character> selectTwoCharactersById(int id1, int id2) {
		return characterMapper.selectTwoCharactersById(id1, id2);
	}

}
