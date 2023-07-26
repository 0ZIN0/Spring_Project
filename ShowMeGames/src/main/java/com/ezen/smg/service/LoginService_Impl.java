package com.ezen.smg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.mapper.LoginMapper;

@Service
public class LoginService_Impl implements LoginService {
	@Autowired
	LoginMapper loginMapper;
	
	
	@Override
	public int getSelectUser(String user_id, String user_pw) {
		SmgUsersDTO user = loginMapper.getSelectUser(user_id);
		if (user != null) {
			if (user.getUser_pw().equals(user_pw)) {
				return 1;
			}
		}
		return 0;
	}

	
	
}
