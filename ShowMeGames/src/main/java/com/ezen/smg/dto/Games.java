package com.ezen.smg.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Games {
	private int game_id;
	private String game_name;
	private int game_genre;
	private int game_price;
	private String korean;
	private Date date;
	private String platform;
	private int discount;
	private String game_mode;
	private String develop_company;
	private int game_grade;
}
