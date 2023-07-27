package com.ezen.smg.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.ezen.smg.dto.Inquiries;
import com.ezen.smg.mapper.InquiriesMapper;
import com.ezen.smg.service.FAQService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/customer")
@Log4j
@Controller
public class CustomerController {

	@Autowired
	FAQService faqService;
	
	@Autowired
	InquiriesMapper inquiriesMapper;
			
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
		log.info("문의사항으로 갑니다");
	}
	
	@PostMapping(value="/inquireis")
	public String insert(Inquiries inquiries, Model model) {
		String uploadFolder = "C:\\javastudy\\spring-workspace\\Spring_Project\\ShowMeGames\\src\\main\\webapp\\resources\\img\\customer\\inquiries";
		String file_name = inquiries.getAttachment().getOriginalFilename();
		log.info(inquiries);
		File saveFile = new File(uploadFolder, file_name);
			try {
				inquiries.getAttachment().transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		model.addAttribute(inquiries);
		inquiries.setFile_name(file_name);
		log.info("업로드파일 : " + file_name);
		log.info("파일크기 : " + inquiries.getAttachment().getSize());
		inquiriesMapper.add(inquiries);		
		
		return "redirect:/customer/faq";
	}	
	
}
