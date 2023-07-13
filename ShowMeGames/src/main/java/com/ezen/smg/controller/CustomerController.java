package com.ezen.smg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@RequestMapping("/customer")
@Log4j
@Controller
public class CustomerController {
	
	@GetMapping(value="/faq")
	public void faq() {
		log.info("자주 묻는 질문으로 갑니다.");
	}
	
}
