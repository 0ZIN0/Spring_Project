package com.ezen.smg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ezen.smg.dto.Orders;
import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.service.orderService.OrderService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CheckOutController {
	
	@Autowired
	OrderService orderService;
	
	@ResponseBody
	@RequestMapping(value = "/checkout-success")
	public int checkoutSuccess(@RequestBody Orders order, @SessionAttribute(name = "user", required = false) SmgUsersDTO user) {
		log.error("주문 정보 확인 ajax: " + order.getImp_uid() + "주문 번호: " + order.getOrder_id());
		log.error("사용한 포인트~!!!!: " + order.getUse_point());
		order.setUser_num(user.getUser_num());
		return orderService.insertPay(order);
	}
	
	@GetMapping(value = "/orderfin")
	public void OrderFin(@SessionAttribute(name = "user", required = false) SmgUsersDTO user, Model model, Integer order_id) {
		model.addAttribute("user_point", user.getUser_point());
		model.addAttribute("order", orderService.getSelectOrder(order_id));
	}
}
