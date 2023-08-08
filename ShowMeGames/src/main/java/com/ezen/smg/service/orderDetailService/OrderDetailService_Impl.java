package com.ezen.smg.service.orderDetailService;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.Games;
import com.ezen.smg.dto.OrderDetail;
import com.ezen.smg.mapper.GamesMapper;
import com.ezen.smg.mapper.OrderDetailMapper;
import com.ezen.smg.service.orderService.OrderService;

@Service
public class OrderDetailService_Impl implements OrderDetailService {

	@Autowired
	OrderDetailMapper orderDetailMapper;

	@Autowired
	OrderService orderService;
	
	@Autowired
	GamesMapper gamesMapper;
	
	@Override
	public void insertOrderDetail(int game_id, int order_id, String buyer_name) {
		OrderDetail od = new OrderDetail();
		
		od.setGame_id(game_id);
		od.setOrder_id(order_id);
		od.setBuyer_name(buyer_name);
		
		orderDetailMapper.insertOrderDetail(od);
	}

	@Override
	public List<OrderDetail> getODList(int order_id) {
		return orderDetailMapper.getODList(order_id);
	}

	@Override
	public List<Games> getODSelectGames(int order_id) {
		List<OrderDetail> ods = orderDetailMapper.getODList(order_id);
		List<Games> games = new ArrayList<>();
		
		for (OrderDetail od : ods) {
			games.add(gamesMapper.getGame(od.getGame_id()));
		}
		
		return games;
	}
	
	
}
