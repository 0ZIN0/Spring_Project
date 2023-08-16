package com.ezen.smg.service.managerService;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.smg.common.CommonFunction;
import com.ezen.smg.dto.layout.LayoutDefaultDTO;
import com.ezen.smg.mapper.LayoutMapper;

@PropertySource(value = "classpath:application.properties", encoding = "UTF-8")
@Service
public class LayoutServiceImp1 implements LayoutService {

	@Autowired
	LayoutMapper mapper;

	@Value("${spring.layout_img.path}")
	String absolutePath;
	
	@Autowired
	ServletContext servletContext;
	
	@Override
	public int insertLayoutDefault(LayoutDefaultDTO dto) {
		
		dto.setGame_info_title(CommonFunction.handleCrlfToBr(dto.getGame_info_title()));
		dto.setGame_info_content(CommonFunction.handleCrlfToBr(dto.getGame_info_content()));
		dto.setGame_story(CommonFunction.handleCrlfToBr(dto.getGame_story()));
		
		return mapper.insertLayoutDefault(dto);
	}

	@Override
	public int updateLayoutDefault(LayoutDefaultDTO dto) {
		
		dto.setGame_info_title(CommonFunction.handleCrlfToBr(dto.getGame_info_title()));
		dto.setGame_info_content(CommonFunction.handleCrlfToBr(dto.getGame_info_content()));
		dto.setGame_story(CommonFunction.handleCrlfToBr(dto.getGame_story()));
		
		return mapper.updateLayoutDefault(dto);
	}

	@Override
	public LayoutDefaultDTO getLayoutDefault(Integer game_id) {
		LayoutDefaultDTO dto = mapper.getLayoutDefault(game_id); 
		
		dto.setGame_info_title(CommonFunction.handleBrToCrlf(dto.getGame_info_title()));
		dto.setGame_info_content(CommonFunction.handleBrToCrlf(dto.getGame_info_content()));
		dto.setGame_story(CommonFunction.handleBrToCrlf(dto.getGame_story()));
		
		return dto;
	}

	@Override
	public int updateImg_url_Default(Integer game_id, LayoutType type, MultipartFile img_file) {
        String filename = img_file.getOriginalFilename();
        String ext = CommonFunction.extractExt(filename);
        
        String newFileName = game_id + ext;
        
        String fullPath = absolutePath + "/default/" + newFileName;
        String realPath = servletContext.getRealPath("/resources/img/games/layout/default/"); 

        // 업데이트를 톰캣폴더로 바로 반영해주기 위한 경로
        String tempPath = realPath + newFileName;
        
        try {
			File serverFile = new File(tempPath); // 톰캣에 있을 임시 파일
        	
			if(!serverFile.exists()) {
				serverFile.createNewFile();
			}
        	
        	FileOutputStream fos = new FileOutputStream(serverFile);
        	fos.write(img_file.getBytes());
        	fos.close();
        	
			img_file.transferTo(new File(fullPath));
			
			return mapper.updateImg_url(game_id, newFileName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return 0;
		} catch (IOException e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int getLayoutCheck(Integer game_id, String layout) {
		switch(layout != null ? layout: "NULL") {
			case "LRA":
				return 0;
			case "JYM":
				return 0;
			case "HGT":
				return 0;
			case "KCW":
				return 0;
			case "SJH":
				return 0;
			case "BGC":
				return 0;
			default:
				return mapper.getLayoutCheck_default(game_id);
		}
	}
}
