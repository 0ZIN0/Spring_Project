package com.ezen.smg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.smg.service.FAQService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/customer")
@Log4j
@Controller
public class CustomerController {

	@Autowired
	FAQService faqService;
	
	@GetMapping(value="/faq")
	String faq(Integer page, Model model) {
		if(page == null) page = 1;
		
		model.addAttribute("paging", faqService.getPagination(page)); 
	
		model.addAttribute("faqList", faqService.getList(page));
		
		return "customer/faq";
	}
	
	@GetMapping(value="/faq/detail")
	String faqDetail(Integer id, Model model) {
	
		model.addAttribute("qna", faqService.getDetail(id));
		
		return "customer/faq_detail";
	}
	
	@GetMapping(value="/notice")
	public void notice() {
		log.info("공지사항으로 갑니다.");
	}
	
	@GetMapping(value="/qna")
	public void qna() {
		log.info("문의 사항으로 갑니다.");
	}
	
}
