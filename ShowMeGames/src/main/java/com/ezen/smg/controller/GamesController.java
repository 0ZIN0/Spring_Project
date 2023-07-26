package com.ezen.smg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@ResponseBody
	@GetMapping("/games-filter")
	public void gameListFilter(@RequestParam(value = "filters[]") List<String> filters) {
		log.info("필터지나감");
		log.info(filters);
	}
}
