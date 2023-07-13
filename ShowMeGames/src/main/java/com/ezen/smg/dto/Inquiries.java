package com.ezen.smg.dto;

import lombok.Data;

@Data
public class Inquiries {
	private int inquiry_id;
	private int user_num;
	private String inquiry_title;
	private String inquiry_content;
	private String attachment;
	private String inquiry_subject;
	
}
