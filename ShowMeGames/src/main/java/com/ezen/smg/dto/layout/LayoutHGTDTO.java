package com.ezen.smg.dto.layout;

import com.ezen.smg.common.CommonFunction;

import lombok.Data;

@Data
public class LayoutHGTDTO {
	Integer game_id;     
	String warn_content; 
	String game_img_1;    
	String game_main_title;  
	String game_main_text;  
	String game_img_2;       
	String game_sub_title;   
	String game_sub_text; 
	String game_img_3;  
	String game_story_title;  
	String game_story_text;
	
	public static LayoutHGTDTO handleCrlfToBr(LayoutHGTDTO dto) {
	
		dto.setGame_main_title(CommonFunction.handleCrlfToBr(dto.getGame_main_title()));
		dto.setGame_sub_title(CommonFunction.handleCrlfToBr(dto.getGame_sub_title()));
		dto.setGame_story_title(CommonFunction.handleCrlfToBr(dto.getGame_story_title()));
		
		dto.setGame_main_text(CommonFunction.handleCrlfToBr(dto.getGame_main_text()));
		dto.setGame_sub_text(CommonFunction.handleCrlfToBr(dto.getGame_sub_text()));
		dto.setGame_story_text(CommonFunction.handleCrlfToBr(dto.getGame_story_text()));
		
		return dto;
	}
	
	public static LayoutHGTDTO handleBrToCrlf(LayoutHGTDTO dto) {
		
		dto.setGame_main_title(CommonFunction.handleBrToCrlf(dto.getGame_main_title()));
		dto.setGame_sub_title(CommonFunction.handleBrToCrlf(dto.getGame_sub_title()));
		dto.setGame_story_title(CommonFunction.handleBrToCrlf(dto.getGame_story_title()));
		
		dto.setGame_main_text(CommonFunction.handleBrToCrlf(dto.getGame_main_text()));
		dto.setGame_sub_text(CommonFunction.handleBrToCrlf(dto.getGame_sub_text()));
		dto.setGame_story_text(CommonFunction.handleBrToCrlf(dto.getGame_story_text()));
	
		return dto;
	}
	
}
