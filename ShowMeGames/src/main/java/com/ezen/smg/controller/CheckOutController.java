package com.ezen.smg.controller;

import javax.servlet.http.HttpServletRequest;

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
import com.ezen.smg.mapper.UsersMapper;
import com.ezen.smg.service.loginService.LoginService;
import com.ezen.smg.service.orderService.OrderService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CheckOutController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	UsersMapper usersMapper;
	
	@ResponseBody
	@RequestMapping(value = "/checkout-success")
	public int checkoutSuccess(@RequestBody Orders order, @SessionAttribute(name = "user", required = false) SmgUsersDTO user) {
		log.error("주문 정보 확인 ajax: " + order.getImp_uid() + "주문 번호: " + order.getOrder_id());
		log.error("사용한 포인트~!!!!: " + order.getUse_point());
		order.setUser_num(user.getUser_num());
		return orderService.insertPay(order);
	}
	
	@GetMapping(value = "/orderfin")
	public void OrderFin(@SessionAttribute(name = "user", required = false) SmgUsersDTO user, Model model, Integer order_id, HttpServletRequest request) {
//		Orders order = new Orders();
		
//		order.setImp_uid("imp12345");
//		order.setBuyer_name("이로아");
//		order.setAddress("경기도 남양주시 금곡동");
//		order.setAdd_point(10000);
//		order.setUse_point(5000);
//		order.setOrder_date(new Date());
//		order.setOrder_price(10000);
//		order.setOrder_product("두근두근 문예부");
		
		model.addAttribute("user_point", usersMapper.getUserInfo(user.getUser_num()).getUser_point());
//		model.addAttribute("order", order);
		Orders order = orderService.getSelectOrder(order_id);
		request.getSession().setAttribute("user", usersMapper.getUserInfo(user.getUser_num()));
		
		if (order.getPay_method() == null) {
			order.setPay_method("정보 없음");
		}
		model.addAttribute("order", order);
	}
}
