package com.ezen.smg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.smg.dto.ManagersDTO;
import com.ezen.smg.service.managerService.ManagerService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin")
@Controller
public class ManagerController {

	@Autowired
	ManagerService serv;
	
	@GetMapping("")
	String certification() {
		return "manager/certification";
	}
	
	@PostMapping("/confirm")
	String confirm(String mng_id, String mng_pw, Model model, HttpServletRequest request) {
	
		ManagersDTO manager = serv.confirmManager(mng_id, mng_pw);
		
		if(manager == null) {
			
			model.addAttribute("try_count", 1);
			
			return "manager/certification";
		}

	 	HttpSession session = request.getSession();
		
	 	log.info("매니저 로그인, 고유NUM: " + manager.getMng_num());
	 	
	 	session.setAttribute("manager_token", manager.getMng_num());
		
		return "redirect:main";
	}
	
	@GetMapping("/main")
	String managerLogin(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		Object session_id = session.getAttribute("manager_token");
		
		if(session_id == null) return "redirect:/admin"; 
		
		return "manager/admin_main";
	}
	
}
