package com.ezen.smg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.common.CommonFunction;
import com.ezen.smg.dto.Games;
import com.ezen.smg.mapper.GamesMapper;

@Service
public class GamesService_impl implements GamesService{
	
	@Autowired
	GamesMapper gamesMapper;
	
	@Override
	public List<Games> getAllGames(Integer sortBy) {
		
		String sortByString = sortByToString(sortBy);
		List<Games> result = gamesMapper.getAllGames(sortByString);
		for(Games game : result) {
			game.setDiscounted_price(CommonFunction.calDiscount(game.getGame_price(), game.getDiscount()));
		}
		return result;
	}

	@Override
	public List<Games> getFilteredGames(String genres, List<String> editors, Integer sortBy) {
		
		String sortByString = sortByToString(sortBy);
		
		return gamesMapper.getFilteredGames(genres, editors, sortByString);
	}

	@Override
	public List<Games> getFilteredGenreOnly(String genres, Integer sortBy) {
		
		String sortByString = sortByToString(sortBy);
		
		return gamesMapper.getFilteredGenreOnly(genres, sortByString);
	}

	@Override
	public List<Games> getFilteredEditorOnly(List<String> editors, Integer sortBy) {
		
		String sortByString = sortByToString(sortBy);
		
		return gamesMapper.getFilteredEditorOnly(editors, sortByString);
	}
	
	String sortByToString(Integer sortBy) {
		
		if(sortBy == 1) {
			return "bestSeller";
		} else if(sortBy == 3) {
			return "game_name";
		} else {
			return "release_date";
		}
	}
}
