package com.ezen.smg.service.faqService;

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
	public Pagination getPagination(int currPage, int totalSize) {
		
		Pagination paging = new Pagination(totalSize, pageNum);
		
		paging.setCurrPage(currPage);
		
		return paging;
		
	}

	@Override
	public List<QnADTO> getList(int currPage, String topic) {
		int lastFAQ = currPage * pageNum;
		int firstFAQ = lastFAQ - 8;
		
		return topic.equals("all") ? mapper.getFAQList(firstFAQ, lastFAQ) : mapper.getFAQTopicList(firstFAQ, lastFAQ, topic);
	}

	@Override
	public List<QnADTO> getSearchList(int currPage, String search) {
		int lastFAQ = currPage * pageNum;
		int firstFAQ = lastFAQ - 8;
		
		return mapper.getFAQSearchList(firstFAQ, lastFAQ, search);
	}

	@Override
	public QnADTO getDetail(int id) {
		return mapper.getFAQ(id);
	}

	@Override
	public int getTotalSize() {
		return mapper.getTotalNum();
	}

	@Override
	public int getTopicSize(String topic) {
		return mapper.getTopicNum(topic); 
	}

	@Override
	public int getSearchSize(String search) {
		return mapper.getSearchNum(search);
	}

}
