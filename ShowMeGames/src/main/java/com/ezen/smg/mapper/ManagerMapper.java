package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.Inquiries;
import com.ezen.smg.dto.ManagersDTO;

public interface ManagerMapper {

	ManagersDTO getMangerById(@Param("mng_id") String mng_id);
	
	ManagersDTO getManager(@Param("mng_num") Integer mng_num);
	
	int getTotalNum();
	
	List<Inquiries> getContents(@Param("start") int start, @Param("end") int end);
	
	int answer(@Param("inquiry_id") int inquiry_id, @Param("inquiry_answer") String inquiry_answer);
}
