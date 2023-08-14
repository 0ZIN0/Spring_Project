package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.Games;

public interface GamesMapper {
	
	List<Games> getAllGames(String sortBy);
	
	List<Games> getNewSortGames(@Param("start") int start, @Param("end") int end);
	
	List<Games> getAllGamesSortByName();
	
	Games getGame(int game_id);
	
	List<Games> getFilteredGames(
			@Param("genre") String genres,
			@Param("editor") List<String> editors, 
			@Param("sortBy") String sortBy);
	
	List<Games> getLatestGameList();
	
	List<Games> getEditorRecmdList(@Param("editor") String editor);
	
	List<Games> getLargestDiscountList();
	
	List<String> getEditors();
	
	List<Games> getSearchGames(
			@Param("game_name") String search,
			@Param("genre") String genres,
			@Param("editor") List<String> editors, 
			@Param("sortBy") String sortBy);
	
	List<Games> getGenreSameGames(@Param("game_genre") String game_genre);
	
	List<Games> getBestSellers();
	
	List<Games> getWeeklyBestSellers();
	
	int getGamesTotalSize();
	
	List<Games> getGameListForAdmin(@Param("start") int firstGame, @Param("end") int lastGame);
	
	int updateGame(@Param("game") Games game);
	
	int updateBanner_img(@Param("game_id") int game_id, @Param("path") String DBSavePath);
	
	String getBanner_imgUrl(@Param("game_id") int game_id);
	
}
