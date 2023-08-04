package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.Inquiries;

public interface InquiriesMapper {
	
	int add(@Param("dto") Inquiries inquiries);
	
	List<Inquiries> getContent(@Param("user_num") int user_num);
	
}
