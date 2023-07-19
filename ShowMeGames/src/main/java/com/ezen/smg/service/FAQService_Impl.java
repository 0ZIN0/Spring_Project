package com.ezen.smg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.common.Pagination;
import com.ezen.smg.dto.QnADTO;
import com.ezen.smg.mapper.FAQmapper;

@Service
public class FAQService_Impl implements FAQService {

	@Autowired
	FAQmapper mapper;

	private int pageNum = 9;
	
	@Override
	public Pagination getPagination(int currPage) {
		int totalNum = mapper.getTotalNum();
		
		Pagination paging = new Pagination(totalNum, pageNum);
		
		paging.setCurrPage(currPage);
		
		return paging;
	}

	@Override
	public List<QnADTO> getList(int currPage) {
		
		int lastFAQ = currPage * pageNum;
		int firstFAQ = lastFAQ - 8;
		
		return mapper.getFAQList(firstFAQ, lastFAQ);
	}

	@Override
	public QnADTO getDetail(int id) {
		return mapper.getFAQ(id);
	}

}
