package com.ezen.smg.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MyGameListDTO {
	private Date order_date;
	private Integer user_num;
	private Integer game_id;
	private String buyer_name;
	private String game_name;
	private Integer game_price;
	private String order_status;
	private String key_id;
	
}
