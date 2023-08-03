
package com.ezen.smg.service.orderService;

import com.ezen.smg.dto.Orders;

public interface OrderService {
	
	int insertPay(Orders order);
	
	Orders getSelectOrder(int order_id);
}
