package com.ezen.smg.mapper;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.GameSpecificationsDTO;

public interface GameSpecificationsMapper {

	GameSpecificationsDTO getSpec(@Param("id") Integer game_id);

}
