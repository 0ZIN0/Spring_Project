package com.ezen.smg.mapper;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.Carts;

public interface CartMapper {
	
	String getCartContent(@Param("user_num") int user_num);
	
	int deleteGame(@Param("user_num") String user_num, @Param("cart_content") String cart_content);
	
	int deleteCart(@Param("user_num") int user_num);
	
	int addCart(@Param("dto") Carts cartDTO);
	
	int updateCart(@Param("dto") Carts cartDTO);
}
