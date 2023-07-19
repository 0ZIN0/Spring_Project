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
	String faq(Integer page, String topic, String search, Model model) {
		if(page == null) page = 1;
		
		if(topic == null || topic.equals("")) topic = "all";
		
		int totalSize;
		
		if(search == null || search.equals("")) {
			totalSize = topic.equals("all") ? faqService.getTotalSize() : faqService.getTopicSize(topic);
			
			model.addAttribute("faqList", faqService.getList(page, topic));
			model.addAttribute("topic", topic);
		} else {
			totalSize = faqService.getSearchSize(search);
			
			model.addAttribute("faqList", faqService.getSearchList(page, search));
			model.addAttribute("search", search);
		}
		
		model.addAttribute("paging", faqService.getPagination(page, totalSize)); 
		model.addAttribute("totalSize", totalSize);
		
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
