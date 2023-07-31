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
import com.ezen.smg.service.cartService.CartService;

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
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
