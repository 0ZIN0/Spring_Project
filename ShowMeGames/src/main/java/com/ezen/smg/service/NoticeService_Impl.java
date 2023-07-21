package com.ezen.smg.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.NoticeDTO;
import com.ezen.smg.mapper.NoticeMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class NoticeService_Impl implements NoticeService {

	@Autowired
	NoticeMapper noticeMapper;

	@Override
	public List<NoticeDTO> getNotices(int page, int scope) {

		int endNum = scope * page;
		int startNum = endNum - scope + 1;

		return noticeMapper.getNotices(startNum, endNum);
	}

	@Override
	public List<NoticeDTO> getSelectDateNotices(int year, int date) {
		String dateStr = String.format("%d/%02d", year, date);
		
		return noticeMapper.getSelectDateNotices(dateStr);
	}

	@Override
	public List<NoticeDTO> getSelectDateNotices(int year) {
		String dateStr = String.format("%d", year);
		
		return noticeMapper.getSelectYearNotices(dateStr);
	}
}
