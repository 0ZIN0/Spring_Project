package com.ezen.smg.service.managerService;

import com.ezen.smg.dto.ManagersDTO;

public interface ManagerService {

	ManagersDTO confirmManager(String mng_id, String mng_pw);
	
	ManagersDTO getManager(Integer mng_num);
	
}
