package com.ezen.smg.dto.layout;

import com.ezen.smg.common.CommonFunction;

import lombok.Data;

@Data
public class LayoutSJHDTO {
	Integer game_id;     
	String title; 
	String content;    
	
	public static LayoutSJHDTO handleCrlfToBr(LayoutSJHDTO dto) {
		
		dto.setTitle(CommonFunction.handleCrlfToBr(dto.getTitle()));
		dto.setContent(CommonFunction.handleCrlfToBr(dto.getContent()));
		
		return dto;
	}
	
	public static LayoutSJHDTO handleBrToCrlf(LayoutSJHDTO dto) {
		
		dto.setTitle(CommonFunction.handleBrToCrlf(dto.getTitle()));
		dto.setContent(CommonFunction.handleBrToCrlf(dto.getContent()));
		
		return dto;
	}
	
}
