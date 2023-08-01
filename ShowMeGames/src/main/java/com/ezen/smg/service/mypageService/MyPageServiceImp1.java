package com.ezen.smg.service.mypageService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.Inquiries;
import com.ezen.smg.mapper.InquiriesMapper;

@Service
public class MyPageServiceImp1 implements MyPageService{
	
	@Autowired
	InquiriesMapper inquiriesmapper;
	
	@Override
	public List<Inquiries> getContent(int user_id) {
			
		return inquiriesmapper.getContent(user_id);
	}
}
