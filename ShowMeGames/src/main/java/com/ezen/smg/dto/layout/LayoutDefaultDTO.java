package com.ezen.smg.dto.layout;

import com.ezen.smg.common.CommonFunction;

import lombok.Data;

@Data
public class LayoutDefaultDTO {
	Integer game_id;
	String warn_content;
	String game_info_title;
	String game_info_content;
	String game_info_img_url;
	String game_story;
	
	public static LayoutDefaultDTO handleCrlfToBr(LayoutDefaultDTO dto) {
		
		dto.setGame_info_title(CommonFunction.handleCrlfToBr(dto.getGame_info_title()));
		dto.setGame_info_content(CommonFunction.handleCrlfToBr(dto.getGame_info_content()));
		dto.setGame_story(CommonFunction.handleCrlfToBr(dto.getGame_story()));
		
		return dto;
	}
	
	public static LayoutDefaultDTO handleBrToCrlf(LayoutDefaultDTO dto) {
	
		dto.setGame_info_title(CommonFunction.handleBrToCrlf(dto.getGame_info_title()));
		dto.setGame_info_content(CommonFunction.handleBrToCrlf(dto.getGame_info_content()));
		dto.setGame_story(CommonFunction.handleBrToCrlf(dto.getGame_story()));
		
		return dto;
	}
	
}
