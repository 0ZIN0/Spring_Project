package com.ezen.smg.service.mypageService;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.Inquiries;
import com.ezen.smg.dto.SmgUsersDTO;

public interface MyPageService {
	List<Inquiries> getContent(@Param("user_num") int user_num);
	SmgUsersDTO getUserInfo(int user_num);
	int updateNick_name(String username, int user_num);
}
