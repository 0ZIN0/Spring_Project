package com.ezen.smg.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.smg.mapper.GamesMapper;
import com.ezen.smg.service.gamesService.GamesService;
import com.ezen.smg.service.indexService.IndexService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class IndexController {
	
	Map<String, String> detail_url_mapper; 
	
	@Autowired
	IndexService serv;
	
	@Autowired
	GamesMapper gamesMapper;

	public IndexController() {
		detail_url_mapper = new HashMap<String, String>();
		
		detail_url_mapper.put("LRA", "/games/layout/type_lra");
		detail_url_mapper.put("KCW", "/games/layout/type_kcw");
		detail_url_mapper.put("HGT", "/games/layout/type_hgt");
		detail_url_mapper.put("BGC", "/games/layout/type_bgc");
		detail_url_mapper.put("SJH", "/games/layout/type_sjh");
		detail_url_mapper.put("JYM", "/games/layout/type_jym");
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		model.addAttribute("latestList", serv.getLatestGameList());
		model.addAttribute("editorList", serv.getEditorRecmdList());
		model.addAttribute("discountList", serv.getLargestDiscountList());
		model.addAttribute("curatorList", serv.getCuratorRecmdList());
		model.addAttribute("hotgameList", serv.getHotGameList());
		
		log.info("main 실행");
		
		return "index";
	}
	
	@GetMapping(value="/detail")
	public String detail(Integer game, Model model, String layout) {
		
		String url = detail_url_mapper.get(layout);
		
		model.addAttribute("game", gamesMapper.getGame(game));

		if (url == null) {
			return "/games/default";
		}
		
		return url;
	}
	
}
