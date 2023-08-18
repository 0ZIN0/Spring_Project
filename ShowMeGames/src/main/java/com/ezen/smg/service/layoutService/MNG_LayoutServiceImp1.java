package com.ezen.smg.service.layoutService;

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
import com.ezen.smg.dto.layout.LayoutHGTDTO;
import com.ezen.smg.mapper.LayoutMapper;

import lombok.extern.log4j.Log4j;

@PropertySource(value = "classpath:application.properties", encoding = "UTF-8")
@Service
@Log4j
public class MNG_LayoutServiceImp1 implements MNG_LayoutService {

	@Autowired
	LayoutMapper mapper;

	@Value("${spring.layout_img.path}")
	String absolutePath;
	
	@Autowired
	ServletContext servletContext;
	
	@Override
	public int insertLayoutDefault(LayoutDefaultDTO dto) {
		
		dto = LayoutDefaultDTO.handleCrlfToBr(dto); 
		
		return mapper.insertLayoutDefault(dto);
	}

	@Override
	public int updateLayoutDefault(LayoutDefaultDTO dto) {
		
		dto = LayoutDefaultDTO.handleCrlfToBr(dto);
		
		return mapper.updateLayoutDefault(dto);
	}

	@Override
	public LayoutDefaultDTO getLayoutDefault(Integer game_id) {
		LayoutDefaultDTO dto = mapper.getLayoutDefault(game_id); 

		if(dto == null) return dto;

		dto = LayoutDefaultDTO.handleBrToCrlf(dto);
		
		return dto;
	}

	@Override
	public LayoutHGTDTO getLayoutHGT(Integer game_id) {
 		LayoutHGTDTO dto = mapper.getLayoutHGT(game_id); 
		
 		if(dto == null) return dto;
		
		return LayoutHGTDTO.handleBrToCrlf(dto);
	}

	@Override
	public int insertLayoutHGT(LayoutHGTDTO dto) {
		
		dto = LayoutHGTDTO.handleCrlfToBr(dto);
		
		return mapper.insertLayoutHGT(dto);
	}

	@Override
	public int updateLayoutHGT(LayoutHGTDTO dto) {
		
		dto = LayoutHGTDTO.handleCrlfToBr(dto);
		
		return mapper.updateLayoutHGT(dto);
	}

	@Override
	public int updateImg_url(Integer game_id, LayoutType type, MultipartFile img_file, int img_num) {
        String filename = img_file.getOriginalFilename();
        String ext = CommonFunction.extractExt(filename);
        
        String newFileName;
        
        String fullPath;
        String realPath;
        
        switch(type) {
        	case HGT:
        		newFileName = game_id + File.separator + game_id + "_" + img_num + ext;
        		fullPath = absolutePath + "/hgt/" + newFileName;
        		realPath = servletContext.getRealPath("/resources/img/games/layout/hgt/");
        		break;
        	default:
        		newFileName = game_id + ext;
        		fullPath = absolutePath + "/default/" + newFileName;
        		realPath = servletContext.getRealPath("/resources/img/games/layout/default/");
        }

        // 업데이트를 톰캣폴더로 바로 반영해주기 위한 경로
        String tempPath = realPath + newFileName;
        
        try {
			File serverFile = new File(tempPath); // 톰캣에 있을 임시 파일
        	File fullPathFile = new File(fullPath); // 실제 경로 파일 
        
        	File serverFileDir = serverFile.getParentFile(); 
        	log.info(serverFileDir);
        	File fullPathFileDir = fullPathFile.getParentFile();
        	log.info(fullPathFileDir);
        	
    		serverFileDir.mkdirs();
    		
			if(!serverFile.exists()) {
				serverFile.createNewFile();
			}
        	
        	FileOutputStream fos = new FileOutputStream(serverFile);
        	fos.write(img_file.getBytes());
        	fos.close();
        	
    		fullPathFileDir.mkdirs();
    		
			img_file.transferTo(fullPathFile);
			
	        switch(type) {
        		case HGT:
        			return mapper.updateImg_url_hgt(game_id, newFileName, img_num);
    			default:
    				return mapper.updateImg_url(game_id, newFileName);
	        }
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
				return mapper.getLayoutCheck_hgt(game_id);
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
