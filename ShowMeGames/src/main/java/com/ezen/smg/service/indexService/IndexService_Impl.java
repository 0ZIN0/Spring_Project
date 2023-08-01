package com.ezen.smg.service.indexService;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.common.CommonFunction;
import com.ezen.smg.dto.Games;
import com.ezen.smg.mapper.GamesMapper;

@Service
public class IndexService_Impl implements IndexService {

	@Autowired
	GamesMapper mapper;

	List<String> editors;
	
	@Override
	public List<Games> getLatestGameList() {
		return mapper.getLatestGameList();
	}

	@Override
	public List<Games> getEditorRecmdList() {
		editors = mapper.getEditors();
		
		Collections.shuffle(editors);
		
		List<Games> result = mapper.getEditorRecmdList(editors.get(0)); 
		result.addAll(mapper.getEditorRecmdList(editors.get(1)));
		
		for(Games game : result) {
			game.setDiscounted_price(CommonFunction.calDiscount(game.getGame_price(), game.getDiscount()));
		}
		
		return result;
	}

	@Override
	public List<Games> getLargestDiscountList() {
		
		List<Games> result = mapper.getLargestDiscountList();
		
		for(Games game : result) {
			game.setDiscounted_price(CommonFunction.calDiscount(game.getGame_price(), game.getDiscount()));
		}
		
		return result;
	}

	@Override
	public List<Games> getCuratorRecmdList() {
		
		List<Games> result = mapper.getEditorRecmdList("curator");
		
		for(Games game : result) {
			game.setDiscounted_price(CommonFunction.calDiscount(game.getGame_price(), game.getDiscount()));
		}
		
		Collections.shuffle(result);
		
		return result.subList(0, 5);
	}

	@Override
	public List<Games> getHotGameList() {

		List<Games> list = new ArrayList<>();
		
		// 오버쿡드
		list.add(mapper.getGame(1015));
		// 마비노기
		list.add(mapper.getGame(1021));
		
		for(Games game : list) {
			game.setDiscounted_price(CommonFunction.calDiscount(game.getGame_price(), game.getDiscount()));
		}
		
		return list;
	}

}
