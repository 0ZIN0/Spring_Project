package com.ezen.smg.service.managerService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.ManagersDTO;
import com.ezen.smg.mapper.ManagerMapper;

@Service
public class ManagerServiceImp1 implements ManagerService {

	@Autowired
	ManagerMapper managerMapper;

	/**
	 *	관리자 정보가 있고 비밀번호가 일치하면 해당 관리자 정보를 return함. 그 외엔 null 리턴.
	 */
	@Override
	public ManagersDTO confirmManager(String mng_id, String mng_pw) {
		
		ManagersDTO manager = managerMapper.getMangerById(mng_id);
		
		if(!mng_pw.equals(manager.getMng_pw())) return null; 
		
		return manager;
	}

	@Override
	public ManagersDTO getManager(Integer mng_num) {
		return managerMapper.getManager(mng_num);
	}

}
