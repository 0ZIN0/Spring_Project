package com.ezen.smg.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.ezen.smg.dto.Inquiries;
import com.ezen.smg.mapper.InquiriesMapper;

public class InquiriesServiceImp1 implements InquiriesService {
	
	@Autowired
	InquiriesMapper inquiriesMapper;
	
	@Override
	public int insert(Inquiries inquiries) {
		inquiriesMapper.add(inquiries);
		
		return 0;
	}
}
