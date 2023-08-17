package com.ezen.smg.mapper;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.layout.LayoutDefaultDTO;

public interface LayoutMapper {

	int insertLayoutDefault(@Param("dto") LayoutDefaultDTO dto);
	int updateLayoutDefault(@Param("dto") LayoutDefaultDTO dto);
	LayoutDefaultDTO getLayoutDefault(@Param("id") int game_id);
	int updateImg_url(@Param("id") Integer game_id, @Param("url") String newFileName);
	int getLayoutCheck_default(@Param("id") Integer game_id);
}
