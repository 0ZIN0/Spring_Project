package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.NoticeDTO;

public interface NoticeMapper {
	
	List<NoticeDTO> getNotices(@Param("start") int startNum, @Param("end") int endNum);
}
