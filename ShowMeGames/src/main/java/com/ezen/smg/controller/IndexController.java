package com.ezen.smg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ezen.smg.dto.Games;
import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.mapper.OrderMapper;
import com.ezen.smg.service.cartService.CartService;
import com.ezen.smg.service.gamesService.GamesService;
import com.ezen.smg.service.indexService.IndexService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class IndexController {

	@Autowired
	IndexService serv;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	OrderMapper orderMapper;
	
	@Autowired
	GamesService gamesService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@SessionAttribute(name = "user", required = false) SmgUsersDTO user, Model model) {
		model.addAttribute("latestList", serv.getLatestGameList());
		model.addAttribute("editorList", serv.getEditorRecmdList());
		model.addAttribute("discountList", serv.getLargestDiscountList());
		model.addAttribute("curatorList", serv.getCuratorRecmdList());
		model.addAttribute("hotgameList", serv.getHotGameList());
		
		if (user != null) {
			try {
				Integer user_num = user.getUser_num();
				List<Games> games = cartService.getCartList(user_num);
				if (games != null) {
					model.addAttribute("new_games", gamesService.getGenreSameGames(games, 1));
				} else {
					model.addAttribute("new_games", gamesService.getNewSortGames(1));
				}
			} catch (Exception e) {
				e.printStackTrace();
				return "redirect:/"; // 로그인 팝업창 띄우기
			}
		} else {
			model.addAttribute("new_games", gamesService.getNewSortGames(1));
		}
		
		log.info("main 실행");
		return "index";
	}
	
	@GetMapping(value="/detail")
	public String detail(Integer game) {
		return "games/" + game;
	}
}