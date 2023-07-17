package com.ezen.smg.dto;

import java.util.Date;

import lombok.Data;

@Data
public class SmgUsers {
	private Integer user_num;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String nick_name;
	private String user_grade;
	private String phone_number;
	private Integer favorite_genre;
	private Integer user_point;
	private Date birth_day;
	private String login_type;
	private String profile_url;
}
