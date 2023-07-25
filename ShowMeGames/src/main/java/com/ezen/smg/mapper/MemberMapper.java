package com.ezen.smg.mapper;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.SmgUsersDTO;

public interface MemberMapper {
	
	int signUp(@Param("dto") SmgUsersDTO dto);

	int idCheck(@Param("id") String userId);
	
}
