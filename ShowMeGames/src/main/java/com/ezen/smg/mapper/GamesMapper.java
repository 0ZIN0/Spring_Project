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
	
	int getGamesByIdSize(@Param("game_id") int game_id);
	
	int getGamesByName(@Param("game_name") String game_name);
	
	int getGamesByLayout(String layout);
	
	List<Games> getGameListForAdmin(@Param("start") int firstGame, @Param("end") int lastGame);

	List<Games> getGameListByGame_id(@Param("start") int firstGame, @Param("end") int lastGame, @Param("game_id") String game_id);
	
	List<Games> getGameListByName(@Param("start") int firstGame, @Param("end") int lastGame, @Param("game_name") String game_name);
	
	List<Games> getGameListByLayout(@Param("start") int firstGame, @Param("end") int lastGame, @Param("layout") String layout);
	
	int getLastGameNum();
	
	int updateGame(@Param("game") Games game);
	
	int updateBanner_img(@Param("game_id") int game_id, @Param("path") String DBSavePath);
	
	String getBanner_imgUrl(@Param("game_id") int game_id);

	int insertNewGame(@Param("game") Games game);
	
	List<Games> getCuratorGames();

	int deleteGame(@Param("game_id") int game_id);

	int getGamesLayoutIsNull();

	List<Games> getGamesListByLayoutAndNull(@Param("start") int firstGame, @Param("end") int lastGame, @Param("layout") String layout);
	
}
