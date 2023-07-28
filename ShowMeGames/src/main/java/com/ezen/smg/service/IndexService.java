package com.ezen.smg.service;

import java.util.List;

import com.ezen.smg.dto.Games;

public interface IndexService {
	
	List<Games> getLatestGameList();
	List<Games> getEditorRecmdList();
	List<Games> getLargestDiscountList();
	List<Games> getCuratorRecmdList();
	
}