package com.ezen.smg.dto;

import lombok.Data;

@Data
public class Comments {
	private int comment_id;
	private int game_id;
	private int user_num;
	private String comment_content;
	private int good_cnt;
	private int bad_cnt;
}
