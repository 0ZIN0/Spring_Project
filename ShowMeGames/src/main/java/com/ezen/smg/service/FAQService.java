package com.ezen.smg.service;

import java.util.List;

import com.ezen.smg.common.Pagination;
import com.ezen.smg.dto.QnADTO;

public interface FAQService {

	Pagination getPagination(int page);
	
	List<QnADTO> getList(int currPage);
	
	QnADTO getDetail(int id);
}
