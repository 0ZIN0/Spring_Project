package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.Orders;

public interface OrderMapper {
	
	Integer getDESCOrderId();
	
	int insertPay(@Param("order") Orders order);
	
	Orders getSelectOrder(@Param("order_id") int order_id);
	
	List<Orders> getUserOrders(@Param("user_num") int user_num);
}
