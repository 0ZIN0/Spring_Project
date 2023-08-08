package com.ezen.smg.service.managerService;

import java.util.List;

import com.ezen.smg.common.Pagination;
import com.ezen.smg.dto.Games;
import com.ezen.smg.dto.ManagersDTO;

public interface ManagerService {
	
	ManagersDTO confirmManager(String mng_id, String mng_pw);
	ManagersDTO getManager(Integer mng_num);

	// 게시판식 페이지 계산 기능
	Pagination getPagination(int currPage, int totalSize);
	
	/** admin_game 관련 서비스 */
	List<Games> getGameList(int currPage);
	int getGameListTotalSize();
	
}
