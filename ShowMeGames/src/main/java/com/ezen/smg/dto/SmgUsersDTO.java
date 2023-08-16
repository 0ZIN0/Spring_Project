package com.ezen.smg.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	
	 private String newPassword;  // 새로운 비밀번호 필드 추가

	    public String getNewPassword() {
	        return newPassword;
	    }

	    public void setNewPassword(String newPassword) {
	        this.newPassword = newPassword;
	    }
	
	
	
}
