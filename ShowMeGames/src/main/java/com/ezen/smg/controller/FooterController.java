package com.ezen.smg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value="/footer")
@Controller
public class FooterController {
	
	@GetMapping("/about")
	void toAbout() {}
	
	@GetMapping("/agreement")
	void toAgreement() {}
	
	@GetMapping("/private")
	void toPrivate() {}
	
}
