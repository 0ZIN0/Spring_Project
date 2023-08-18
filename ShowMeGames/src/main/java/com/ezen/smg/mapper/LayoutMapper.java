package com.ezen.smg.mapper;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.layout.LayoutDefaultDTO;
import com.ezen.smg.dto.layout.LayoutHGTDTO;
import com.ezen.smg.dto.layout.LayoutKCWDTO;

public interface LayoutMapper {

	int insertLayoutHGT(@Param("dto") LayoutHGTDTO dto);
	int updateLayoutHGT(@Param("dto") LayoutHGTDTO dto);
	LayoutHGTDTO getLayoutHGT(@Param("id") int game_id);
	
	int insertLayoutDefault(@Param("dto") LayoutDefaultDTO dto);
	int updateLayoutDefault(@Param("dto") LayoutDefaultDTO dto);
	LayoutDefaultDTO getLayoutDefault(@Param("id") int game_id);
	
	int updateImg_url(@Param("id") Integer game_id, @Param("url") String newFileName);
	int updateImg_url_hgt(@Param("id") Integer game_id, @Param("url") String newFileName, @Param("img_num") int img_num);
	
	int getLayoutCheck_default(@Param("id") Integer game_id);
	int getLayoutCheck_hgt(@Param("id") Integer game_id);
	
	LayoutKCWDTO getLayoutKCW(@Param("id") Integer game_id);

}
