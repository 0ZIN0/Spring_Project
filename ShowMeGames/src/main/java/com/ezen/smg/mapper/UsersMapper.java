package com.ezen.smg.mapper;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.SmgUsersDTO;

public interface UsersMapper {
	
	int signUp(@Param("dto") SmgUsersDTO dto);

	int idCheck(@Param("id") String userId);
	
	SmgUsersDTO getSelectUser(@Param("user_id") String user_id);
	
	SmgUsersDTO getUserInfo(@Param("user_num") int user_num);
	
	SmgUsersDTO getUser_social(@Param("key") String social_key);

	String getProfile_img_url(@Param("user_num") int user_num);
	
	String getUser_pw(@Param("user_num") int user_num);
	
	int updateNick_name(@Param("nickname") String username, @Param("user_num") int user_num);
	
	int updateProfile_img(@Param("user_num") int user_num, @Param("url") String profile_url);
	
	int updateUserPoint(@Param("dto") SmgUsersDTO dto);
	
	int updateUserInfo(@Param("dto") SmgUsersDTO dto);
	
	int withdrawalUser(@Param("dto") SmgUsersDTO dto);
}
