package com.ezen.smg.service.managerService;

import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.common.CommonFunction;
import com.ezen.smg.common.Pagination;
import com.ezen.smg.dto.GameKeyDTO;
import com.ezen.smg.dto.Games;
import com.ezen.smg.dto.ManagersDTO;
import com.ezen.smg.dto.NoticeDTO;
import com.ezen.smg.mapper.GameKeyMapper;
import com.ezen.smg.mapper.GamesMapper;
import com.ezen.smg.mapper.ManagerMapper;
import com.ezen.smg.mapper.NoticeMapper;

@Service
public class ManagerServiceImp1 implements ManagerService {

	@Autowired
	ManagerMapper managerMapper;

	@Autowired
	NoticeMapper noticeMapper;

	@Autowired
	GamesMapper gamesMapper;
	
	@Autowired
	GameKeyMapper gameKeyMapper;
	
	private int pageNum = 10;
	
	/**
	 *	관리자 정보가 있고 비밀번호가 일치하면 해당 관리자 정보를 return함. 그 외엔 null 리턴.
	 */
	@Override
	public ManagersDTO confirmManager(String mng_id, String mng_pw) {
		
		if(mng_id == null || mng_pw == null) return null;
		
		ManagersDTO manager = managerMapper.getMangerById(mng_id);
		
		if(!mng_pw.equals(manager.getMng_pw())) return null; 
		
		return manager;
	}

	@Override
	public ManagersDTO getManager(Integer mng_num) {
		return managerMapper.getManager(mng_num);
	}

	@Override
	public Pagination getPagination(int currPage, int totalSize) {
		Pagination paging = new Pagination(totalSize, pageNum);
		
		paging.setCurrPage(currPage);
		
		return paging;
	}

	/** admin_game 관련 서비스 */
	@Override
	public List<Games> getGameList(int currPage) {
		int lastGame = currPage * pageNum;
		int firstGame = lastGame - 9;
		
		return gamesMapper.getGameListForAdmin(firstGame, lastGame);
	}

	@Override
	public int getGameListTotalSize() {
		return gamesMapper.getGamesTotalSize();
	}

	@Override
	public Games getGameDetail(int game_id) {
		Games game = gamesMapper.getGame(game_id); 
		
		game.setDiscounted_price(CommonFunction.calDiscount(game.getGame_price(), game.getDiscount()));
		
		return game;
	}

	public List<GameKeyDTO> getKeys(int page) {
		int scope = 30;
		int end = scope * page;
		int begin = end - scope + 1;
		return gameKeyMapper.getKeys(begin, end);
	}

	@Override
	public List<GameKeyDTO> getSearchResults(String search, String search_tag, int page) {
		int scope = 30;
		int end = scope * page;
		int begin = end - scope + 1;
		return gameKeyMapper.getSearchResults(search, search_tag, begin, end);
	}

	@Override
	public int[] ModifyKey(String key_id, String nick_name, int key_num) {
		int[] results = new int[2];
		int result1 = 1;
		int result2 = 0;
				
		if(nick_name != null && !nick_name.isEmpty()) {
			result1 = gameKeyMapper.modifyKeyAccount(nick_name, key_num);			
		}
		
		String pattern = "\\w{4}-\\w{4}-\\w{4}-\\w{4}";
		boolean result = Pattern.matches(pattern, key_id);
		if(result) {
			result2 = gameKeyMapper.modifyKeyId(key_id, key_num);			
		}
		//result1 = nick_name
		//result2 = key_id
		results[0] = result1;
		results[1] = result2;
		return results;
	}

	@Override
	public List<NoticeDTO> getNoticeList(int currPage) {
		int lastGame = currPage * pageNum;
		int firstGame = lastGame - 9;
		
		return noticeMapper.getNotices(firstGame, lastGame);
	}
}
