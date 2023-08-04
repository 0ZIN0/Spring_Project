package com.ezen.smg.service.orderService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.Games;
import com.ezen.smg.dto.Orders;
import com.ezen.smg.mapper.GameKeyMapper;
import com.ezen.smg.mapper.OrderMapper;
import com.ezen.smg.service.cartService.CartService;
import com.ezen.smg.service.memberService.MemberService;
import com.ezen.smg.service.orderDetailService.OrderDetailService;

@Service
public class OrderService_Impl implements OrderService {
	
	@Autowired
	OrderMapper orderMapper;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	GameKeyMapper gameKeyMapper;
	
	@Autowired
	OrderDetailService orderDetailService;
	
	@Override
	public int insertPay(Orders order) {
		if (orderMapper.insertPay(order) > 0) {
			memberService.updateUserPoint(order);
			List<Games> games = cartService.getCartList(order.getUser_num());
			for (Games game: games) {
				orderDetailService.insertOrderDetail(game.getGame_id(), order.getOrder_id(), order.getBuyer_name());
				gameKeyMapper.updateUserNum(order.getUser_num(), game.getGame_id());
			}
			return cartService.deleteCart(order.getUser_num());
		}
		return 0;
	}

	@Override
	public Orders getSelectOrder(int order_id) {
		return orderMapper.getSelectOrder(order_id);
	}

}
