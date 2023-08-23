package com.ezen.smg.dto.layout;

import com.ezen.smg.common.CommonFunction;

import lombok.Data;

@Data
public class LayoutLRADTO {
	Integer game_id;     
	String warn_content; 
	String game_main_title_1;    
	String game_sub_title_1;  
	String game_img_1;  
	String game_main_title_2;       
	String game_sub_title_2;   
	String game_img_2; 
	String game_detail_title_1;  
	String game_detail_content_1;  
	String game_detail_video_1;
	String game_detail_title_2;  
	String game_detail_content_2;  
	String game_detail_video_2;
	
	public static LayoutLRADTO handleCrlfToBr(LayoutLRADTO dto) {
		dto.setGame_main_title_1(CommonFunction.handleCrlfToBr(dto.getGame_main_title_1()));
		dto.setGame_sub_title_1(CommonFunction.handleCrlfToBr(dto.getGame_sub_title_1()));
		dto.setGame_main_title_2(CommonFunction.handleCrlfToBr(dto.getGame_main_title_2()));
		dto.setGame_sub_title_2(CommonFunction.handleCrlfToBr(dto.getGame_sub_title_2()));
		
		dto.setGame_detail_title_1(CommonFunction.handleCrlfToBr(dto.getGame_detail_title_1()));
		dto.setGame_detail_content_1(CommonFunction.handleCrlfToBr(dto.getGame_detail_content_1()));
		dto.setGame_detail_title_2(CommonFunction.handleCrlfToBr(dto.getGame_detail_title_2()));
		dto.setGame_detail_content_2(CommonFunction.handleCrlfToBr(dto.getGame_detail_content_2()));
		
		return dto;
	}
	
	public static LayoutLRADTO handleBrToCrlf(LayoutLRADTO dto) {
		dto.setGame_main_title_1(CommonFunction.handleBrToCrlf(dto.getGame_main_title_1()));
		dto.setGame_sub_title_1(CommonFunction.handleBrToCrlf(dto.getGame_sub_title_1()));
		dto.setGame_main_title_2(CommonFunction.handleBrToCrlf(dto.getGame_main_title_2()));
		dto.setGame_sub_title_2(CommonFunction.handleBrToCrlf(dto.getGame_sub_title_2()));
		
		dto.setGame_detail_title_1(CommonFunction.handleBrToCrlf(dto.getGame_detail_title_1()));
		dto.setGame_detail_content_1(CommonFunction.handleBrToCrlf(dto.getGame_detail_content_1()));
		dto.setGame_detail_title_2(CommonFunction.handleBrToCrlf(dto.getGame_detail_title_2()));
		dto.setGame_detail_content_2(CommonFunction.handleBrToCrlf(dto.getGame_detail_content_2()));
		return dto;
	}
}
