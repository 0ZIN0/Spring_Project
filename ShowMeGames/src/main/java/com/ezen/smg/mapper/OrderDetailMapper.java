package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.OrderDetail;

public interface OrderDetailMapper {
	
	int insertOrderDetail(@Param("dto") OrderDetail dto);
	
	List<OrderDetail> getODList(@Param("order_id") int order_id);
}
