package com.ezen.smg.mapper;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.SmgUsersDTO;

public interface LoginMapper {
	
	SmgUsersDTO getSelectUser(@Param("user_id") String user_id);
	
}
