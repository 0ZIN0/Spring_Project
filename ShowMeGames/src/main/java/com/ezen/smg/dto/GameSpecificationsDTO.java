package com.ezen.smg.dto;

import lombok.Data;

@Data
public class GameSpecificationsDTO {
	Integer spec_id;
	String min_os;
	String min_processor;
	String min_memory; 
	String min_storage; 
	String min_directx; 
	String min_graphics_card; 
	String rec_os;              
	String rec_processor; 
	String rec_memory;
	String rec_storage; 
	String rec_directx;               
	String rec_graphics_card;         
	String login_method;              
	Integer game_id;                   
}
