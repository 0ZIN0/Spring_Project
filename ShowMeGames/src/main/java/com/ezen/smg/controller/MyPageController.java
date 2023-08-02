package com.ezen.smg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.smg.dto.SmgUsersDTO;

@RequestMapping("/mypage")
@Controller
public class MyPageController {
	
	@GetMapping("/my_account")
	String accountInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("user") == null) return "/"; 
		
		SmgUsersDTO user = (SmgUsersDTO) session.getAttribute("user"); 
		
		user.getUser_num();
		
		return "mypage/account-information";
	}
	
	@GetMapping("/security")
	String accountSecurity() {
		return "mypage/account_security";
	}
	
	@GetMapping("/inquiry")
	String accountInquiry() {
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
