package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.NoticeDTO;

public interface NoticeMapper {
	
	List<NoticeDTO> getNotices(@Param("start") int startNum, @Param("end") int endNum);
	
	List<NoticeDTO> getAllNotices();
	
	List<NoticeDTO> getSelectYearNotices(@Param("date") String selectDate);
	
	List<NoticeDTO> getSelectDateNotices(@Param("date") String selectDate);
	
	NoticeDTO getContent(@Param("id") int notice_id);
	
	int noticeUpdate(@Param("dto")NoticeDTO dto);
	
	int addNotice(@Param("dto")NoticeDTO dto);
}
