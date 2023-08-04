package com.ezen.smg.service.gamesService;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.common.CommonFunction;
import com.ezen.smg.dto.Games;
import com.ezen.smg.mapper.GamesMapper;

import lombok.extern.log4j.Log4j;

@Log4j
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
			List<String> editors = new ArrayList<String>();
			if(editor != null && !editor.isEmpty()) {   // editor null check
	            editors = Arrays.asList(editor.split(","));
	        }
	        String sortByString = "release_date DESC";
	        if(sortBy != null) {   // sortBy null check
	            sortByString = sortByToString(sortBy);
	        }
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
			List<Games> result = gamesMapper.getAllGames("release_date DESC");
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
			List<Games> result = gamesMapper.getAllGames("release_date DESC");
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

	@Override
	public List<Games> getLatestGameList() {
		List<Games> result = gamesMapper.getLatestGameList();
		for(Games game : result) {
			game.setDiscounted_price(
					CommonFunction.calDiscount(
							game.getGame_price(), 
							game.getDiscount()
							));
		}
		return result;
	}

	@Override
	public List<Games> getCuratorRecmdList() {
		List<Games> result = gamesMapper.getEditorRecmdList("curator");
		
		for(Games game : result) {
			game.setDiscounted_price(CommonFunction.calDiscount(game.getGame_price(), game.getDiscount()));
		}
		
		Collections.shuffle(result);
		
		return result.subList(0, 5);
	}
	
	public List<Games> getNewSortGames(int countNum) {
		List<Games> games1 = gamesMapper.getNewSortGames(1, 10);
		List<Games> games2 = new ArrayList<>();
		
		Collections.shuffle(games1);

		for (int i = 0; i < countNum; ++i) {
			games1.get(i).setDiscounted_price(CommonFunction.calDiscount(games1.get(i).getGame_price(), games1.get(i).getDiscount()));
			games2.add(games1.get(i));
		}
		return games2;
	}

	@Override
	public List<Games> getGenreSameGames(List<Games> games, int countNum) {
		List<Games> games2 = new ArrayList<>();
		List<String[]> genres = new ArrayList<>();
		
		for (Games game : games) {
			genres.add(game.getGame_genre().split(" "));
		}
		Collections.shuffle(genres);
		
		int ranNum = (int)(Math.random() * genres.get(0).length);
		
		List<Games> games3 = gamesMapper.getGenreSameGames("%" + genres.get(0)[ranNum] + "%");
		
		log.error("뽑힌 장르: " + genres.get(0)[ranNum]);
		
		Collections.shuffle(games3);
		
		
		if (games3.size() < countNum) {
			for (int i = 0; i < games3.size(); ++i) {
				games3.get(i).setDiscounted_price(CommonFunction.calDiscount(games3.get(i).getGame_price(), games3.get(i).getDiscount()));
				games2.add(games3.get(i));
			}
		} else {
			for (int i = 0; i < countNum; ++i) {
				games3.get(i).setDiscounted_price(CommonFunction.calDiscount(games3.get(i).getGame_price(), games3.get(i).getDiscount()));
				games2.add(games3.get(i));
			}
		}
		
		return games2;
	}
}
