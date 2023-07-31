package com.ezen.smg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mypage")
@Controller
public class MyPageController {
	
	@GetMapping("/my_account")
	String accountInfo() {
		
		return "mypage/account-information";
	}

}
