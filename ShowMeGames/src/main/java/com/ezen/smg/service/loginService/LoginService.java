package com.ezen.smg.service.loginService;

import com.ezen.smg.dto.SmgUsersDTO;

public interface LoginService {

	int getSelectUser(String user_id, String user_pw);
	
	SmgUsersDTO getUser(String user_id);
	
	SmgUsersDTO getUser_Social(String social_key);
	
}
