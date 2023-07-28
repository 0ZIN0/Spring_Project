package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.Games;

public interface IndexMapper {

	List<Games> getLatestGameList();
	List<Games> getEditorRecmdList(@Param("editor") String editor);
	List<Games> getLargestDiscountList();
	List<String> getEditors();
	
}
