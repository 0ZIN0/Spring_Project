package com.ezen.smg.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.ezen.smg.mapper.LoginMapper;

import lombok.Data;

@Data
public class SmgUsersDTO {
	private Integer user_num;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String nick_name;
	private String user_grade;
	private String phone_number;
	private Integer favorite_genre;
	private Integer user_point;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth_date;
	private String login_type;
	private String profile_url;
	private String social_key;
	private Integer gender;
	
//	public int pwUpdate_M(String newPassword) {
//        String hashedPassword = PasswordUtils.hashPassword(newPassword);
//        setUser_pw(hashedPassword);
//
//        // LoginMapper를 통해 비밀번호 업데이트 쿼리를 실행하도록 설정
//        int result = LoginMapper.pwUpdate_M(this);
//        
//        // 성공적으로 비밀번호가 업데이트되었을 경우 1 반환, 실패한 경우 0 반환
//        return result == 1 ? 1 : 0;
//    }
//
//	public Object getEmail() {
//		// TODO Auto-generated method stub
//		return user_id;
//	}
}
