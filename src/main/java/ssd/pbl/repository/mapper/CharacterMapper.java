/**
 * 
 */
package ssd.pbl.repository.mapper;

import java.util.List;

/**
 * @author kimhyunjin
 * @date: Jun 9, 2020 3:50:57 PM
 */
public interface CharacterMapper {
	List<Character> selectAllCharacters();
	
	List<Character> selectTwoCharactersById(int id1, int id2);

}
