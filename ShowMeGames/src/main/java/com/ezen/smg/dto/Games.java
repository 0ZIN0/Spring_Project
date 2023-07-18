package com.ezen.smg.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Games {
	private Integer game_id;
	private String game_name;
	private Integer game_genre;
	private Integer game_price;
	private String korean;
	private Date date;
	private String platform;
	private Integer discount;
	private String game_mode;
	private String develop_company;
	private Integer game_grade;
}
