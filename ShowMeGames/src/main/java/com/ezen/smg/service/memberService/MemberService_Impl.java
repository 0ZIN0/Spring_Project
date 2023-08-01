package com.ezen.smg.service.memberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.common.Encryption_SH256;
import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.mapper.UsersMapper;

@Service
public class MemberService_Impl implements MemberService {

	@Autowired
	UsersMapper mapper;
	
	@Override
	public int signUp(SmgUsersDTO dto) {
		String origin_pw = dto.getUser_pw();
		
		// 사용자 입력 비밀번호 SHA-256 알고리즘으로 암호화 
		dto.setUser_pw(Encryption_SH256.encrypt(origin_pw));
		
		return mapper.signUp(dto);
	}

	@Override
	public int idCheck(String userId) {
		
		int chk = mapper.idCheck(userId);
		
		return chk;
	}

}
