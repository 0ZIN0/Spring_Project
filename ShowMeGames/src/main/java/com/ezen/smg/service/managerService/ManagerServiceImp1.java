package com.ezen.smg.service.managerService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.common.Pagination;
import com.ezen.smg.dto.Games;
import com.ezen.smg.dto.ManagersDTO;
import com.ezen.smg.mapper.GamesMapper;
import com.ezen.smg.mapper.ManagerMapper;

@Service
public class ManagerServiceImp1 implements ManagerService {

	@Autowired
	ManagerMapper managerMapper;

	@Autowired
	GamesMapper gamesMapper;
	
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

	/**  */
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

}
