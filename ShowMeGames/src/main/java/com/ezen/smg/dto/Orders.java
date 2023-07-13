package com.ezen.smg.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Orders {
	private int order_id;
	private int user_num;
	private int order_price;
	private Date order_date;
	private String pay_method;
}
