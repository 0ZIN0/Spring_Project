package com.ezen.smg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.smg.service.IndexService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class IndexController {

	@Autowired
	IndexService serv;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		model.addAttribute("latestList", serv.getLatestGameList());
		model.addAttribute("editorList", serv.getEditorRecmdList());
		model.addAttribute("discountList", serv.getLargestDiscountList());
		model.addAttribute("curatorList", serv.getCuratorRecmdList());
		
		log.info("main 실행");
		
		return "index";
	}
	
	@GetMapping(value="/detail")
	public String detail() {
		return "games/detail";
	}
	
}
