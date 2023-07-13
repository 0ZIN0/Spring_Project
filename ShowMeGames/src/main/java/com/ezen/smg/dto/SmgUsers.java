package com.ezen.smg.dto;

import java.util.Date;

import lombok.Data;

@Data
public class SmgUsers {
	private int user_num;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String nick_name;
	private String user_grade;
	private String phone_number;
	private int favorite_genre;
	private int user_point;
	private Date birth_day;
	private String login_type;
	private String profile_url;
}
