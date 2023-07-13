package com.ezen.smg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HeaderController {
	
	@GetMapping("/customer/faq")
	public String faq() {
		log.info("자주 묻는 질문으로 들어갑니다.");
		return "customer/faq";
	}
	
}
