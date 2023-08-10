package com.ezen.smg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.smg.dto.Games;
import com.ezen.smg.dto.ManagersDTO;
import com.ezen.smg.dto.NoticeDTO;
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
		
		return "manager/admin_game_update";
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
		
		log.info("도착도착도착");
		
		if(page == null) page = 1;
		
		int totalSize = noticeMapper.getAllNotices().size();

		model.addAttribute("paging", serv.getPagination(page, totalSize));
		model.addAttribute("notices", serv.getNoticeList(page));
		
		return "manager/admin_notice";
	}

	@GetMapping("/manage/admin_notice_update_page")
	String adminNoticeUpdatePage(Model model, Integer id) {
		
		NoticeDTO dto = noticeMapper.getContent(id);
		
		model.addAttribute("notice", dto);
		
		return "manager/admin_notice_update";
	}
	
	@PostMapping(value = "/manage/admin_notice_update")
	String adminNoticeUpdate(Integer notice_id, String notice_title, String notice_content, String notice_short_content, String banner_url) {
		
		
		NoticeDTO dto = new NoticeDTO();

		log.error(notice_id);
		
		dto.setNotice_id(notice_id);
		dto.setNotice_title(notice_title);
		dto.setShort_content(notice_short_content);
		dto.setNotice_content(notice_content);
		dto.setBanner_url(banner_url);
		
		noticeMapper.noticeUpdate(dto);
		
		return "redirect:/manage/admin_notice";
	}
	
	@GetMapping("/manage/admin_notice_detail")
	String adminNoticeDetail(Model model, Integer id) {
		
		NoticeDTO dto = noticeMapper.getContent(id);
		String organize = "";
		for (String content : dto.getNotice_content().split("\\.")) {
			organize += content + ".<br>";
		}
		dto.setNotice_content(organize);
		
		model.addAttribute("notice", dto);
		
		return "manager/admin_notice_detail";
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
