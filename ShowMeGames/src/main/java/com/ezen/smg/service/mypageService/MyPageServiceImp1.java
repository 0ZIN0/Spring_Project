package com.ezen.smg.service.mypageService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

<<<<<<< Updated upstream
=======
import com.ezen.smg.common.CommonFunction;
import com.ezen.smg.common.Encryption_SH256;
>>>>>>> Stashed changes
import com.ezen.smg.common.Pagination;
import com.ezen.smg.dto.Inquiries;
import com.ezen.smg.mapper.InquiriesMapper;

@Service
public class MyPageServiceImp1 implements MyPageService{
	
	@Autowired
	InquiriesMapper inquiriesmapper;
	
<<<<<<< Updated upstream
=======
	@Autowired
	UsersMapper userMapper;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	GameKeyMapper gameKeyMapper;
>>>>>>> Stashed changes
	private int pageNum = 9;
	
	@Override
	public List<Inquiries> getContent(int user_num) {
			
		return inquiriesmapper.getContent(user_num);
	}
	
	@Override
	public Pagination getPagination(int currPage, int totalSize) {
		Pagination paging = new Pagination(totalSize, pageNum);
		
		paging.setCurrPage(currPage);
		
		return paging;
	}

	@Override
	public int getTotalSize(int user_num) {
		
		return inquiriesmapper.getTotalNum(user_num);
	}
<<<<<<< Updated upstream
=======

	@Override
	public int updateUserPw(int user_num, String user_pw) {
		String encPw = Encryption_SH256.encrypt(user_pw);
		return userMapper.updateUserPw(user_num, encPw);
	}

	@Override
	public List<MyGameListDTO> getMyGameKeyList(Integer user_num) {
		List<MyGameListDTO> result = gameKeyMapper.getUserGameKeyList(user_num);
		for(MyGameListDTO game : result) {
			if(game.getOrder_status().equals("paid")) {
				game.setOrder_status("결제완료");
			};
		}
		return result;
	}
	
	
	@Override
	public Pagination getPagination(int currPage, int totalSize) {
		Pagination paging = new Pagination(totalSize, pageNum);
		
		paging.setCurrPage(currPage);
		
		return paging;
	}

	@Override
	public int getTotalSize(int user_num) {
		
		return inquiriesmapper.getTotalNum(user_num);
	}
>>>>>>> Stashed changes
}
