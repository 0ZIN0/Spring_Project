package com.ezen.smg.service.mypageService;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.smg.common.CommonFunction;
import com.ezen.smg.dto.Inquiries;
import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.mapper.InquiriesMapper;
import com.ezen.smg.mapper.UsersMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@PropertySource(value = "classpath:application.properties", encoding = "UTF-8")
@Service
public class MyPageServiceImp1 implements MyPageService {
	
	@Value("${spring.user_profile.path}")
	private String absolutePath; 
	
	@Autowired
	InquiriesMapper inquiriesmapper;
	
	@Autowired
	UsersMapper userMapper;
	
	@Autowired
	ServletContext servletContext;
	
	@Override
	public List<Inquiries> getContent(int user_num) {
		return inquiriesmapper.getContent(user_num);
	}

	@Override
	public SmgUsersDTO getUserInfo(int user_num) {
		return userMapper.getUserInfo(user_num);
	}

	@Override
	public int updateNick_name(String username, int user_num) {
		return userMapper.updateNick_name(username, user_num);
	}
			
	@Override
	public int updateProfile_img(int user_num, MultipartFile img_file) {
		
        String filename = img_file.getOriginalFilename();
        String newFileName = CommonFunction.UUIDRandomCreate() + CommonFunction.extractExt(filename); 
        
        String DBSavePath = "/resources/img/user_profile/" + newFileName; 
        String fullPath = absolutePath + "/" + newFileName;

        // 업데이트를 톰캣폴더로 바로 반영해주기 위한 경로
        String realPath = servletContext.getRealPath("/resources/img/user_profile/"); 
        String tempPath = realPath + newFileName;
        
        log.info("프로젝트 폴더 내 저장 경로: " + realPath);
        log.info("톰캣 서버 내 저장 경로: " + tempPath);
        
        try {
        	File file = new File(tempPath);
        	file.createNewFile();
        	
        	FileOutputStream fos = new FileOutputStream(file);
        	fos.write(img_file.getBytes());
        	fos.close();
        	
			img_file.transferTo(new File(fullPath));
			
			// DB에 저장된 원래 파일 이름 추출
			String existingFileName =  CommonFunction.getFileName(userMapper.getProfile_img_url(user_num));
			File existingFile = new File(absolutePath + "/" + existingFileName);
			File serverFile = new File(realPath + existingFileName); // 톰캣에 있을 임시 파일
			
			// 파일이 존재할 경우 삭제
			if(existingFile.exists()) {
				existingFile.delete();
				log.info("기존 프로필 이미지 삭제됨");
			}
			if(serverFile.exists()) {
				serverFile.delete();
				log.info("톰캣서버의 기존 프로필 이미지 캐시 삭제됨");
			}
			
			return userMapper.updateProfile_img(user_num, DBSavePath);
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return 0;
		} catch (IOException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
}
