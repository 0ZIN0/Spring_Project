package com.ezen.smg.service.managerService;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.smg.common.CommonFunction;
import com.ezen.smg.common.Encryption_SH256;
import com.ezen.smg.common.Pagination;
import com.ezen.smg.dto.GameKeyDTO;
import com.ezen.smg.dto.Games;
import com.ezen.smg.dto.ManagersDTO;
import com.ezen.smg.dto.NoticeDTO;
import com.ezen.smg.dto.QnADTO;
import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.dto.chart.GenderDTO;
import com.ezen.smg.dto.chart.GenreDTO;
import com.ezen.smg.dto.chart.SalesDTO;
import com.ezen.smg.mapper.ChartMapper;
import com.ezen.smg.mapper.FAQmapper;
import com.ezen.smg.mapper.GameKeyMapper;
import com.ezen.smg.mapper.GamesMapper;
import com.ezen.smg.mapper.ManagerMapper;
import com.ezen.smg.mapper.NoticeMapper;
import com.ezen.smg.mapper.UsersMapper;

import lombok.extern.log4j.Log4j;

@PropertySource(value = "classpath:application.properties", encoding = "UTF-8")
@Log4j
@Service
public class ManagerServiceImp1 implements ManagerService {

	@Autowired
	ManagerMapper managerMapper;

	@Autowired
	NoticeMapper noticeMapper;

	@Autowired
	GamesMapper gamesMapper;
	
	@Autowired
	UsersMapper usersMapper;

	@Autowired
	ServletContext servletContext;

	@Value("${spring.banner_img.path}")
	private String absolutePath; 
	
	@Autowired
	GameKeyMapper gameKeyMapper;
	
	@Autowired
	ChartMapper chartMapper;
	
	@Autowired
	FAQmapper faQmapper;
	
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
	public List<Games> getGameListByGame_id(int currPage, String game_id) {
		int lastGame = currPage * pageNum;
		int firstGame = lastGame - 9;
		
		return gamesMapper.getGameListByGame_id(firstGame, lastGame, game_id);
	}

	/* admin_user 관련 서비스 */


	@Override
	public List<SmgUsersDTO> getUserListWithPagination(int page, int itemsPerPage) {
		int start = (page - 1) * itemsPerPage;
		int end = start + itemsPerPage;

		return usersMapper.getUserListForAdmin(start, end);
	}

	@Override
	public int getUserListTotalSize() {
		return usersMapper.getUsersTotalSize();
	}

	@Override
	public SmgUsersDTO getUserByUserNum(Integer userNum) {
		return usersMapper.getUserInfo(userNum);
	}
	
	@Override
	public int managerUpdateUserInfo(SmgUsersDTO user, String newPassword) {
	    String encPw = Encryption_SH256.encrypt(newPassword);
	    user.setUser_pw(encPw);  // 암호화된 비밀번호로 설정

	    return usersMapper.managerUpdateUserInfo(user);
	}

	@Override
	public int getGameListByGame_idSize(String game_id_str) {
		int game_id = Integer.parseInt(game_id_str);
		
		return gamesMapper.getGamesByIdSize(game_id);
	}

	@Override
	public List<Games> getGameListByGame_name(int currPage, String game_name) {
		int lastGame = currPage * pageNum;
		int firstGame = lastGame - 9;
		
		return gamesMapper.getGameListByName(firstGame, lastGame, game_name);
	}

	@Override
	public int getGameListByGame_nameSize(String game_name) {
		return gamesMapper.getGamesByName(game_name);
	}

	@Override
	public List<Games> getGameListByLayout(int currPage, String layout) {
		int lastGame = currPage * pageNum;
		int firstGame = lastGame - 9;
		
		return gamesMapper.getGameListByLayout(firstGame, lastGame, layout);
	}

	@Override
	public int getGameListByLayoutSize(String layout) {
		return gamesMapper.getGamesByLayout(layout);
	}
	
	@Override
	public Games getGameDetail(int game_id) {
		Games game = gamesMapper.getGame(game_id); 

		game.setDiscounted_price(CommonFunction.calDiscount(game.getGame_price(), game.getDiscount()));

		return game;
	}

	@Override
	public List<String[]> getPropList() {
		
		List<String[]> propList = new ArrayList<>();
		
		propList.add(genreArr);
		propList.add(editorArr);
		propList.add(platformArr);
		propList.add(layoutArr);
		propList.add(ratedArr);
		
		return propList;
	}

	@Override
	public int updateGame(Games game) {
		String editor = game.getEditor(); 
		String layout = game.getLayout();
		
		if(editor.equals("on")) game.setEditor(null); 
		if(layout.equals("on")) game.setLayout(null);	
		
		return gamesMapper.updateGame(game);
	}

