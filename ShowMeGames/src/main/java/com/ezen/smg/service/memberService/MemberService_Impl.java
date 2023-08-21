package com.ezen.smg.service.memberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.ezen.smg.common.Encryption_SH256;
import com.ezen.smg.dto.MailDTO;
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
	
	@Autowired
	JavaMailSender jmsender;
		
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

	@Override
	public MailDTO createMailAndChangePassword(String user_id) {
		String temp_pw = getTempPassword();
		MailDTO dto = new MailDTO();
		dto.setUser_id(user_id);
		dto.setTitle("[Show Me Games] 임시비밀번호 안내 이메일 입니다.");
		dto.setMessage("안녕하세요. Show Me Games 임시비밀번호 안내 관련 이메일 입니다." + " 회원님의 임시 비밀번호는 "
				+ temp_pw + "입니다." + "로그인 후에 비밀번호를 변경을 해주세요");
		updatePassword(temp_pw, user_id);
		return dto;
	}		

	//임시 비밀번호로 업데이트
	@Override
	public void updatePassword(String temp_pw, String user_id) {
		SmgUsersDTO dto = mapper.selectUser_id(user_id);

		if (dto != null) {
			mapper.updateUserPw(dto.getUser_num(), Encryption_SH256.encrypt(temp_pw));
		}
	}

	@Override
	public String getTempPassword(){
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		String temp_pw = "";
		int idx = 0;
		for (int i = 0; i < 10; i++) {
			idx = (int) (charSet.length * Math.random());
			temp_pw += charSet[idx];
		}
		return temp_pw;
	}

	@Override
	public void mailSend(MailDTO mailDTO) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(mailDTO.getUser_id());
		message.setSubject(mailDTO.getTitle());
		message.setText(mailDTO.getMessage());
		message.setFrom("loa3256@gmail.com");
		message.setReplyTo("loa3256@gmail.com");
		jmsender.send(message);
	}
}
