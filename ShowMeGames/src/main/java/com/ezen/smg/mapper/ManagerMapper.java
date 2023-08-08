package com.ezen.smg.mapper;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.ManagersDTO;

public interface ManagerMapper {

	ManagersDTO getMangerById(@Param("mng_id") String mng_id);
	
	ManagersDTO getManager(@Param("mng_num") Integer mng_num);
	
}
