package com.ezen.smg.service.gamesService;

import java.util.ArrayList;
import java.util.Arrays;
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

	public List<Games> getFilteredGames(String genres, String editor, Integer sortBy) {
		
		if(genres != null|| editor != null || sortBy != null) {
			
			List<String> editors = Arrays.asList(editor.split(","));
			String sortByString = sortByToString(sortBy);
			List<Games> result = gamesMapper.
					getFilteredGames(genres, editors, sortByString);
			for(Games game : result) {
				game.setDiscounted_price(
						CommonFunction.calDiscount(
								game.getGame_price(), 
								game.getDiscount()
								));
			}
			return result;			
		} else {
			List<Games> result = gamesMapper.getAllGames("release_date");
			for(Games game : result) {
				game.setDiscounted_price(
						CommonFunction.calDiscount(
								game.getGame_price(), 
								game.getDiscount()
								));
			}
			return result;
		}
	}
	
	@Override
	public List<Games> getSearchGames(String search, String genres, String editor, Integer sortBy) {
		
		if(search != null || genres != null || editor != null || sortBy != null) {
	        List<String> editors = new ArrayList<String>();
	        if(editor != null && !editor.isEmpty()) {   // editor null check
	            editors = Arrays.asList(editor.split(","));
	        }
	        String sortByString = "release_date DESC";
	        if(sortBy != null) {   // sortBy null check
	            sortByString = sortByToString(sortBy);
	        }
	        System.out.println(editors.size());
			List<Games> result = gamesMapper.
					getSearchGames(search, genres, editors, sortByString);
			for(Games game : result) {
				game.setDiscounted_price(
						CommonFunction.calDiscount(
								game.getGame_price(), 
								game.getDiscount()
								));
			}
			return result;			
		} else {
			List<Games> result = gamesMapper.getAllGames("release_date");
			for(Games game : result) {
				game.setDiscounted_price(
						CommonFunction.calDiscount(
								game.getGame_price(), 
								game.getDiscount()
								));
			}
			return result;
		}
	}

	String sortByToString(Integer sortBy) {
		
		if(sortBy == 1) {
			return "bestSeller DESC";
		} else if(sortBy == 3) {
			return "game_name ASC";
		} else {
			return "release_date DESC";
		}
	}
}
