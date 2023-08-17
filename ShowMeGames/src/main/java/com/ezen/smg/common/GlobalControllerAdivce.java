package com.ezen.smg.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.ezen.smg.dto.Games;
import com.ezen.smg.mapper.GamesMapper;

@ControllerAdvice
public class GlobalControllerAdivce {
	
	@Autowired
	GamesMapper map;
	
	@ModelAttribute("headerData")
	public List<Games> headerData() {
		return map.getCuratorGames();
	}
}
