package com.ezen.smg.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.common.CommonFunction;
import com.ezen.smg.dto.Games;
import com.ezen.smg.mapper.IndexMapper;

@Service
public class IndexService_Impl implements IndexService {

	@Autowired
	IndexMapper mapper;

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
		
		return result;
	}

}
