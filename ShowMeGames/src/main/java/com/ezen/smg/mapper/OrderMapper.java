package com.ezen.smg.mapper;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.Orders;

public interface OrderMapper {
	
	Integer getDESCOrderId();
	
	int insertPay(@Param("order") Orders order);
	
	Orders getSelectOrder(@Param("order_id") int order_id);
}
