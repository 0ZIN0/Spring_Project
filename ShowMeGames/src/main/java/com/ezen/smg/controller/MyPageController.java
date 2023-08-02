package com.ezen.smg.controller;

import java.io.File;
import java.io.IOException;

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
	
	private final String uploadDir = "/resources/img/user_profile/";
	
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
	String profile_img_update(int user_num, MultipartFile img_file) throws IllegalStateException, IOException {
		
		if(!img_file.isEmpty()) {
            String filename = img_file.getOriginalFilename();
            
            log.info("file.getOriginalFilename = " + filename);

            String fullPath = uploadDir + filename;
            
            log.info(fullPath);
            
            img_file.transferTo(new File(fullPath));			
		} 
		
		return "redirect:/mypage/my_account"; 
	}
	
	@GetMapping("/nickname_update")
	String nickname_update(String username, int user_num) {
		log.info("nickname: " + username + " / user_num: " + user_num);
		
		mypageService.updateNick_name(username, user_num);
		
		return "redirect:/mypage/my_account";
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
