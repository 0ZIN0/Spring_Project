package com.ezen.smg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.service.MemberService;

import lombok.extern.log4j.Log4j;

@RequestMapping(value="/member")
@Log4j
@Controller
public class SignUpController {

	@Autowired
	MemberService serv;
	
	@GetMapping(value="/signup")
	public void signup() {
		log.info("기본 회원가입 화면입니다.");
	}
	
	@GetMapping(value="/naver_signup")
	public void naver_signup() {
		log.info("네이버회원가입");
	}
	
	@PostMapping(value="/signup")
	public String signupInsert(SmgUsersDTO dto) {
		
		serv.signUp(dto);
			
		return "member/login";
	}
	
	@GetMapping(value="/checkEmail", produces = "application/json")
	@ResponseBody
	public int chkEmail(@RequestParam("userId") String userId) {
		int result = serv.idCheck(userId);
		return result;
	}
	
}
