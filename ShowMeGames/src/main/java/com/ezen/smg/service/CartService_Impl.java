package com.ezen.smg.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.Games;
import com.ezen.smg.mapper.CartMapper;
import com.ezen.smg.mapper.GamesMapper;

@Service
public class CartService_Impl implements CartService {
	
	@Autowired
	CartMapper cartMapper;
	
	@Autowired
	GamesMapper gamesMapper;
	
	@Override
	public List<Games> getCartList(int user_num) {
		List<Games> games = new ArrayList<>();
		String[] cartContent = cartMapper.getCartContent(user_num).split("/");
		
		for (String game : cartContent) {
			games.add(gamesMapper.getGame(Integer.parseInt(game)));
		}
		
		return games;
	}

	@Override
	public int getTotalPrice(int user_num) {
		String[] cartContent = cartMapper.getCartContent(user_num).split("/");
		int total_price = 0;
		
		for (String game : cartContent) {
			total_price += gamesMapper.getGame(Integer.parseInt(game)).getGame_price();
		}
		
		return total_price;
	}

}
