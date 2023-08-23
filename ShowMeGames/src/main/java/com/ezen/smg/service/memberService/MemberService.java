package com.ezen.smg.service.memberService;

import com.ezen.smg.dto.MailDTO;
import com.ezen.smg.dto.Orders;
import com.ezen.smg.dto.SmgUsersDTO;

public interface MemberService {

	int signUp(SmgUsersDTO dto);

	int idCheck(String userId);
	
	int updateUserPoint(Orders order);

	SmgUsersDTO getUserByUserNum(Long userNum);
	
	boolean isUseKey(int user_num, int game_id);
	
	MailDTO createMailAndChangePassword(String memberEmail);
	
	String getTempPassword();
	
	void updatePassword(String temp_pw, String user_id);
	
	void mailSend(MailDTO mailDTO);
}
