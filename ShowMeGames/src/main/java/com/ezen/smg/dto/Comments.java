package com.ezen.smg.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Comments {
	private Integer comment_id;
	private Integer game_id;
	private Integer user_num;
	private String comment_content;
	private Date write_date;
	private Integer good_cnt;
	private Integer bad_cnt;
	private Double grade;
	
	private String nick_name;
	private String profile_url;
	private String user_grade;
}
