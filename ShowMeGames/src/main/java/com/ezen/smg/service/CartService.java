package com.ezen.smg.service;

import java.util.List;

import com.ezen.smg.dto.Games;

public interface CartService {
	
	List<Games> getCartList(int user_num);
	
	int getTotalPrice(int user_num);
}
