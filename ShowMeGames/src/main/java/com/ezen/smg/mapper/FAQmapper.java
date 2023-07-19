package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.QnADTO;

public interface FAQmapper {

	List<QnADTO> getPage(@Param("start") int start, @Param("end") int end);
	
}
