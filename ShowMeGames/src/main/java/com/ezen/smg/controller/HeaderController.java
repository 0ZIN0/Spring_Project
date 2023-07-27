package com.ezen.smg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.ezen.smg.service.CartService;
import com.ezen.smg.service.GamesService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HeaderController {
	
	@Autowired
	CartService cartService;
	
	@Autowired
	GamesService gamesService;
	
	@GetMapping(value="/member/login")
	public void login() {
		log.info("로그인 화면입니다.");
	}
	
	@GetMapping("/games")
	public void gameList(Model model) {
		
		System.out.println("목록을 가져옵니다");
		model.addAttribute("games", gamesService.getAllGames());
	}
	
	@GetMapping(value="/cart")
	public void cart(Model model) {
		log.info("1");
//		model.addAttribute("carts", cartService.getCartList());
	}
}
