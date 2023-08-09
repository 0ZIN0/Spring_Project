package com.ezen.smg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.smg.service.categoryService.CategoryService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CategoryController {
	
	@Autowired
	CategoryService service;	
	
	@GetMapping("/category/bestseller")
	public void bestseller(
			Model model,
			@RequestParam(name = "genre", required=false)  String genres,
			@RequestParam(name = "editor", required=false) String editor
			) {
		log.info(editor);
		log.info(genres);

		model.addAttribute("games", 
				service.getBestsellers(genres, editor));
	}
	
	@GetMapping("/category/free")
	public void free(
			@RequestParam(name = "genre", required=false)  String genres,
			@RequestParam(name = "editor", required=false) String editor,
			@RequestParam(name = "sortBy", required=false) Integer sortBy,
			Model model) {
		
		log.info(editor);
		log.info(genres);
		log.info(sortBy);
		
		model.addAttribute("games", 
				service.getFreeGames(genres, editor, sortBy));
	}
	
	@GetMapping("/category/lastest")
	public void lastest(
			@RequestParam(name = "genre", required=false)  String genres,
			@RequestParam(name = "editor", required=false) String editor,
			@RequestParam(name = "sortBy", required=false) Integer sortBy,
			Model model) {
		
		log.info(editor);
		log.info(genres);
		log.info(sortBy);
		
		model.addAttribute("games", 
				service.getLastestGames(genres, editor, sortBy));
	}
	
	@GetMapping("/category/discount")
	public void discount(
			@RequestParam(name = "genre", required=false)  String genres,
			@RequestParam(name = "editor", required=false) String editor,
			@RequestParam(name = "sortBy", required=false) Integer sortBy,
			Model model) {

		log.info(editor);
		log.info(genres);
		log.info(sortBy);
		
		model.addAttribute("games", 
				service.getDiscountGames(genres, editor, sortBy));
	}
	
	@GetMapping("/category/editor")
	public void editor(
			@RequestParam(name="editor") String editor, 
			@RequestParam(name = "genre", required=false)  String genres,
			@RequestParam(name = "sortBy", required=false) Integer sortBy,
			Model model) {

		log.info(editor);
		log.info(genres);
		log.info(sortBy);
		
		model.addAttribute("games", 
				service.getEditorRecmdGames(editor, genres, sortBy));
	}
	
}
