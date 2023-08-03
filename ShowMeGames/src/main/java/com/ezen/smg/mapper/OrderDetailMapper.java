package com.ezen.smg.mapper;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.OrderDetail;

public interface OrderDetailMapper {
	
	int insertOrderDetail(@Param("dto") OrderDetail dto);
}
