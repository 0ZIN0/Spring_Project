package com.ezen.smg.dto;

import lombok.Data;

@Data
public class Comments {
	private Integer comment_id;
	private Integer game_id;
	private Integer user_num;
	private String comment_content;
	private Integer good_cnt;
	private Integer bad_cnt;
}
