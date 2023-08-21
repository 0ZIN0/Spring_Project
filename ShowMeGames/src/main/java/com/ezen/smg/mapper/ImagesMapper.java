package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.Images;

public interface ImagesMapper {
	
	List<Images> getImages(@Param("game_id") int game_id, @Param("start")int start, @Param("end")int end);
	
	Images getSubBanner(@Param("game_id") int game_id);

	Images getSpecificImg(@Param("game_id") Integer game_id, @Param("img_num") int img_num);

	int insertImage(@Param("dto") Images img);
}
