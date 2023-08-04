package com.ezen.smg.service.categoryService;

import java.util.List;

import com.ezen.smg.dto.Games;

public interface CategoryService {

	List<Games> getBestsellers(String genres, String editor, Integer sortBy);

	List<Games> getFreeGames(String genres, String editor, Integer sortBy);

	List<Games> getDiscountGames(String genres, String editor, Integer sortBy);

	List<Games> getLastestGames(String genres, String editor, Integer sortBy);
	
	List<Games> getEditorRecmdGames(String editor, String genres, Integer sortBy);
}
