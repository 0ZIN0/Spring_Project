package com.ezen.smg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.Inquiries;
import com.ezen.smg.mapper.InquiriesMapper;

@Service
public class InquiriesServiceImp1 implements InquiriesService {
		
	@Autowired
	InquiriesMapper inquiriesMapper;
	
	@Override
	public int insert() {
		Inquiries inquiries = new Inquiries();
		return inquiriesMapper.add(inquiries);
	}
}
