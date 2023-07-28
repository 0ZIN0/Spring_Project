package com.ezen.smg.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.smg.dto.Games;
import com.ezen.smg.service.GamesService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class GamesController {
	
	@Autowired
	GamesService gamesService;
	
	@GetMapping("/games-filter")
	public List<Games> gameListFilter(
			@RequestParam(name = "genre") String genre,
			@RequestParam(name = "editor") String editor
			) throws Exception {
		log.info("필터지나감");
		List<String> genres = Arrays.asList(genre.split("/"));
		List<String> editors = Arrays.asList(editor.split("/"));
		log.info(genres.toString());
		log.info(editor);
		List<Games> gameList = new ArrayList<Games>();
		
		if(!genres.get(0).equals("")
				&& !editors.get(0).equals("")) {
			gameList = gamesService.getFilteredGames(genres, editors);
		} else if(!genres.get(0).equals("")) {
			gameList = gamesService.getFilteredGenreOnly(genres);
		} else if(!editors.get(0).equals("")) {
			gameList = gamesService.getFilteredEditorOnly(editors);
		} else {
			gameList = gamesService.getAllGames();
		}
		
		return gameList;
	}
}
