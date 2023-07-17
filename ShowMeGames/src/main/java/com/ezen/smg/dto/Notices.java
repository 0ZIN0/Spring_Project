package com.ezen.smg.dto;

import lombok.Data;

@Data
public class Notices {
	private Integer notices_id;
	private String notice_content;
	private String norice_title;
	private String notice_viewcnt;
	private Integer manager_id;
}
