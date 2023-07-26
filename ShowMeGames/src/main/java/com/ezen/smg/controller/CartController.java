package com.ezen.smg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CartController {
	
	@GetMapping(value="/checkout")
	public void goCheckOut(Model model) {
		log.info("결제 페이지로 갑니다.");
	}
}
