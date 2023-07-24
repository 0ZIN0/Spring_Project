package com.ezen.smg.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDTO {
	private Integer notice_id;
	private Integer mng_num;
	private String notice_title;
	private String notice_content;
	private Integer notice_viewcnt;
	private Date write_date;
	private String short_content;
	private String banner_url;
}
