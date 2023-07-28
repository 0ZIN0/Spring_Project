package com.ezen.smg.mapper;

import java.util.List;

import com.ezen.smg.dto.Games;

public interface GamesMapper {
	
	List<Games> getAllGames();
	
	Games getGame(int game_id);
	
	List<Games> getFilteredGames(List<String> filters);
}
