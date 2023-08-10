package com.ezen.smg.service.mypageService;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.common.Pagination;
import com.ezen.smg.dto.Inquiries;

public interface MyPageService {
	List<Inquiries> getContent(@Param("user_num") int user_num);
	
	Pagination getPagination(int page, int totalSize);
			
	int getTotalSize(@Param("user_num") int user_num);
}
