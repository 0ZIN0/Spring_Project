package com.ezen.smg.service.loginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.common.Encryption_SH256;
import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.mapper.UsersMapper;

@Service
public class LoginService_Impl implements LoginService {

	@Autowired
	UsersMapper loginMapper;

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

			if (user.getUser_pw().equals(Encryption_SH256.encrypt(user_pw))) {
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
	public SmgUsersDTO getUser_Social(String social_key) {
		return loginMapper.getUser_social(social_key);
	}

}
