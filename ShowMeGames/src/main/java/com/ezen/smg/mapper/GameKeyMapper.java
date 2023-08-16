package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.GameKeyDTO;
import com.ezen.smg.dto.MyGameListDTO;

public interface GameKeyMapper {
	
	int updateUserNum(@Param("user_num") int user_num, @Param("game_id") int game_id);
	
	List<MyGameListDTO> getUserGameKeyList(@Param("user_num") Integer user_num);
	
	List<GameKeyDTO> getKeys(@Param("begin") int begin, @Param("end") int end);
	
	List<GameKeyDTO> getSearchResults(
			@Param("search")String search, 
			@Param("search_tag") String search_tag,
			@Param("begin") int begin,
			@Param("end") int end);
	
	int modifyKeyId(
			@Param("key_id") String key_id,
			@Param("key_num") int key_num);
	
	int modifyKeyAccount(
			@Param("nick_name") String nick_name,
			@Param("key_num") int key_num);
	
	int isUseGameKey(@Param("user_num") int user_num, @Param("game_id") int game_id);
}
