package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.Games;

public interface GamesMapper {
	
	List<Games> getAllGames();
	
	Games getGame(int game_id);
	
	List<Games> getFilteredGames(@Param("genre") List<String> genres, @Param("editor") List<String> editors);
	
	List<Games> getFilteredGenreOnly(List<String> genres);
	
	List<Games> getFilteredEditorOnly(List<String> editors);
}
