package com.ezen.smg.dto.layout;

import com.ezen.smg.common.CommonFunction;

import lombok.Data;

@Data
public class LayoutJYMDTO {
	Integer game_id;
	String warn_content;
	
	String game_top_banner_img;    
	
	String game_cont_video_1;
	
	String game_main_text_1;
	String game_sub_text_1;
	String game_cont_img_1;
	
	String game_main_text_2;
	String game_sub_text_2;
	String game_cont_img_2;
	
	String game_main_text_3;
	String game_sub_text_3;
	String game_cont_img_3;
	
	String game_main_text_4;
	String game_sub_text_4;
	String game_cont_img_4;
	
	String game_main_text_5;
	String game_sub_text_5;
	String game_cont_img_5;

	String game_bottom_banner_img;
	
	public static LayoutJYMDTO handleCrlfToBr(LayoutJYMDTO dto) {
		dto.setGame_main_text_1(CommonFunction.handleCrlfToBr(dto.getGame_main_text_1()));
		dto.setGame_sub_text_1(CommonFunction.handleCrlfToBr(dto.getGame_sub_text_1()));
		dto.setGame_main_text_2(CommonFunction.handleCrlfToBr(dto.getGame_main_text_2()));
		dto.setGame_sub_text_2(CommonFunction.handleCrlfToBr(dto.getGame_sub_text_2()));
		dto.setGame_main_text_3(CommonFunction.handleCrlfToBr(dto.getGame_main_text_3()));
		dto.setGame_sub_text_3(CommonFunction.handleCrlfToBr(dto.getGame_sub_text_3()));
		dto.setGame_main_text_4(CommonFunction.handleCrlfToBr(dto.getGame_main_text_4()));
		dto.setGame_sub_text_4(CommonFunction.handleCrlfToBr(dto.getGame_sub_text_4()));
		dto.setGame_main_text_5(CommonFunction.handleCrlfToBr(dto.getGame_main_text_5()));
		dto.setGame_sub_text_5(CommonFunction.handleCrlfToBr(dto.getGame_sub_text_5()));
		return dto;
	}
	
	public static LayoutJYMDTO handleBrToCrlf(LayoutJYMDTO dto) {
		dto.setGame_main_text_1(CommonFunction.handleBrToCrlf(dto.getGame_main_text_1()));
		dto.setGame_sub_text_1(CommonFunction.handleBrToCrlf(dto.getGame_sub_text_1()));
		dto.setGame_main_text_2(CommonFunction.handleBrToCrlf(dto.getGame_main_text_2()));
		dto.setGame_sub_text_2(CommonFunction.handleBrToCrlf(dto.getGame_sub_text_2()));
		dto.setGame_main_text_3(CommonFunction.handleBrToCrlf(dto.getGame_main_text_3()));
		dto.setGame_sub_text_3(CommonFunction.handleBrToCrlf(dto.getGame_sub_text_3()));
		dto.setGame_main_text_4(CommonFunction.handleBrToCrlf(dto.getGame_main_text_4()));
		dto.setGame_sub_text_4(CommonFunction.handleBrToCrlf(dto.getGame_sub_text_4()));
		dto.setGame_main_text_5(CommonFunction.handleBrToCrlf(dto.getGame_main_text_5()));
		dto.setGame_sub_text_5(CommonFunction.handleBrToCrlf(dto.getGame_sub_text_5()));
		return dto;
	}
	
}
