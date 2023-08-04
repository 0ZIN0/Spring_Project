package com.ezen.smg.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Orders {
	private Integer order_id;
	private Integer user_num;
	private String buyer_email;
	private Integer order_price;
	private Date order_date;
	private String pay_method;
	private String order_status;
	private String imp_uid;
	private Integer use_point;
	private Integer add_point;
	private String buyer_name;
	private String address;
	private String order_product;
}
