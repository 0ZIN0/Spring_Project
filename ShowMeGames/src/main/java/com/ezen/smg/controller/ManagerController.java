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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.smg.dto.GameKeyDTO;
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
	String adminKey(Model model, String search, String search_tag) {
		if(search != null && !search.isEmpty()) {
			model.addAttribute("search", search);
			model.addAttribute("gameKeys", serv.getSearchResults(search, search_tag, 1));
		} else {
			model.addAttribute("gameKeys", serv.getKeys(1));			
		}
		return "manager/admin_key";
	}
	
	@ResponseBody
	@GetMapping(value="/manage/admin_key_ajax")
	public List<GameKeyDTO> ajaxKey(int num, String search, String search_tag) {

		if(search !=null && !search.isEmpty()
				&& search_tag != null && !search_tag.isEmpty()) {
			return serv.getSearchResults(search, search_tag, num);
		} else {
			return serv.getKeys(num);
		}
	}
	
	@PostMapping("/manage/key_modify")
	String keyModify(Model model, String key_id, String nick_name, int key_num) {
		
		int[] results = serv.ModifyKey(key_id, nick_name, key_num);
		//results[0] == nick_name
		//results[1] == key_id
		model.addAttribute("modifyAccount", results[0]);
		model.addAttribute("modifyKey", results[1]);
		return "manager/key_modify";
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
