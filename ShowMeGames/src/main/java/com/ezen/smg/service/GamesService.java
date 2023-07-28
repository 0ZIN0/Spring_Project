package com.ezen.smg.service;

import java.util.List;

import com.ezen.smg.dto.Games;

public interface GamesService {
	
	List<Games> getAllGames();
	
	List<Games> getFilteredGames(List<String> genres, List<String> editors);
	
	List<Games> getFilteredGenreOnly(List<String> genres);
	
	List<Games> getFilteredEditorOnly(List<String> editors);
}
