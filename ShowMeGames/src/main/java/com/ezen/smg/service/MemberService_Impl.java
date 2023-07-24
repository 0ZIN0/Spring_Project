package com.ezen.smg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.mapper.MemberMapper;

@Service
public class MemberService_Impl implements MemberService {

	@Autowired
	MemberMapper mapper;
	
	@Override
	public int signUp(SmgUsersDTO dto) {
		return mapper.signUp(dto);
	}

}
