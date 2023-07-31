package com.ezen.smg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ezen.smg.dto.Games;
import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.service.CartService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@PostMapping(value="/checkout")
	public void goCheckOut(@SessionAttribute(name = "user", required = false) SmgUsersDTO user, Model model, String platform) {
		Integer user_num = user.getUser_num();
		List<Games> games = cartService.getCartList(user_num);
		if (games != null) {
			model.addAttribute("cart_list", cartService.getCartList(user_num));
			model.addAttribute("cart_len", cartService.getCartList(user_num).size());
			model.addAttribute("total_price", cartService.getTotalPrice(games));
			String[] platformArr = platform.split(",");
			model.addAttribute("platforms", platformArr);
			model.addAttribute("unit", cartService.getUnit(user.getUser_grade(), cartService.getTotalPrice(games)));
		}
	}
	
	@ResponseBody
	@GetMapping(value = "/cart-delete", produces = "application/json")
	public void delete(Integer game_id, @SessionAttribute(name = "user", required = false) SmgUsersDTO user) {
		cartService.deleteGame(user.getUser_num(), game_id);
	}
}
