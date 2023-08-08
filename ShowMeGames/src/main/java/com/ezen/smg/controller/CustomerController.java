package com.ezen.smg.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ezen.smg.dto.Inquiries;
import com.ezen.smg.dto.NoticeDTO;
import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.service.faqService.FAQService;
import com.ezen.smg.service.inquiriesService.InquiriesService;
import com.ezen.smg.service.noticeService.NoticeService;

import lombok.extern.log4j.Log4j;

@PropertySource(value = "classpath:application.properties", encoding = "UTF-8")
@RequestMapping("/customer")
@Log4j
@Controller
public class CustomerController {

	@Autowired
	FAQService faqService;
	@Autowired
	NoticeService noticeService;	
	@Autowired
	InquiriesService inquiriesService;
				
	// 사진 파일 업로드시 저장될 주소
	@Value("${spring.inquiry_img.path}")
	String uploadFolder;
	
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
	public void notice(Model model) {
		model.addAttribute("notices", noticeService.getNotices(1, 10));
	}
	
	@ResponseBody
	@GetMapping(value="/notice-ajax")
	public List<NoticeDTO> noticeAjax(Model model,
			Integer num) {
		log.info("응답");
		log.info(num);
		return noticeService.getNotices(num, 10);
	}
	
	@GetMapping(value="/notice/notice_detail")
	String noticeDetail(Integer id, Model model) {
		
		NoticeDTO dto = noticeService.getContent(id);
		String organize = "";
		for (String content : dto.getNotice_content().split("\\.")) {
			organize += content + ".<br>";
		}
		dto.setNotice_content(organize);
		model.addAttribute("detail", dto);
		
		return "customer/notice_detail";
	}
	
	@ResponseBody
	@GetMapping(value = "/select-notice", produces = "application/json")
	public List<NoticeDTO> getSelectNotice(Model model, Integer year, Integer date) {

		if (date == 0) {
			return noticeService.getSelectDateNotices(year);
		}
		
		return noticeService.getSelectDateNotices(year, date);
	}

	@GetMapping(value="/qna")
	public void qna() {
		log.info("문의사항으로 갑니다");
	}
	
	@PostMapping(value="/inquiries")
	public String insert(@SessionAttribute(name="user", required = false) SmgUsersDTO user, Inquiries inquiries, Model model) {
		// 이미지 뒤에 붙여줄 날짜 포맷
		Date nowDate = new Date();				
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = format.format(nowDate);
		
		// 파일 이름 설정. 중복방지를 위해 뒤에 날짜 입력
		String file_name = user.getUser_num()+ dateString + inquiries.getImgFile().getOriginalFilename();
		
		// 파일 저장
		File saveFile = new File(uploadFolder, file_name);
		try {
			inquiries.getImgFile().transferTo(saveFile);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
				
		model.addAttribute(inquiries);		
		inquiries.setUser_num(user.getUser_num());
		inquiries.setAttachment(file_name);
		log.info("업로드파일 : " + file_name);
		log.info("파일크기 : " + inquiries.getImgFile().getSize());
		inquiriesService.insert(inquiries);		
		
		return "redirect:/customer/faq";
	}	
	
}
