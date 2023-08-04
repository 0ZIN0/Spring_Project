
package com.ezen.smg.service.orderService;

import java.util.List;

import com.ezen.smg.dto.Orders;

public interface OrderService {
	
	int insertPay(Orders order);
	
	Orders getSelectOrder(int order_id);
	
	List<Orders> getUserOrders(int user_num);
}
