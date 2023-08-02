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
	public void gameList(
			Model model,
			@RequestParam(name = "genre", required=false)  String genres,
			@RequestParam(name = "editor", required=false) String editor,
			@RequestParam(name = "sortBy", required=false) Integer sortBy
			) {
		log.info(editor);
		log.info(genres);
		log.info(sortBy);

		model.addAttribute("games", 
				gamesService.getFilteredGames(genres, editor, sortBy));
	}
	
	@GetMapping("/search")
	public void search(
			@RequestParam(name = "search") String search,
			@RequestParam(name = "genre", required=false)  String genres,
			@RequestParam(name = "editor", required=false) String editor,
			@RequestParam(name = "sortBy", required=false) Integer sortBy,
			Model model) {
		
		log.info(search);
		log.info(editor);
		log.info(genres);
		log.info(sortBy);
		
		model.addAttribute("games", 
				gamesService.getSearchGames(search, genres, editor, sortBy));
	}
	
}
