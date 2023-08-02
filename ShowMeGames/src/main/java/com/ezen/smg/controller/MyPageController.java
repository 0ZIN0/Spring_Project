package com.ezen.smg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.service.mypageService.MyPageService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/mypage")
@Log4j
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
	String accountInquiry(@SessionAttribute(name="user", required = false) SmgUsersDTO user, Model model) {
		//log.info(user.getUser_num());
		
		model.addAttribute("myContents", mypageService.getContent(1));
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
