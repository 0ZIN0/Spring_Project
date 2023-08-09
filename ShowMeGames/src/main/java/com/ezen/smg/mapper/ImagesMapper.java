package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.Images;

public interface ImagesMapper {
	
	List<Images> getImages(@Param("game_id") int game_id);
}
