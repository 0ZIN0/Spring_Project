package com.ezen.smg.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Games {
	private Integer game_id;
	private String game_name;
	private String game_genre;
	private Integer game_price;
	private String korean;
	private Date release_date;
	private String platform;
	private Integer discount;
	private String game_mode;
	private String develop_company;
	private Integer game_grade;
	private String banner_img_url;
	private	String editor;
	private Integer discounted_price;
	private String layout;
	private String rated;
}
