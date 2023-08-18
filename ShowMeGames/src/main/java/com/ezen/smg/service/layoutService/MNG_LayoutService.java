package com.ezen.smg.service.layoutService;

import org.springframework.web.multipart.MultipartFile;

import com.ezen.smg.dto.layout.LayoutDefaultDTO;
import com.ezen.smg.dto.layout.LayoutHGTDTO;
import com.ezen.smg.dto.layout.LayoutKCWDTO;

public interface MNG_LayoutService {

	LayoutDefaultDTO getLayoutDefault(Integer game_id);
	int insertLayoutDefault(LayoutDefaultDTO dto);
	int updateLayoutDefault(LayoutDefaultDTO dto);
	
	LayoutHGTDTO getLayoutHGT(Integer game_id);
	int insertLayoutHGT(LayoutHGTDTO dto);
	int updateLayoutHGT(LayoutHGTDTO dto);
	
	LayoutKCWDTO getLayoutKCW(Integer game_id);
	
	/**
	 * img_file 업로드 메서드
	 * @param game_id 관련 게임
	 * @param type layout 타입
	 * @param img_file 이미지파일
	 * @param img_num 파일 생성 시 몇 번 째 사진인지 정해줌. game_id_(img_num).ext 형태. 순서가 정해지므로 매우 중요함.
	 * @return 성공시 1 반환
	 */
	int updateImg_url(Integer game_id, LayoutType type, MultipartFile img_file, int img_num);
	int getLayoutCheck(Integer game_id, String layout);
}
