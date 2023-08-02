package com.ezen.smg.service.mypageService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.Inquiries;
import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.mapper.InquiriesMapper;
import com.ezen.smg.mapper.UsersMapper;

@Service
public class MyPageServiceImp1 implements MyPageService {
	
	@Autowired
	InquiriesMapper inquiriesmapper;
	
	@Autowired
	UsersMapper userMapper;
	
	@Override
	public List<Inquiries> getContent(int user_num) {
		return inquiriesmapper.getContent(user_num);
	}

	@Override
	public SmgUsersDTO getUserInfo(int user_num) {
		return userMapper.getUserInfo(user_num);
	}

	@Override
	public int updateNick_name(String username, int user_num) {
		return userMapper.updateNick_name(username, user_num);
	}
	
}
