package com.ezen.smg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ezen.smg.dto.MailDTO;
import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.mapper.UsersMapper;
import com.ezen.smg.service.loginService.LoginService;
import com.ezen.smg.service.memberService.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class LoginController {

	@Autowired
	LoginService loginService;

	@Autowired
	MemberService memberService;

	@Autowired
	UsersMapper usersMapper;
	
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
	public String naver_check(String id, HttpServletRequest request) {
		SmgUsersDTO user = loginService.getUser_Social(id);

		if(user != null) {
			HttpSession session = request.getSession();

			session.setAttribute("isLoggedIn", true);
			session.setAttribute("user", user);

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
	
	@ResponseBody
	@Transactional
	@PostMapping(value="/member/temp_pw_send")
	public int tempPWSend(@SessionAttribute(name = "user", required = false) SmgUsersDTO user, @RequestBody String user_id) {
		SmgUsersDTO dto = usersMapper.selectUser_id(user_id);
		if (dto != null) {
			MailDTO Maildto = memberService.createMailAndChangePassword(user_id);
			memberService.mailSend(Maildto);
			return 1;
		}
		return 0;
	}

	@GetMapping(value="/member/forgot")
	public void forgot() {
		log.info("비밀번호 재설정 페이지입니다.");
	}
}