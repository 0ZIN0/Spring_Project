package com.ezen.smg.mapper;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.MyGameListDTO;

public interface GameKeyMapper {
	
	int updateUserNum(@Param("user_num") int user_num, @Param("game_id") int game_id);
	
	MyGameListDTO getUserGameKeyList(@Param("user_num") Integer user_num);
}
