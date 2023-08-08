package com.ezen.smg.service.orderDetailService;

import java.util.List;

import com.ezen.smg.dto.Games;
import com.ezen.smg.dto.OrderDetail;

public interface OrderDetailService {
	
	void insertOrderDetail(int game_id, int order_id, String buyer_name);
	
	List<OrderDetail> getODList(int order_id);
	
	List<Games> getODSelectGames(int order_id);
}
