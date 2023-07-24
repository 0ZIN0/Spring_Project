package com.ezen.smg.service;

import java.util.List;

import com.ezen.smg.dto.NoticeDTO;

public interface NoticeService {
	
	List<NoticeDTO> getNotices(int page, int scope);
	
	List<NoticeDTO> getAllNotices();
	
	List<NoticeDTO> getSelectDateNotices(int year, int date);
	
	List<NoticeDTO> getSelectDateNotices(int year);
}
