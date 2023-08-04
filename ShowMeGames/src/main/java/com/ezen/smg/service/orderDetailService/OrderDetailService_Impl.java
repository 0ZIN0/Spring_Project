package com.ezen.smg.service.orderDetailService;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.OrderDetail;
import com.ezen.smg.dto.Orders;
import com.ezen.smg.mapper.OrderDetailMapper;
import com.ezen.smg.service.orderService.OrderService;

@Service
public class OrderDetailService_Impl implements OrderDetailService {

	@Autowired
	OrderDetailMapper orderDetailMapper;

	@Autowired
	OrderService orderService;
	
	@Override
	public void insertOrderDetail(int game_id, int order_id, String buyer_name) {
		OrderDetail od = new OrderDetail();
		
		od.setGame_id(game_id);
		od.setOrder_id(order_id);
		od.setBuyer_name(buyer_name);
		
		orderDetailMapper.insertOrderDetail(od);
	}

	@Override
	public List<List<OrderDetail>> getODList(int user_num) {
		
		List<Orders> orders = orderService.getUserOrders(user_num);
		List<List<OrderDetail>> ods = new ArrayList<>();
		
		for (Orders order : orders) {
			ods.add(orderDetailMapper.getODList(order.getOrder_id()));
		}
		
		return ods;
	}
}
