package com.ezen.smg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.smg.service.LoginService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	
	@GetMapping("/member/check")
	public String loginCheck(String user_id, String user_pw) {
		loginService.getSelectUser(user_id, user_pw);
		
		
		return null;
	}
	
}
