package com.ezen.smg.service.gamesService;

import java.util.List;

import com.ezen.smg.dto.Games;

public interface GamesService {
	
	List<Games> getAllGames(Integer sortBy);
	
	List<Games> getFilteredGames(String genres, String editor, Integer sortBy);
	
	List<Games> getSearchGames(String search, String genres, String editor, Integer sortBy);
}
