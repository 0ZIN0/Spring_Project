package com.ezen.smg.service.orderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.Orders;
import com.ezen.smg.mapper.OrderMapper;
import com.ezen.smg.service.cartService.CartService;
import com.ezen.smg.service.memberService.MemberService;

@Service
public class OrderService_Impl implements OrderService {
	
	@Autowired
	OrderMapper orderMapper;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	MemberService memberService;
	
	@Override
	public int insertPay(Orders order) {
		if (orderMapper.insertPay(order) > 0) {
			memberService.updateUserPoint(order);
			return cartService.deleteCart(order.getUser_num());
		}
		return 0;
	}

	@Override
	public Orders getSelectOrder(int order_id) {
		return orderMapper.getSelectOrder(order_id);
	}

}
