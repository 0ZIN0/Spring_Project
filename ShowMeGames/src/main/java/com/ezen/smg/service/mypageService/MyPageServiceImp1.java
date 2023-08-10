package com.ezen.smg.service.mypageService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.common.Pagination;
import com.ezen.smg.dto.Inquiries;
import com.ezen.smg.mapper.InquiriesMapper;

@Service
public class MyPageServiceImp1 implements MyPageService{
	
	@Autowired
	InquiriesMapper inquiriesmapper;
	
	private int pageNum = 9;
	
	@Override
	public List<Inquiries> getContent(int user_num) {
			
		return inquiriesmapper.getContent(user_num);
	}
	
	@Override
	public Pagination getPagination(int currPage, int totalSize) {
		Pagination paging = new Pagination(totalSize, pageNum);
		
		paging.setCurrPage(currPage);
		
		return paging;
	}

	@Override
	public int getTotalSize(int user_num) {
		
		return inquiriesmapper.getTotalNum(user_num);
	}
}
