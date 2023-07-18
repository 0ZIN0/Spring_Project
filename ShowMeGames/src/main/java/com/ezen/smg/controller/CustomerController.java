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
	String faq() {
		return "customer/faq";
	}
	
	@GetMapping(value="/notice")
	public void notice() {
		log.info("공지사항으로 갑니다.");
	}
	
	@GetMapping(value="/qna")
	public void qna() {
		log.info("문의 사항으로 갑니다.");
	}
	
}
