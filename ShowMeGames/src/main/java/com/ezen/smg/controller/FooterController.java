package com.ezen.smg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value="/introduce")
@Controller
public class FooterController {
	
	@GetMapping("/about")
	void toAbout() {}
	
	@GetMapping("/agreement")
	void toAgreement() {}
	
	@GetMapping("/private")
	void toPrivate() {}
	
	@GetMapping("/refund_policy")
	void toRefund_policy() {}
	
	@GetMapping("/youth_protection_act")
	void toYouth_protection_act() {}
	
}
