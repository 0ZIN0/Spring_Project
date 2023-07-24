package com.ezen.smg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
//	@PostMapping("/login")
//    public String login(@RequestParam String user_id, @RequestParam String user_pw, Model model) {
//        int result = loginService.getSelectUser(user_id, user_pw);
//        if (result == 1) {
//            // 로그인 성공
//            // 로그인 성공 시에는 여기에서 로그인에 성공했다는 다른 작업을 수행할 수 있습니다.
//            return "redirect:/success"; // 성공 페이지로 이동하거나, 원하는 처리를 진행합니다.
//        } else {
//            // 이메일 또는 비밀번호가 올바르지 않음
//            model.addAttribute("errorMessage", "이메일 또는 비밀번호가 올바르지 않습니다.");
//            return "login"; // 로그인 페이지로 다시 이동하며, 에러 메시지를 화면에 표시합니다.
//        }
//    }
	
}
