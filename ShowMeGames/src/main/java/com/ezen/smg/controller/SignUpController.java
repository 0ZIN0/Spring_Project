package com.ezen.smg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class SignUpController {

	@GetMapping(value="/member/signup")
	public void login() {
		log.info("회원가입 + 화면입니다.");
	}
	
}
