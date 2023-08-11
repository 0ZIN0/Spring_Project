package com.ezen.smg.dto;

import java.util.Date;

import lombok.Data;

@Data
public class SalesDTO {
	private Date order_date;
	private Integer total_sales;
}
