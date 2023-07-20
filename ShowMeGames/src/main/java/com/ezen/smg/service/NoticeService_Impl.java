package com.ezen.smg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.NoticeDTO;
import com.ezen.smg.mapper.NoticeMapper;

@Service
public class NoticeService_Impl implements NoticeService {
	
	@Autowired
	NoticeMapper noticeMapper;
	
	public List<NoticeDTO> getNotices(int page, int scope) {
		
		int endNum = scope * page;
		int startNum = endNum - scope + 1;
		
		return noticeMapper.getNotices(startNum, endNum);
	}
}
