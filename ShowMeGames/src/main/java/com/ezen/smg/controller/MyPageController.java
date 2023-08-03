package com.ezen.smg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.service.mypageService.MyPageService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/mypage")
@Controller
public class MyPageController {
	
	@Autowired
	MyPageService mypageService;
	
	@GetMapping("/my_account")
	String accountInfo(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("user") == null) return "redirect:/"; 
		
		SmgUsersDTO session_user = (SmgUsersDTO) session.getAttribute("user"); 
		
		SmgUsersDTO user = mypageService.getUserInfo(session_user.getUser_num());

		model.addAttribute("user", user);
		
		return "mypage/account_information";
	}
	
	@PostMapping("/profile_img_update")
	String profile_img_update(int user_num, MultipartFile img_file, HttpServletRequest request) {
		
		if(!img_file.isEmpty()) {
			mypageService.updateProfile_img(user_num, img_file);
		} 
		
		return "redirect:/mypage/my_account"; 
	}
	
	@GetMapping("/nickname_update")
	String nickname_update(String username, int user_num) {
		log.info("nickname: " + username + " / user_num: " + user_num);
		
		mypageService.updateNick_name(username, user_num);
		
		return "redirect:/mypage/my_account";
	}
	
	@PostMapping("/userInfo_update")
	String userInfo_update(SmgUsersDTO user) {
		
		mypageService.updateUserInfo(user);
		
		return "redirect:/mypage/my_account"; 
	}
	
	@PostMapping("/withdrawal")
	String user_withdrawal(int user_num) {
		
		log.info("탈퇴신청 user_num: " + user_num);

		// 탈퇴한 회원으로 정보 덮어쓰기. delete가 아님.
		mypageService.withdrawal_user(user_num);
		
		return "redirect:/member/sessionLogout";
	}
	
	@GetMapping("/security")
	String accountSecurity() {
		return "mypage/account_security";
	}
	
	@PostMapping("/pwd_chk")
	String accountPwd_chk(int user_num, String user_pw, Model model) {
		
		int result = mypageService.chkUser_pw(user_num, user_pw);
	
		if(result == 1) {
			return "mypage/account_update_pw";
		}
		
		model.addAttribute("try_count", 1);
		
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
