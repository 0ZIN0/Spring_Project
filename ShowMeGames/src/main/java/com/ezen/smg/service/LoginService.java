package com.ezen.smg.service;

import com.ezen.smg.dto.SmgUsersDTO;

public interface LoginService {

	int getSelectUser(String user_id, String user_pw);
	
	SmgUsersDTO getUser(String user_id);
	
	int getCheckUser(String social_key);
	
}
