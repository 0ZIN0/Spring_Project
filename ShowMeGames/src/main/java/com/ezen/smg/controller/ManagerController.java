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
import com.ezen.smg.mapper.NoticeMapper;
import com.ezen.smg.service.managerService.ManagerService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin")
@Controller
public class ManagerController {

	@Autowired
	ManagerService serv;

	@Autowired
	NoticeMapper noticeMapper;

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
	String adminNotice(Model model, Integer page) {
		if(page == null) page = 1;

		int totalSize = noticeMapper.getAllNotices().size();

		model.addAttribute("paging", serv.getPagination(page, totalSize));
		model.addAttribute("gameList", serv.getGameList(page));

		model.addAttribute("notices", noticeMapper.getAllNotices());
		
		log.error(page);
		
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
