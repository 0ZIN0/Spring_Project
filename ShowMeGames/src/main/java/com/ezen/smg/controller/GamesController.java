package com.ezen.smg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		model.addAttribute("bestSellers", gamesService.getBestSellers());
		model.addAttribute("weeklyBestSellers", gamesService.getWeeklyBestSellers());
		model.addAttribute("games", 
				gamesService.getFilteredGames(genres, editor, sortBy));
		model.addAttribute("lastestGames",gamesService.getLatestGameList());
		model.addAttribute("curatorRecmd",gamesService.getCuratorRecmdList());
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
