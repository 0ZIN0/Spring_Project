package com.ezen.smg.service.layoutService;

import org.springframework.web.multipart.MultipartFile;

import com.ezen.smg.dto.layout.LayoutDefaultDTO;

public interface MNG_LayoutService {

	int insertLayoutDefault(LayoutDefaultDTO dto);
	LayoutDefaultDTO getLayoutDefault(Integer game_id);
	int updateLayoutDefault(LayoutDefaultDTO dto);
	int updateImg_url_Default(Integer game_id, LayoutType type, MultipartFile img_file);
	int getLayoutCheck(Integer game_id, String layout);
	
}
