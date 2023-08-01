package com.ezen.smg.service.memberService;

import com.ezen.smg.dto.SmgUsersDTO;

public interface MemberService {

	int signUp(SmgUsersDTO dto);

	int idCheck(String userId);
	
}
