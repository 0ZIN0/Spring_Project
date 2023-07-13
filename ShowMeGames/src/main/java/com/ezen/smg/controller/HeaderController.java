package com.ezen.smg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HeaderController {

    @GetMapping("/home")
    public String homePage() {
        return "home"; // 실제 홈 페이지의 경로로 수정하세요.
    }
}