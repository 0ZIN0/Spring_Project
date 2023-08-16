package com.ezen.smg.service.memberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.common.Encryption_SH256;
import com.ezen.smg.dto.Orders;
import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.mapper.GameKeyMapper;
import com.ezen.smg.mapper.UsersMapper;

@Service
public class MemberService_Impl implements MemberService {

	@Autowired
	UsersMapper mapper;
	
	@Autowired
	GameKeyMapper gameKeyMapper;
	
	@Override
	public int signUp(SmgUsersDTO dto) {
		String origin_pw = dto.getUser_pw();

		if(origin_pw != null && !origin_pw.equals("")) {
			// 사용자 입력 비밀번호 SHA-256 알고리즘으로 암호화 
			dto.setUser_pw(Encryption_SH256.encrypt(origin_pw));
		}

		return mapper.signUp(dto);
	}

	@Override
	public int idCheck(String userId) {

		int chk = mapper.idCheck(userId);

		return chk;
	}

	@Override
	public int updateUserPoint(Orders order) {
		SmgUsersDTO user = mapper.getUserInfo(order.getUser_num());
		user.setUser_point(order.getAdd_point() + user.getUser_point() - order.getUse_point());
		return mapper.updateUserPoint(user);
	}

	@Override
	public SmgUsersDTO getUserByUserNum(Long userNum) {
		return mapper.getUserByUserNum(userNum);
	}

	public boolean isUseKey(int user_num, int game_id) {
		
		if (gameKeyMapper.isUseGameKey(user_num, game_id) != 0) {
			return true;
		}
		return false;
	}
}
