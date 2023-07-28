package com.ezen.smg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.common.Encryption_SH256;
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
			/*if (user.getUser_pw().equals(user_pw)) {
				return 1;
			}*/
			
			/*
			 * if (user.getUser_pw().equals(Encryption_SH256.encrypt(user_pw))) { return 1;
			 * }
			 */
			
			if (Encryption_SH256.encrypt(user.getUser_pw()).equals(Encryption_SH256.encrypt(user_pw))) {
				return 1;
			}
		}
		return 0;
	}


	@Override
	public SmgUsersDTO getUser(String user_id) {
		return loginMapper.getSelectUser(user_id);
	}


	@Override
	public int getCheckUser(String social_key) {
		return loginMapper.checkUser(social_key);
	}
}
