package com.ezen.smg.dto;

import lombok.Data;

@Data
public class Notices {
	private int notices_id;
	private String notice_content;
	private String norice_title;
	private String notice_viewcnt;
	private int manager_id;
}
