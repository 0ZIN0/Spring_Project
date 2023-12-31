package com.ezen.smg.service.mypageService;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.smg.common.Pagination;
import com.ezen.smg.dto.Inquiries;
import com.ezen.smg.dto.MyGameListDTO;
import com.ezen.smg.dto.SmgUsersDTO;

public interface MyPageService {
	List<Inquiries> getContent(@Param("user_num")int user_num, int currPage);

	SmgUsersDTO getUserInfo(int user_num);
	int chkUser_pw(int user_num, String user_pw);
	int updateNick_name(String username, int user_num);
	int updateProfile_img(int user_num, MultipartFile img_file);
	int updateUserInfo(SmgUsersDTO user);
	int withdrawal_user(int user_num);
	int updateUserPw(int user_num, String user_pw);
	List<MyGameListDTO> getMyGameKeyList(Integer user_num);
	
	Pagination getPagination(int page, int totalSize);
			
	int getTotalSize(@Param("user_num")int user_num);

}
