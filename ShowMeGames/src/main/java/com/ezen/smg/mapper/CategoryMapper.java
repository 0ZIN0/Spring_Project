package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.Games;

public interface CategoryMapper {
	
	List<Games> getBestsellers(
			@Param("editor") List<String> editor, 
			@Param("genre") String genre);
	
	List<Games> getFreeGames(
			@Param("editor") List<String> editor, 
			@Param("genre") String genre, 
			@Param("sortBy") String sortBy);
	
	List<Games> getDiscountGames(
			@Param("editor") List<String> editor, 
			@Param("genre") String genre, 
			@Param("sortBy") String sortBy);
	
	List<Games> getLastestGames(
			@Param("editor") List<String> editor, 
			@Param("genre") String genre, 
			@Param("sortBy") String sortBy);
	
	List<Games> getEditorRecmdGames(
			@Param("editor") String editor, 
			@Param("genre") String genre, 
			@Param("sortBy") String sortBy);
}
