package com.ezen.smg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.smg.service.GamesService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class GamesController {
	
	@Autowired
	GamesService gamesService;
	
	@ResponseBody
	@GetMapping("/games-filter")
	public void gameListFilter(@RequestParam(value = "filters[]") List<String> filters) {
		log.info("필터지나감");
		log.info(filters);
	}
}
