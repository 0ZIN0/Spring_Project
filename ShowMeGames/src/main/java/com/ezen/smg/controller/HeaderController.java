package com.ezen.smg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HeaderController {
	
	@GetMapping(value="/member/login")
	public void login() {
		log.info("로그인 화면입니다.");
	}
	
	@GetMapping(value="/games")
	public void games() {
		log.info("모든 게임을 보는 화면입니다.");
	}
	
	@GetMapping(value="/cart")
	public void cart() {
		log.info("장바구니 페이지입니다.");
	}
	
	
}
