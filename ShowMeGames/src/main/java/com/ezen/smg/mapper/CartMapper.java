package com.ezen.smg.mapper;

import org.apache.ibatis.annotations.Param;

public interface CartMapper {
	
	String getCartContent(@Param("user_num") int user_num);
}
