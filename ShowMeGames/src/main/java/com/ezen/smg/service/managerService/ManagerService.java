package com.ezen.smg.service.managerService;

import java.util.List;

import com.ezen.smg.common.Pagination;
import com.ezen.smg.dto.GameKeyDTO;
import com.ezen.smg.dto.Games;
import com.ezen.smg.dto.Inquiries;
import com.ezen.smg.dto.ManagersDTO;
import com.ezen.smg.dto.NoticeDTO;

public interface ManagerService {
	
	ManagersDTO confirmManager(String mng_id, String mng_pw);
	ManagersDTO getManager(Integer mng_num);

	// 페이징을 위한 서비스
	Pagination getPagination(int currPage, int totalSize);
	
	/** admin_game 관련 서비스 */
	List<Games> getGameList(int currPage);
	int getGameListTotalSize();

	Games getGameDetail(int game_id);

	/** admin_notice 관련 서비스 */
	List<NoticeDTO> getNoticeList(int currPage);

	
	/*게임 키 관리*/
	List<GameKeyDTO> getKeys(int page);
	List<GameKeyDTO> getSearchResults(String search, String search_tag, int page);
	int[] ModifyKey(String key_id, String nick_name, int key_num);
	
	/*admin_inquiry 관련 서비스*/
	List<Inquiries> getContent(int currPage);	
	int getTotalNum();
}
