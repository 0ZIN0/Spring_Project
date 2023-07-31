package com.ezen.smg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ezen.smg.dto.Games;
import com.ezen.smg.dto.SmgUsersDTO;
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
		model.addAttribute("games", gamesService.getAllGames(2));
	}

	@GetMapping(value="/cart")
	public String cart(@SessionAttribute(name = "user", required = false) SmgUsersDTO user, Model model) {
		try {
			Integer user_num = user.getUser_num();
			List<Games> games = cartService.getCartList(user_num);
			if (games != null) {
				model.addAttribute("cart_list", cartService.getCartList(user_num));
				model.addAttribute("cart_len", cartService.getCartList(user_num).size());
				model.addAttribute("total_price", cartService.getTotalPrice(games));
				model.addAttribute("platforms", cartService.getPlatforms(user_num));
				model.addAttribute("unit", cartService.getUnit(user.getUser_grade(), cartService.getTotalPrice(games)));
			}
			return "cart";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/"; // 로그인 팝업창 띄우기
		}
	}
}
