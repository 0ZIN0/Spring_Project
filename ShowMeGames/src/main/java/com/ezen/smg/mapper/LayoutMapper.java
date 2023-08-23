package com.ezen.smg.mapper;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.layout.LayoutBGCDTO;
import com.ezen.smg.dto.layout.LayoutDefaultDTO;
import com.ezen.smg.dto.layout.LayoutHGTDTO;
import com.ezen.smg.dto.layout.LayoutJYMDTO;
import com.ezen.smg.dto.layout.LayoutKCWDTO;
import com.ezen.smg.dto.layout.LayoutLRADTO;
import com.ezen.smg.dto.layout.LayoutSJHDTO;

public interface LayoutMapper {

	int insertLayoutHGT(@Param("dto") LayoutHGTDTO dto);
	int updateLayoutHGT(@Param("dto") LayoutHGTDTO dto);
	LayoutHGTDTO getLayoutHGT(@Param("id") int game_id);
	
	int insertLayoutLRA(@Param("dto") LayoutLRADTO dto);
	int updateLayoutLRA(@Param("dto") LayoutLRADTO dto);
	LayoutLRADTO getLayoutLRA(@Param("id") int game_id);
	
	int insertLayoutJYM(@Param("dto") LayoutJYMDTO dto);
	int updateLayoutJYM(@Param("dto") LayoutJYMDTO dto);
	LayoutJYMDTO getLayoutJYM(@Param("id") int game_id);
	
	int insertLayoutSJH(@Param("dto") LayoutSJHDTO dto);
	int updateLayoutSJH(@Param("dto") LayoutSJHDTO dto);
	LayoutSJHDTO getLayoutSJH(@Param("id") int game_id);
	
	int insertLayoutDefault(@Param("dto") LayoutDefaultDTO dto);
	int updateLayoutDefault(@Param("dto") LayoutDefaultDTO dto);
	LayoutDefaultDTO getLayoutDefault(@Param("id") int game_id);
	
	int updateImg_url(@Param("id") Integer game_id, @Param("url") String newFileName);
	int updateImg_url_hgt(@Param("id") Integer game_id, @Param("url") String newFileName, @Param("img_num") int img_num);
	int updateImg_url_lra(@Param("id") Integer game_id, @Param("url") String newFileName, @Param("img_num") int img_num);
	int updateImg_url_bgc(@Param("id") Integer game_id, @Param("url") String newFileName, @Param("img_num") int img_num);
	
	int getLayoutCheck_default(@Param("id") Integer game_id);
	int getLayoutCheck_hgt(@Param("id") Integer game_id);
	
	LayoutKCWDTO getLayoutKCW(@Param("id") int game_id);
	int getLayoutCheck_kcw(@Param("id") Integer game_id);
	int getLayoutCheck_lra(@Param("id") Integer game_id);
	int getLayoutCheck_jym(@Param("id") Integer game_id);
	int getLayoutCheck_sjh(@Param("id") Integer game_id);
	
	int getLayoutCheck_bgc(@Param("id") Integer game_id);
	int insertLayoutBGC(@Param("dto") LayoutBGCDTO dto);
	int updateLayoutBGC(@Param("dto") LayoutBGCDTO dto);
	LayoutBGCDTO getLayoutBGC(@Param("id") int game_id);
	
}
