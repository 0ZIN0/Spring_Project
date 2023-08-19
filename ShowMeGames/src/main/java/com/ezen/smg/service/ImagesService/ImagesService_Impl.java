package com.ezen.smg.service.ImagesService;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.smg.common.CommonFunction;
import com.ezen.smg.dto.Images;
import com.ezen.smg.mapper.ImagesMapper;

@PropertySource(value = "classpath:application.properties", encoding = "UTF-8")
@Service
public class ImagesService_Impl implements ImagesService {

	@Autowired
	ImagesMapper imagesMapper;

	@Autowired
	ServletContext servletContext;
	
	@Value("${spring.img.path}")
	private String absolutePath;
	
	@Override
	public List<Images> getNomalImages(int game_id, int start, int end) {
		List<Images> images = imagesMapper.getImages(game_id, start, end);

		return images;
	}

	@Override
	public Images getSubBanner(int game_id) {
		return imagesMapper.getSubBanner(game_id);
	}

	@Override
	public List<Images> getSlideImages(int game_id) {
		
		List<Images> images = imagesMapper.getImages(game_id, 1, 5);
		List<Images> newList = new ArrayList<>();
		
		for(int i = 0; i <= 4; ++i) {
			
			boolean chk = false;
			for(Images img : images) {
				String url = img.getImage_url();
				int index = url.lastIndexOf(".") - 1;
				
				char verifyImg = url.charAt(index);
				
				if(i == verifyImg - '0') {
					newList.add(img);
					chk = true;
					break;
				}
			}
			
			if(!chk) {
				Images nullImg = new Images();
				nullImg.setImage_id(0);
				newList.add(nullImg);
			}
		}
		
		return newList;
	}

	@Override
	public int updateSlideImage(Integer game_id, MultipartFile img_file, int img_num) {
		int result = 0;
		
		Images img = imagesMapper.getSpecificImg(game_id, img_num);
		
		// 이미지 insert
		if(img == null) {
			img = new Images();
			
			img.setGame_id(game_id);
			
			String ext = CommonFunction.extractExt(img_file.getOriginalFilename());
			
			if(img_num == 0) {
				img.setImage_name(game_id + "_main_banner");
			} else {
				img.setImage_name(game_id + "_" + img_num);
			}
			
			String url = "/newGame/" + game_id + File.separator + "img" + img_num + ext;
			img.setImage_url(url);
			
			result = imagesMapper.insertImage(img);
			
			if(result == 1) {
				return handleImgFile(url, img_file);
			}
		// 이미지 update
		} else {
			String url = img.getImage_url();
			return handleImgFile(url, img_file);
		}
		
		return result;
	}

	@Override
	public int subBannerUpdate(Integer game_id, MultipartFile sub_img_file) {
		int result = 0;
		
		Images img = imagesMapper.getSubBanner(game_id);
		
		// 이미지 insert
		if(img == null) {
			img = new Images();
			
			img.setGame_id(game_id);
			
			String ext = CommonFunction.extractExt(sub_img_file.getOriginalFilename());
			
			img.setImage_name(game_id + "_sub_banner");
			
			String url = "/newGame/" + game_id + File.separator + "sub_banner" + ext;
			img.setImage_url(url);
			
			result = imagesMapper.insertImage(img);
			
			if(result == 1) {
				return handleImgFile(url, sub_img_file);
			}
		// 이미지 update
		} else {
			String url = img.getImage_url();
			return handleImgFile(url, sub_img_file);
		}
		
		return result;
	}
	
	@Override
	public int handleImgFile(String url, MultipartFile img_file) {
		// 절대경로
		String fullPath = absolutePath + "/games/slider" + url;
		
		// 업데이트를 톰캣폴더로 바로 반영해주기 위한 경로
		String tempPath = servletContext.getRealPath("/resources/img/games/slider") + url;
		
		try {
			File file = new File(tempPath);
			File parentDir = file.getParentFile(); // 상위 디렉토리가 없을 경우를 대비
			
			if(!parentDir.exists()) parentDir.mkdirs(); 
			if(!file.exists()) file.createNewFile();
			
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(img_file.getBytes());
			fos.close();
			
			File realFile = new File(fullPath);
			File parentRealDir = realFile.getParentFile();
			
			if(!parentRealDir.exists()) parentRealDir.mkdirs();
			
			img_file.transferTo(realFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return 0;
		} catch (IOException e) {
			e.printStackTrace();
			return 0;
		}
		
		return 1;
	}

}
