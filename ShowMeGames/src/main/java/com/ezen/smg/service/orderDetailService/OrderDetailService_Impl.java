package com.ezen.smg.service.orderDetailService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.OrderDetail;
import com.ezen.smg.mapper.OrderDetailMapper;

@Service
public class OrderDetailService_Impl implements OrderDetailService {

	@Autowired
	OrderDetailMapper orderDetailMapper;

	@Override
	public void insertOrderDetail(int game_id, int order_id, String buyer_name) {
		OrderDetail od = new OrderDetail();

		od.setGame_id(game_id);
		od.setOrder_id(order_id);
		od.setBuyer_name(buyer_name);
		
		orderDetailMapper.insertOrderDetail(od);
	}

}
