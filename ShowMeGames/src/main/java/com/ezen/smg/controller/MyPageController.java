package com.ezen.smg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.smg.service.mypageService.MyPageService;

@RequestMapping("/mypage")
@Controller
public class MyPageController {
	
	@Autowired
	MyPageService mypageService;
	
	@GetMapping("/my_account")
	String accountInfo() {
		return "mypage/account-information";
	}
	
	@GetMapping("/security")
	String accountSecurity() {
		return "mypage/account_security";
	}
	
	@GetMapping("/inquiry")
	String accountInquiry(Integer id,Model model) {
	
		model.addAttribute("myContent", mypageService.getContent(id));
		return "mypage/account_inquiry";
	}
	
	@GetMapping("/gamelist")
	String accountGameList() {
		return "mypage/account_gamelist";
	}
	
	@GetMapping("/orders")
	String accountOrders() {
		return "mypage/account_orders";
	}

}
