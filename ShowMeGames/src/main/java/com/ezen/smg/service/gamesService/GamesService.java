package com.ezen.smg.service.gamesService;

import java.util.List;

import com.ezen.smg.dto.Games;

public interface GamesService {
	
	List<Games> getAllGames(Integer sortBy);
	
	List<Games> getFilteredGames(String genres, List<String> editors, Integer sortBy);
	
	List<Games> getFilteredGenreOnly(String genres, Integer sortBy);
	
	List<Games> getFilteredEditorOnly(List<String> editors, Integer sortBy);
}
