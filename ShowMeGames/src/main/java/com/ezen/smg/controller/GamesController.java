package com.ezen.smg.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.smg.dto.Games;
import com.ezen.smg.service.gamesService.GamesService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class GamesController {
	
	@Autowired
	GamesService gamesService;
	
	@GetMapping("/games")
	public void gameList(Model model) {

		System.out.println("목록을 가져옵니다");
		model.addAttribute("games", gamesService.getAllGames(2));
	}
	
	@ResponseBody
	@GetMapping("/games-filter")
	public List<Games> gameListFilter(
			@RequestParam(name = "genre") String genres,
			@RequestParam(name = "editor") String editor,
			@RequestParam(name = "sortBy") Integer sortBy
			) throws Exception {
		
		log.info("필터지나감");

		List<String> editors = Arrays.asList(editor.split("/"));
		log.info(editor);
		log.info(genres);
		log.info(sortBy);

		List<Games> gameList = new ArrayList<Games>();
		log.info(!(genres.equals("")));
		if(!(genres.equals(""))
				&& !editors.get(0).equals("")) {
			gameList = gamesService.getFilteredGames(genres, editors, sortBy);
			log.info(gameList);
		} else if(!(genres.equals(""))) {
			gameList = gamesService.getFilteredGenreOnly(genres, sortBy);
			log.info(gameList);
		} else if(!editors.get(0).equals("")) {
			gameList = gamesService.getFilteredEditorOnly(editors, sortBy);
			log.info(gameList);
		} else {
			gameList = gamesService.getAllGames(sortBy);
		}
		
		return gameList;
	}
}