	@Override
	public int updateBanner_img(int game_id, MultipartFile img_file) {
		
        String filename = img_file.getOriginalFilename();
        String ext = CommonFunction.extractExt(filename);
        
        String originUrl = gamesMapper.getBanner_imgUrl(game_id);
        String originFileName = CommonFunction.getFileNameWithoutExt(originUrl);  
        
        String newFileName = originFileName + ext;
        
        String DBSavePath = "resources/img/banner_img/" + newFileName; 
        String fullPath = absolutePath + "/" + newFileName;

        // 업데이트를 톰캣폴더로 바로 반영해주기 위한 경로
        String realPath = servletContext.getRealPath("/resources/img/banner_img/"); 
        String tempPath = realPath + newFileName;
        
        log.info("프로젝트 폴더 내 저장 경로: " + fullPath);
        log.info("톰캣 서버 내 저장 경로: " + tempPath);
        
        try {
			// DB에 저장된 원래 파일 이름 추출
			String existingFileName =  CommonFunction.getFileName(originUrl);
			File existingFile = new File(absolutePath + "/" + existingFileName);
			File serverFile = new File(realPath + existingFileName); // 톰캣에 있을 임시 파일
			
			// 파일이 존재할 경우 삭제
			if(existingFile.exists()) {
				existingFile.delete();
				log.info("기존 프로필 이미지 삭제됨 : " + existingFile);
			}
			if(serverFile.exists()) {
				serverFile.delete();
				log.info("톰캣서버의 기존 프로필 이미지 캐시 삭제됨 : " + serverFile);
			}
			
        	File file = new File(tempPath);
        	file.createNewFile();
        	
        	FileOutputStream fos = new FileOutputStream(file);
        	fos.write(img_file.getBytes());
        	fos.close();
        	
			img_file.transferTo(new File(fullPath));
			
			return gamesMapper.updateBanner_img(game_id, DBSavePath);
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return 0;
		} catch (IOException e) {
			e.printStackTrace();
			return 0;
		}
        
	}

	@Override
	public int insertNewGame(Games game, String file_name, MultipartFile img_file) {
		
		int game_id = gamesMapper.getLastGameNum() + 1;
		game.setGame_id(game_id);

		String fileName = file_name + CommonFunction.extractExt(img_file.getOriginalFilename());
		String banner_url = "resources/img/banner_img/" + fileName;
		
		game.setBanner_img_url(banner_url);
		
		int insert = gamesMapper.insertNewGame(game); 
		
		if(insert == 1) {
			
			String fullPath = absolutePath + "/" + fileName;
			
			// 업데이트를 톰캣폴더로 바로 반영해주기 위한 경로
			String realPath = servletContext.getRealPath("/resources/img/banner_img/"); 
			String tempPath = realPath + fileName;
			
			log.info("프로젝트 폴더 내 저장 경로: " + fullPath);
			log.info("톰캣 서버 내 저장 경로: " + tempPath);
			
			try {
				File file = new File(tempPath);
				
				// 중복명이 있을 경우
				if(file.exists()) {
					fileName = file_name + 1 + CommonFunction.extractExt(img_file.getOriginalFilename());
					tempPath = realPath + fileName;
					file = new File(tempPath);
					fullPath = absolutePath + "/" + fileName;
				}
				
				file.createNewFile();
				
				FileOutputStream fos = new FileOutputStream(file);
				fos.write(img_file.getBytes());
				fos.close();
				
				img_file.transferTo(new File(fullPath));
				
				return insert;
			} catch (IllegalStateException e) {
				e.printStackTrace();
				return 0;
			} catch (IOException e) {
				e.printStackTrace();
				return 0;
			}
			
		};
		
		return insert;
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

	@Override
	public List<SalesDTO> getSalesData(String tag, int year) {
		if(tag.equals("weekly")) {
			
			return chartMapper.getWeeklySales();
		} else if (tag.equals("month")) {
			
			return chartMapper.getMonthSales(2023);
		} else if(tag.equals("year")) {
			
			return chartMapper.getYearsSales();
		} else {
			
			return chartMapper.getWeeklySales();
		}
	}

	public List<QnADTO> getQnAList(int currPage) {
		int lastGame = currPage * pageNum;
		int firstGame = lastGame - 9;
		
		return faQmapper.getFAQList(firstGame, lastGame);
	}

	@Override
	public List<GenderDTO> getGenderData() {
			
		return chartMapper.getGenderRate();
	}

	@Override
	public List<GenreDTO> getGenreData() {

		return chartMapper.getGenreRate();
	}

	@Override
	public List<GenreDTO> getEditorSales() {
		
		return chartMapper.getEditorSales();
	}
	
}
