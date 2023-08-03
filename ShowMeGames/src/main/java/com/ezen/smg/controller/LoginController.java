package com.ezen.smg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.smg.service.loginService.LoginService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@GetMapping(value="/member/login")
	public void login() {
		log.info("로그인 화면입니다.");
	}
	
	@GetMapping("/member/check")
	public String loginCheck(String user_id, String user_pw, Model model, HttpServletRequest request) {
		int result = loginService.getSelectUser(user_id, user_pw);
		if (result == 1) {
			
			System.out.println("로그인 성공");
				
			// 사용자 정보를 세션에 저장
			HttpSession session = request.getSession();
			
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_pw", user_pw);
			session.setAttribute("isLoggedIn", true);
			session.setAttribute("user", loginService.getUser(user_id));
			
			log.info(session.getAttribute("user"));
	        return "/member/loginSuccess";
		} else {
			// 로그인 실패 시, 에러 메시지 출력 또는 다른 작업 수행
			System.out.println("로그인 실패");
			 model.addAttribute("loginFailed", true);
			return "redirect:/member/login"; 
		}
	}
	@GetMapping(value="/member/loginSession")
	public void session() {
		log.info("세션 페이지입니다.");
	}
	
	@GetMapping(value="/member/sessionLogout")
	public void logout() {
		log.info("로그아웃 페이지입니다.");
	}
	
	@GetMapping(value="/member/naver_login")
	public void naver_login() {
		log.info("네이버 로그인");
	}
	
	@GetMapping(value="/member/loginSuccess")
	public void loginSuccess() {}
	
	@ResponseBody
	@PostMapping(value="/member/naver_check", produces = "application/json")
	public String naver_check(String id, String email, HttpServletRequest request) {
		if(loginService.getCheckUser(id) == 1) {
			HttpSession session = request.getSession();
			
			session.setAttribute("isLoggedIn", true);
			session.setAttribute("user", loginService.getUser(email));
			
			return "Y";
		} else {
			return "N";
		}
	}
	
	@GetMapping(value="/sessionLogout")
	public String pofileLogout() {
		log.info("프로필에서 로그아웃 페이지입니다.");
		return "redirect:/member/sessionLogout"; 
	}
	
	@GetMapping(value="/member/forgot")
	public void forgot() {
		log.info("비밀번호 재설정 페이지입니다.");
	}
	
	
}
