package com.ezen.smg.mapper;

import org.apache.ibatis.annotations.Param;

public interface GameKeyMapper {
	
	int updateUserNum(@Param("user_num") int user_num, @Param("game_id") int game_id);
}
