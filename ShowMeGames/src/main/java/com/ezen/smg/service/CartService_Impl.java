package com.ezen.smg.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.Games;
import com.ezen.smg.mapper.CartMapper;
import com.ezen.smg.mapper.GamesMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CartService_Impl implements CartService {
	
	@Autowired
	CartMapper cartMapper;
	
	@Autowired
	GamesMapper gamesMapper;
	
	@Override
	public List<Games> getCartList(int user_num) {
		List<Games> games = new ArrayList<>();
		try {
			String[] cartContent = cartMapper.getCartContent(user_num).split("/");
			for (String game : cartContent) {
				games.add(gamesMapper.getGame(Integer.parseInt(game)));
			}
			return games;
		} catch (Exception e) {
			return null;
		}
		
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

	@Override
	public List<String[]> getPlatforms(int user_num) {
		List<String[]> platforms = new ArrayList<>();
		
		String[] cartContent = cartMapper.getCartContent(user_num).split("/");
		
		for (String game : cartContent) {
			platforms.add(gamesMapper.getGame(Integer.parseInt(game)).getPlatform().split(" "));
		}
		
		return platforms;
	}

	@Override
	public int deleteGame(int user_num, int game_id) {
		String cartContent = cartMapper.getCartContent(user_num);
		
		if (cartContent.contains(String.valueOf(game_id) + "/")) {
			cartContent = cartContent.replace(String.valueOf(game_id) + "/", "");
		} else {
			cartContent = cartContent.replace(String.valueOf(game_id), "");
		}
		return cartMapper.deleteGame(String.valueOf(user_num), cartContent);
	}
}
