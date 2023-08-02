package com.ezen.smg.mapper;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.SmgUsersDTO;

public interface UsersMapper {
	
	int signUp(@Param("dto") SmgUsersDTO dto);

	int idCheck(@Param("id") String userId);
	
	SmgUsersDTO getSelectUser(@Param("user_id") String user_id);
	
	int checkUser(@Param("key") String social_key);
	
	SmgUsersDTO getSelectNumUser(@Param("user_num") int user_num);
	
	int updateUserPoint(@Param("dto") SmgUsersDTO dto);
}
