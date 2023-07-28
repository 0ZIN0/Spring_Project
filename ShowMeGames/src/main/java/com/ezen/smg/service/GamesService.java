package com.ezen.smg.service;

import java.util.List;

import com.ezen.smg.dto.Games;

public interface GamesService {
	
	List<Games> getAllGames();
	
	List<Games> getFilteredGames(List<String> filters);
}
