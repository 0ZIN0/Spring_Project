package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.GameKeyDTO;
import com.ezen.smg.dto.MyGameListDTO;

public interface GameKeyMapper {
	
	int updateUserNum(@Param("user_num") int user_num, @Param("game_id") int game_id);
	
	List<MyGameListDTO> getUserGameKeyList(@Param("user_num") Integer user_num);
	
	List<GameKeyDTO> getAllKeys();
}
