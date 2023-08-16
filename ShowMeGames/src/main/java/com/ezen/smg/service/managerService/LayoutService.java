package com.ezen.smg.service.managerService;

import org.springframework.web.multipart.MultipartFile;

import com.ezen.smg.dto.layout.LayoutDefaultDTO;

public interface LayoutService {

	int insertLayoutDefault(LayoutDefaultDTO dto);
	LayoutDefaultDTO getLayoutDefault(Integer game_id);
	int updateLayoutDefault(LayoutDefaultDTO dto);
	int updateImg_url_Default(Integer game_id, LayoutType type, MultipartFile img_file);
	int getLayoutCheck(Integer game_id, String layout);
	
}
