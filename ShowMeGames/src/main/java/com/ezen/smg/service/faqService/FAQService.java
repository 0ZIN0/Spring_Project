package com.ezen.smg.service.faqService;

import java.util.List;

import com.ezen.smg.common.Pagination;
import com.ezen.smg.dto.QnADTO;

public interface FAQService {

	Pagination getPagination(int page, int totalSize);
	
	List<QnADTO> getList(int currPage, String topic);
	
	List<QnADTO> getSearchList(int currPage, String search);
	
	QnADTO getDetail(int id);
	
	int getTotalSize();
	
	int getTopicSize(String topic);
	
	int getSearchSize(String search);
}
