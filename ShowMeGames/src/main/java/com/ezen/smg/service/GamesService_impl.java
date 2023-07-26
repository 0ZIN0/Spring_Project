package com.ezen.smg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.Games;
import com.ezen.smg.mapper.GamesMapper;

@Service
public class GamesService_impl implements GamesService{
	
	@Autowired
	GamesMapper gamesMapper;
	
	@Override
	public List<Games> getAllGames() {
		
		return gamesMapper.getAllGames();
	}

}
