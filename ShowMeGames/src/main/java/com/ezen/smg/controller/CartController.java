package com.ezen.smg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.service.CartService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@GetMapping(value="/checkout")
	public void goCheckOut(Model model) {
		log.info("결제 페이지로 갑니다.");
	}
	
	@ResponseBody
	@GetMapping(value = "/cart-delete", produces = "application/json")
	public void delete(Integer game_id, @SessionAttribute(name = "user", required = false) SmgUsersDTO user) {
		log.info("game_id: " + game_id);
		
//		cartService.deleteGame(user.getUser_num(), game_id);
		
	}
}
