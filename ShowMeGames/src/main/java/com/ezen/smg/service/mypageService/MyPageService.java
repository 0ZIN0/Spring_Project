package com.ezen.smg.service.mypageService;

import java.util.List;

import com.ezen.smg.dto.Inquiries;

public interface MyPageService {
	List<Inquiries> getContent(int user_id);
}
