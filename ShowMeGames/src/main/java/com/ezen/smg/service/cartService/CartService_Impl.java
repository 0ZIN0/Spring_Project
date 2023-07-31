package com.ezen.smg.service.cartService;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.common.CommonFunction;
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
			for (String game_id : cartContent) {
				Games gameDTO = gamesMapper.getGame(Integer.parseInt(game_id));
				int discount_price = CommonFunction.calDiscount(gameDTO.getGame_price(), 10);
				gameDTO.setDiscounted_price(discount_price); 
				log.error(gameDTO.getDiscounted_price());
				games.add(gameDTO);
			}
			
			return games;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int getTotalPrice(List<Games> games) {
		int total_price = 0;
		
		for (Games game : games) {
			total_price += game.getDiscounted_price();
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

	@Override
	public int getUnit(String user_grade, int totalPrice) {
		if (user_grade.equals("S")) {
			return (int)(Math.floor(totalPrice * 0.05));
		} else if (user_grade.equals("A")) {
			return (int)(Math.floor(totalPrice * 0.04));
		} else if (user_grade.equals("B")) {
			return (int)(Math.floor(totalPrice * 0.03));
		} else {
			return (int)(Math.floor(totalPrice * 0.02));
		}
	}
}
