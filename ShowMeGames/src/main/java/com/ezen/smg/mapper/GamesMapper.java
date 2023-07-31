package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.Games;

public interface GamesMapper {
	
	List<Games> getAllGames(String sortBy);
	
	Games getGame(int game_id);
	
	List<Games> getFilteredGames(
			@Param("genre") String genres,
			@Param("editor") List<String> editors, 
			@Param("sortBy") String sortBy);
	
	List<Games> getFilteredGenreOnly(
			@Param("genre") String genres, 
			@Param("sortBy") String sortBy);
	
	List<Games> getFilteredEditorOnly(List<String> editors, String sortBy);

	List<Games> getLatestGameList();
	
	List<Games> getEditorRecmdList(@Param("editor") String editor);
	
	List<Games> getLargestDiscountList();
	
	List<String> getEditors();
}
