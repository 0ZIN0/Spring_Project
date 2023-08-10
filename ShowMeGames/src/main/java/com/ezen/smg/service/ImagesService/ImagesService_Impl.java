package com.ezen.smg.service.ImagesService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.Images;
import com.ezen.smg.mapper.ImagesMapper;

@Service
public class ImagesService_Impl implements ImagesService {

	@Autowired
	ImagesMapper imagesMapper;
	
	@Override
	public List<Images> getNomalImages(int game_id, int start, int end) {
		List<Images> images = imagesMapper.getImages(game_id, start, end);

		return images;
	}

	@Override
	public Images getSubBanner(int game_id) {
		
		return imagesMapper.getSubBanner(game_id);
	}
}
