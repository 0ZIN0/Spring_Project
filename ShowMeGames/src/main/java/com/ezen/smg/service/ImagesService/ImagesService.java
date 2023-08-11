package com.ezen.smg.service.ImagesService;

import java.util.List;

import com.ezen.smg.dto.Images;

public interface ImagesService {
	
	List<Images> getNomalImages(int game_id, int start, int end);
	
	Images getSubBanner(int game_id);
}
