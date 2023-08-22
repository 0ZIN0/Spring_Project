package com.ezen.smg.service.ImagesService;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ezen.smg.dto.Images;

public interface ImagesService {
	
	List<Images> getNomalImages(int game_id, int start, int end);
	
	List<Images> getSlideImages(int game_id);
	
	Images getSubBanner(int game_id);

	int updateSlideImage(Integer game_id, MultipartFile img_file, int img_num);
	
	int subBannerUpdate(Integer game_id, MultipartFile sub_img_file);
	
	int handleImgFile(String url, MultipartFile img_file);
}
