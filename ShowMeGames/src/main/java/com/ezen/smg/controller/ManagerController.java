package com.ezen.smg.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.smg.dto.Games;
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
	String certification(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("manager_token") != null) return "redirect:/admin/main";
		
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
	
	@GetMapping("/manage/admin_game")
	String adminGame(Integer page, Model model) {
		if(page == null) page = 1;
		
		int totalSize = serv.getGameListTotalSize();
		
		model.addAttribute("paging", serv.getPagination(page, totalSize));
		model.addAttribute("gameList", serv.getGameList(page));
		
		return "manager/admin_game";
	}
	
	@GetMapping("/manage/admin_game_detail")
	String adminGameDetail(Integer game_id, Model model) {
		
		Games game = serv.getGameDetail(game_id); 
		
		model.addAttribute("game", game);
		model.addAttribute("rated", game.getRated().split("/"));
		
		return "manager/admin_game_detail";
	}
	
	@GetMapping("/manage/admin_game_update")
	String adminGameUpdate(Integer game_id, Model model) {
	
		model.addAttribute("game", serv.getGameDetail(game_id));
		
		List<String[]> propList = serv.getPropList();
		
		model.addAttribute("genreArr", propList.get(0));
		model.addAttribute("editorArr", propList.get(1));
		model.addAttribute("platformArr", propList.get(2));
		model.addAttribute("layoutArr", propList.get(3));
		model.addAttribute("ratedArr", propList.get(4));
		
		return "manager/admin_game_update";
	}
	
	@PostMapping("/manage/admin_game_update")
	String adminGameUpdatePost(Games game, MultipartFile img_file) {

		int game_id = game.getGame_id(); 
		
		if(img_file != null) {
			
		}
		
		serv.updateGame(game);
		
		return "redirect:./admin_game_detail?game_id=" + game_id;
	}
	
	@GetMapping("/manage/admin_user")
	String adminUser() {
		return "manager/admin_user";
	}
	
	@GetMapping("/manage/admin_chart")
	String adminChart() {
		return "manager/admin_chart";
	}
	
	@GetMapping("/manage/admin_inquiry")
	String adminInquiry() {
		return "manager/admin_inquiry";
	}
	
	@GetMapping("/manage/admin_notice")
	String adminNotice() {
		return "manager/admin_notice";
	}
	
	@GetMapping("/manage/admin_faq")
	String adminFaq() {
		return "manager/admin_faq";
	}
	
	@GetMapping("/manage/admin_key")
	String adminKey() {
		return "manager/admin_key";
	}

	@GetMapping("/manage/admin_out")
	String adminOut() {
		return "manager/admin_out";
	}
	
	@GetMapping("/manage/sessionOut")
	String adminOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
	
		session.removeAttribute("manager_token");
		
		return "redirect:/";
	}
	
}
