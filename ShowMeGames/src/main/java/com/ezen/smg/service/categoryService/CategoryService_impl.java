package com.ezen.smg.service.categoryService;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.common.CommonFunction;
import com.ezen.smg.dto.Games;
import com.ezen.smg.mapper.CategoryMapper;

@Service
public class CategoryService_impl implements CategoryService{
	
	@Autowired
	CategoryMapper mapper;
	
	@Override
	public List<Games> getBestsellers(String genre, String editor, Integer sortBy) {

		List<Games> result = new ArrayList<Games>();
		String sortByString = sortByToString(sortBy);

		if(genre != null|| editor != null || sortBy != null) {
			List<String> editors = new ArrayList<String>();
			if(editor != null && !editor.isEmpty()) {   // editor null check
				editors = Arrays.asList(editor.split(","));
			}
			result = mapper.getBestsellers(
					editors, genre, sortByString);

			for(Games game : result) {
				game.setDiscounted_price(
						CommonFunction.calDiscount(
								game.getGame_price(), 
								game.getDiscount()
								));
			}
		}
		return result;
	}

	@Override
	public List<Games> getFreeGames(String genre, String editor, Integer sortBy) {

		List<Games> result = new ArrayList<Games>();
		String sortByString = sortByToString(sortBy);

		List<String> editors = new ArrayList<String>();
		if(editor != null && !editor.isEmpty()) {   // editor null check
			System.out.println("통과");
			editors = Arrays.asList(editor.split(","));
		}
		result = mapper.getFreeGames(
				editors, genre, sortByString);

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
	public List<Games> getDiscountGames(String genre, String editor, Integer sortBy) {

		List<Games> result = new ArrayList<Games>();
		List<String> editors = new ArrayList<String>();
		String sortByString;
		
		if(editor != null && !editor.isEmpty()) {   // editor null check
			editors = Arrays.asList(editor.split(","));
		}
		
		
		if(sortBy != null) {
			sortByString = sortByToString(sortBy);			
		} else {
			sortByString = "discount DESC";
		}
		
		result = mapper.getDiscountGames(
				editors, genre, sortByString);

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
	public List<Games> getLastestGames(String genre, String editor, Integer sortBy) {

		List<Games> result = new ArrayList<Games>();
		String sortByString = sortByToString(sortBy);
		
		List<String> editors = new ArrayList<String>();
		if(editor != null && !editor.isEmpty()) {   // editor null check
			System.out.println("통과");
			editors = Arrays.asList(editor.split(","));
		}
		
		result = mapper.getLastestGames(
				editors, genre, sortByString);

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
	public List<Games> getEditorRecmdGames(String editor, String genres, Integer sortBy) {
		
		List<Games> result = new ArrayList<Games>();
		
		String sortByString = sortByToString(sortBy);
		
		result = mapper.getEditorRecmdGames(
				editor, genres, sortByString);
		
		for(Games game : result) {
			game.setDiscounted_price(
					CommonFunction.calDiscount(
							game.getGame_price(), 
							game.getDiscount()
							));
		}
		return result;
	}

	String sortByToString(Integer sortBy) {
	
		try {
			if(sortBy == 1) {
				return "bestSeller DESC";
			} else if(sortBy == 3) {
				return "game_name ASC";
			} else {
				return "release_date DESC";
			}			
		} catch(NullPointerException e) {
			return "release_date DESC";
		}
	}

}

