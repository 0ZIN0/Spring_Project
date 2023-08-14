package com.ezen.smg.service.managerService;

import java.util.List;

import org.springframework.context.annotation.PropertySource;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.smg.common.Pagination;
import com.ezen.smg.dto.GameKeyDTO;
import com.ezen.smg.dto.Games;
import com.ezen.smg.dto.ManagersDTO;
import com.ezen.smg.dto.NoticeDTO;
import com.ezen.smg.dto.QnADTO;
import com.ezen.smg.dto.chart.GenderDTO;
import com.ezen.smg.dto.chart.GenreDTO;
import com.ezen.smg.dto.chart.SalesDTO;

@PropertySource(value = "classpath:application.properties", encoding = "UTF-8")
public interface ManagerService {

	static String[] genreArr = {"RPG", "FPS", "슈팅", "전략", "호러", "인디", "레이싱", "퍼즐", "스포츠", "시뮬레이션"};
	static String[] editorArr = {"curator", "jaehun", "gicheol", "roa", "gitae", "chanwoo", "yeoungmin"};
	static String[] platformArr = {"PC", "WiiU", "Mobile", "Xbox", "Playstation", "NintendoSwitch"};
	static String[] layoutArr = {"LRA", "JYM", "HGT", "KCW", "SJH", "BGC"};
	static String[]	ratedArr = {"0", "12", "15", "18", "ageNone", "cr", "dr", "fe", "ga", "se", "vi", "wr"}; 
	
	static int pageNum = 10;
	
	ManagersDTO confirmManager(String mng_id, String mng_pw);
	ManagersDTO getManager(Integer mng_num);

	// 페이징을 위한 서비스
	Pagination getPagination(int currPage, int totalSize);
	
	/** admin_game 관련 서비스 */
	List<Games> getGameList(int currPage);
	int getGameListTotalSize();

	Games getGameDetail(int game_id);
	List<String[]> getPropList();
	
	int updateGame(Games game);
	int updateBanner_img(int game_id, MultipartFile img_file);

	/** admin_notice 관련 서비스 */
	List<NoticeDTO> getNoticeList(int currPage);
	
	/** admin_faq 관련 서비스 */
	List<QnADTO> getQnAList(int currPage);
	
	/*게임 키 관리*/
	List<GameKeyDTO> getKeys(int page);
	List<GameKeyDTO> getSearchResults(String search, String search_tag, int page);
	int[] ModifyKey(String key_id, String nick_name, int key_num);
	
	/*chart*/
	List<SalesDTO> getSalesData(String tag, int year);
	List<GenderDTO> getGenderData();
	List<GenreDTO> getGenreData();
	List<GenreDTO> getEditorSales();
}
