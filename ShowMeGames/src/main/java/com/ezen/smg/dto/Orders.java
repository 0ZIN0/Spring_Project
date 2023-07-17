package com.ezen.smg.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Orders {
	private Integer order_id;
	private Integer user_num;
	private Integer order_price;
	private Date order_date;
	private String pay_method;
}
