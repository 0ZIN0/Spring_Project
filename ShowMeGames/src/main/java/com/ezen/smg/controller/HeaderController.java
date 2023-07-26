package com.ezen.smg.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.smg.service.CartService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HeaderController {
	
	@Autowired
	CartService cartService;
	
	@GetMapping(value="/member/login")
	public void login() {
		log.info("로그인 화면입니다.");
	}
	
	@GetMapping(value="/games")
	public void games() {
		log.info("모든 게임을 보는 화면입니다.");
	}
	
	@GetMapping(value="/cart")
	public void cart(Model model) {
		
//		model.addAttribute("carts", cartService.getCartList());
	}
}
