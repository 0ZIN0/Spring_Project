package com.ezen.smg.dto;

import lombok.Data;

@Data
public class Inquiries {
	private Integer inquiry_id;
	private Integer user_num;
	private String inquiry_title;
	private String inquiry_content;
	private String attachment;
	private String inquiry_subject;
	
}
