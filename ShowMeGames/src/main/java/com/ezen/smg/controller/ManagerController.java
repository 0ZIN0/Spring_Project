package com.ezen.smg.controller;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.smg.dto.GameKeyDTO;
import com.ezen.smg.dto.GameSpecificationsDTO;
import com.ezen.smg.dto.Games;
import com.ezen.smg.dto.ManagersDTO;
import com.ezen.smg.dto.NoticeDTO;
import com.ezen.smg.dto.QnADTO;
import com.ezen.smg.dto.chart.SalesDTO;
import com.ezen.smg.dto.layout.LayoutDefaultDTO;
import com.ezen.smg.dto.layout.LayoutHGTDTO;
import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.dto.chart.GenderDTO;
import com.ezen.smg.dto.chart.GenreDTO;
import com.ezen.smg.mapper.FAQmapper;
import com.ezen.smg.mapper.GameSpecificationsMapper;
import com.ezen.smg.mapper.NoticeMapper;
import com.ezen.smg.service.ImagesService.ImagesService;
import com.ezen.smg.service.faqService.FAQService;
import com.ezen.smg.service.layoutService.MNG_LayoutService;
import com.ezen.smg.service.layoutService.LayoutType;
import com.ezen.smg.service.managerService.ManagerService;

import lombok.extern.log4j.Log4j;

@PropertySource(value = "classpath:application.properties", encoding = "UTF-8")
@Log4j
@RequestMapping("/admin")
@Controller
public class ManagerController {

	// 사진 파일 업로드시 저장될 주소
	@Value("${spring.notice_img.path}")
	String notice_uploadFolder;

	@Autowired
	ManagerService serv;

	@Autowired
	FAQService faqService;
	
	@Autowired
	MNG_LayoutService layoutServ;
	
	@Autowired
	ImagesService imagesService;
	
	@Autowired
	NoticeMapper noticeMapper;

	@Autowired
	FAQmapper faQmapper;
	
	@Autowired
	GameSpecificationsMapper specMapper;
	
	@GetMapping("")
	String certification(HttpServletRequest request) {
		HttpSession session = request.getSession();

		if(session.getAttribute("manager_token") != null) return "redirect:/admin/main";

		return "manager/certification";
	}

	@PostMapping("/confirm")
	String confirm(String mng_id, String mng_pw, Model model, HttpServletRequest request) {

		ManagersDTO manager = serv.confirmManager(mng_id, mng_pw);

		if(manager == null) {

			model.addAttribute("try_count", 1);

			return "manager/certification";
		}

		HttpSession session = request.getSession();


		log.info("매니저 로그인, 고유NUM: " + manager.getMng_num());

		session.setAttribute("manager_token", manager.getMng_num());

		return "redirect:main";
	}

	@GetMapping("/main")
	String managerLogin(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();

		Object session_id = session.getAttribute("manager_token");

		if(session_id == null) return "redirect:/admin"; 

		return "manager/admin_main";
	}

	@GetMapping("/manage/admin_game")
	String adminGame(Integer page, String type, String key, Model model) {
		if(page == null) page = 1;
		
		int totalSize;
		
		switch(type != null ? type: "NULL") {
			case "game_id": 
				totalSize = serv.getGameListByGame_idSize(key);
				model.addAttribute("gameList", serv.getGameListByGame_id(page, key));
				break;
			case "game_name":	
				totalSize = serv.getGameListByGame_nameSize(key);
				model.addAttribute("gameList", serv.getGameListByGame_name(page, key));
				break;
			case "layout":
				totalSize = serv.getGameListByLayoutSize(key);
				model.addAttribute("gameList", serv.getGameListByLayout(page, key));
				break;
			default:
				totalSize = serv.getGameListTotalSize();
				model.addAttribute("gameList", serv.getGameList(page));
		}
		
		model.addAttribute("paging", serv.getPagination(page, totalSize));
		
		return "manager/admin_game";
	}

	@GetMapping("/manage/admin_game_add")
	String adminGameAdd(Model model) {
		List<String[]> propList = serv.getPropList();
		
		model.addAttribute("genreArr", propList.get(0));
		model.addAttribute("editorArr", propList.get(1));
		model.addAttribute("platformArr", propList.get(2));
		model.addAttribute("layoutArr", propList.get(3));
		model.addAttribute("ratedArr", propList.get(4));
		
		return "manager/admin_game_add";
	}
	
	@PostMapping("/manage/admin_game_add")
	String adminGameAdd_post(Games game, String file_name, MultipartFile img_file) {

		serv.insertNewGame(game, file_name, img_file);
		
		return "redirect:admin_game";
	}
	
	@GetMapping("/manage/admin_game_detail")
	String adminGameDetail(Integer game_id, String prePageInfo, Model model) {

		Games game = serv.getGameDetail(game_id);
		
		model.addAttribute("layout_chk", layoutServ.getLayoutCheck(game_id, game.getLayout()));

		model.addAttribute("game", game);
		model.addAttribute("rated", game.getRated().split("/"));
		model.addAttribute("images", imagesService.getNomalImages(game_id, 1, 5));
		model.addAttribute("sub_banner", imagesService.getSubBanner(game_id));
		
		model.addAttribute("spec", specMapper.getSpec(game_id));
		
		model.addAttribute("prePageInfo", prePageInfo);

		return "manager/admin_game_detail";
	}

	@GetMapping("/manage/admin_game_delete")
	String adminGameDelete(Integer game_id) {

		serv.deleteGame(game_id);
		
		return "redirect:admin_game";
	}
	
	@GetMapping("/manage/admin_game_layout")
	String adminSetLayout(Integer game_id, String layout, Model model) {

		if(layout == null) layout = "NULL";

		model.addAttribute("game_id", game_id);
		
		switch(layout) {
			case "LRA":
				return "manager/admin_layout/layout_lra";
				
			case "JYM":
				return "manager/admin_layout/layout_jym";
			case "HGT":
				model.addAttribute("layout", layoutServ.getLayoutHGT(game_id));
				return "manager/admin_layout/layout_hgt";
			case "KCW":
				return "manager/admin_layout/layout_kcw";
			case "SJH":
				return "manager/admin_layout/layout_sjh";
			case "BGC":
				return "manager/admin_layout/layout_bgc";
			default:
				model.addAttribute("layout", layoutServ.getLayoutDefault(game_id));
				return "manager/admin_layout/layout_default";
		}
	}
	
	@GetMapping("/manage/admin_game_slide")
	String adminSetSlide(Integer game_id, Model model) {
		
		model.addAttribute("game_id", game_id);
		model.addAttribute("images", imagesService.getSlideImages(game_id));
		model.addAttribute("sub_banner", imagesService.getSubBanner(game_id));
		
		return "manager/admin_game_slide_update";
	}
	
	@PostMapping("/manage/admin_game_slide")
	String adminSetSlidePost(Integer game_id, MultipartFile slide_file0, MultipartFile slide_file1,
			MultipartFile slide_file2, MultipartFile slide_file3, MultipartFile slide_file4) {
		
		MultipartFile[] fileArr = {slide_file0, slide_file1, slide_file2, slide_file3, slide_file4};
		
		for(int i = 0; i < fileArr.length; ++i) {
			if(!fileArr[i].isEmpty()) {
				imagesService.updateSlideImage(game_id, fileArr[i], i);
			}
		}
		
		return "redirect:admin_game_slide?game_id=" + game_id;
	}
	
	@PostMapping("/manage/admin_sub_banner_set")
	String adminSetSubBanner(Integer game_id, MultipartFile sub_img_file) {
		
		if(!sub_img_file.isEmpty()) {
			imagesService.subBannerUpdate(game_id, sub_img_file);
		}
		
		return "redirect:admin_game_slide?game_id=" + game_id;	
	}
	
	
	@GetMapping("/manage/admin_game_req")
	String adminSetGameReq(Integer game_id, Model model) {
		
		model.addAttribute("game_id", game_id);
		model.addAttribute("spec", specMapper.getSpec(game_id));
		
		return "manager/admin_game_req_update";
	}
	
	@PostMapping("/manage/admin_game_req")
	String adminSetGameReqPost(Integer origin_game_id, GameSpecificationsDTO dto) {
		
		// insert로
		if(dto.getGame_id() == null) {
			dto.setGame_id(origin_game_id);
			specMapper.insertSpec(dto);
		// update로
		} else {
			specMapper.updateSpec(dto);
		}
		
		return "redirect:admin_game_detail?game_id=" + origin_game_id;
	}
	
	@PostMapping("/manage/layout_update_default")
	String layoutDefaultUpdate(Integer origin_game_id, LayoutDefaultDTO dto, MultipartFile img_file) {
		
		// insert로
		if(dto.getGame_id() == null) {
			dto.setGame_id(origin_game_id);
			layoutServ.insertLayoutDefault(dto);
		// update로
		} else {
			layoutServ.updateLayoutDefault(dto);
		}
		
		if(!img_file.isEmpty()) {
			layoutServ.updateImg_url(origin_game_id, LayoutType.DEFAULT, img_file, 0);
		}
			
		return "redirect:admin_game_detail?game_id=" + origin_game_id;
	}
	
	@PostMapping("/manage/layout_update_hgt")
	String layoutDefaultHGT(Integer origin_game_id, LayoutHGTDTO dto, MultipartFile game_img_file_1,
			MultipartFile game_img_file_2, MultipartFile game_img_file_3) {
		
		// insert로
		if(dto.getGame_id() == null) {
			dto.setGame_id(origin_game_id);
			layoutServ.insertLayoutHGT(dto);
		// update로
		} else {
			layoutServ.updateLayoutHGT(dto);
		}

		if(!game_img_file_1.isEmpty()) {
			layoutServ.updateImg_url(origin_game_id, LayoutType.HGT, game_img_file_1, 1);
		}
		if(!game_img_file_2.isEmpty()) {
			layoutServ.updateImg_url(origin_game_id, LayoutType.HGT, game_img_file_2, 2);
		}
		if(!game_img_file_3.isEmpty()) {
			layoutServ.updateImg_url(origin_game_id, LayoutType.HGT, game_img_file_3, 3);
		}
		
		return "redirect:admin_game_detail?game_id=" + origin_game_id; 
	}
	
	@GetMapping("/manage/admin_game_update")
	String adminGameUpdate(Integer game_id, Model model) {

		model.addAttribute("game", serv.getGameDetail(game_id));

		
		List<String[]> propList = serv.getPropList();
		
		model.addAttribute("genreArr", propList.get(0));
		model.addAttribute("editorArr", propList.get(1));
		model.addAttribute("platformArr", propList.get(2));
		model.addAttribute("layoutArr", propList.get(3));
		model.addAttribute("ratedArr", propList.get(4));
		
		return "manager/admin_game_update";
	}
	
	@PostMapping("/manage/admin_game_update")
	String adminGameUpdatePost(Games game, MultipartFile img_file) {

		int game_id = game.getGame_id(); 
		
		if(!img_file.isEmpty()) {
			serv.updateBanner_img(game_id, img_file);
		}
		
		serv.updateGame(game);
		
		return "redirect:./admin_game_detail?game_id=" + game_id;
	}
	
	@GetMapping("/manage/admin_user")
	public String userList(Model model, @RequestParam(name = "page", required = false, defaultValue = "1") int page) {
		
		int itemsPerPage = 200; // 페이지당 아이템 수
		List<SmgUsersDTO> userList = serv.getUserListWithPagination(page, itemsPerPage);

		model.addAttribute("userList", userList);

		return "manager/admin_user";
	}

	@GetMapping("/manage/admin_user_edit")
	String adminUserEdit(Integer userNum, Model model) {
		SmgUsersDTO user = serv.getUserByUserNum(userNum);

		// 가져온 유저 정보를 모델에 추가합니다.
		model.addAttribute("user", user);

		return "manager/admin_user_edit";
	}
	
	 
	// 회원정보 수정
	@PostMapping("/manage/update_info")
	String updateInfo(SmgUsersDTO user) {
	    String newPassword = user.getNewPassword();  

	    serv.managerUpdateUserInfo(user, newPassword);

	    return "redirect:/admin/manage/admin_user";  
	}
	 
	

	@GetMapping("/manage/admin_chart")
	String adminChart() {
		return "manager/admin_chart";
	}
	
	@ResponseBody
	@GetMapping("/manage/admin_chart_ajax")
	List<SalesDTO> getChart(String tag, Integer year) {
		
		return serv.getSalesData(tag, year);
	}
	
	@ResponseBody
	@GetMapping("/manage/admin_chart_ajax/gender")
	List<GenderDTO> getGenderRate() {
		

		return serv.getGenderData();
	}
	
	@ResponseBody
	@GetMapping("/manage/admin_chart_ajax/genre")
	List<GenreDTO> getGenreRate() {
		
		return serv.getGenreData();
	}
	
	@ResponseBody
	@GetMapping("/manage/admin_chart_ajax/editorSales")
	List<GenreDTO> getEditorSales() {
		
		return serv.getEditorSales();
	}

	@GetMapping("/manage/admin_inquiry")
	String adminInquiry(Model model, Integer page) {
		if(page == null) page = 1;
		
		int totalSize = serv.getTotalNum();
		
		model.addAttribute("paging", serv.getPagination(page, totalSize));
		model.addAttribute("contents", serv.getContent(page));
		
		return "manager/admin_inquiry";
	}
	
	@PostMapping("/manage/admin_inquiry")
	String adminInquiry(Integer inquiry_id, String inquiry_answer) {
		
		serv.updateAnswer(inquiry_id, inquiry_answer);
		return "redirect:/admin/manage/admin_inquiry";
	};
	
	@GetMapping("/manage/admin_notice")
	String adminNotice(Model model, Integer page) {

		if(page == null) page = 1;

		int totalSize = noticeMapper.getAllNotices().size();

		model.addAttribute("paging", serv.getPagination(page, totalSize));
		model.addAttribute("notices", serv.getNoticeList(page));

		return "manager/admin_notice";
	}


	@GetMapping("/manage/admin_notice_update_page")
	String adminNoticeUpdatePage(Model model, Integer id) {

		NoticeDTO dto = noticeMapper.getContent(id);

		model.addAttribute("notice", dto);

		return "manager/admin_notice_update";
	}

	@PostMapping(value = "/manage/admin_notice_update")
	String adminNoticeUpdate(Integer notice_id, NoticeDTO dto) {

		// 이미지 뒤에 붙여줄 날짜 포맷
		Date nowDate = new Date();				
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = format.format(nowDate);


		// 파일 이름 설정. 중복방지를 위해 뒤에 날짜 입력
		String file_name = dateString + dto.getImgFile().getOriginalFilename();

		// 파일 저장
		File saveFile = new File(notice_uploadFolder, file_name);
		try {
			dto.getImgFile().transferTo(saveFile);
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		dto.setBanner_url(file_name);

		noticeMapper.noticeUpdate(dto);

		return "redirect:/admin/manage/admin_notice";
	}

	@GetMapping("/manage/admin_notice_detail")
	String adminNoticeDetail(Model model, Integer id) {

		NoticeDTO dto = noticeMapper.getContent(id);
		String organize = "";
		for (String content : dto.getNotice_content().split("\\.")) {
			organize += content + ".<br>";
		}
		dto.setNotice_content(organize);

		model.addAttribute("notice", dto);

		return "manager/admin_notice_detail";
	}

	@GetMapping("/manage/admin_notice_add_page")
	String adminNoticeAddPage() {
		return "manager/admin_notice_add";
	}

	@PostMapping("/manage/admin_notice_add")
	String adminNoticeAdd(@SessionAttribute(name = "manager_token", required = false) Integer mng_num, NoticeDTO dto) {

		// 이미지 뒤에 붙여줄 날짜 포맷
		Date nowDate = new Date();				
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = format.format(nowDate);

		// 파일 이름 설정. 중복방지를 위해 뒤에 날짜 입력
		String file_name = dateString + dto.getImgFile().getOriginalFilename();

		// 파일 저장
		File saveFile = new File(notice_uploadFolder, file_name);
		try {
			dto.getImgFile().transferTo(saveFile);
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		dto.setMng_num(mng_num);
		dto.setBanner_url(file_name);

		noticeMapper.addNotice(dto);


		return "redirect:/admin/manage/admin_notice";
	}
	
	@GetMapping(value = "/manage/admin_notice_delete")
	String adminNoticeDelete(int id) {
		
		noticeMapper.deleteNotice(id);

		return "redirect:/admin/manage/admin_notice";
	}

	@GetMapping("/manage/admin_faq")
	String adminFaq(Model model, Integer page, String search, String topic) {
		if(page == null) page = 1;

		if(topic == null || topic.equals("")) topic = "all";

		int totalSize;

		if(search == null || search.equals("")) {
			totalSize = topic.equals("all") ? faqService.getTotalSize() : faqService.getTopicSize(topic);

			model.addAttribute("faqs", faqService.getList(page, topic));
			model.addAttribute("topic", topic);
		} else {
			totalSize = faqService.getSearchSize(search);

			model.addAttribute("faqs", faqService.getSearchList(page, search));
			model.addAttribute("search", search);
		}

		model.addAttribute("paging", faqService.getPagination(page, totalSize)); 
		model.addAttribute("totalSize", totalSize);

		return "manager/admin_faq";
	}

	@GetMapping("/manage/admin_faq_update_page")
	String adminFaqUpdatePage(Model model, Integer id) {

		model.addAttribute("faq", faqService.getDetail(id));

		return "manager/admin_faq_update";
	}

	@PostMapping(value = "/manage/admin_faq_update")
	String adminFaqUpdate(QnADTO dto) {

		faQmapper.updateFAQ(dto);

		return "redirect:/admin/manage/admin_faq";
	}
	
	@GetMapping(value = "/manage/admin_faq_delete")
	String adminFaqDelete(int id) {

		faQmapper.deleteFAQ(id);

		return "redirect:/admin/manage/admin_faq";
	}

	@GetMapping("/manage/admin_faq_detail")
	String adminFaqDetail(Model model, Integer id) {

		model.addAttribute("faq", faqService.getDetail(id));

		return "manager/admin_faq_detail";
	}

	@GetMapping("/manage/admin_faq_add_page")
	String adminFaqAddPage() {
		return "manager/admin_faq_add";
	}

	@PostMapping("/manage/admin_faq_add")
	String adminFaqAdd(QnADTO dto) {

		faQmapper.addFAQ(dto);

		return "redirect:/admin/manage/admin_faq";
	}

	@GetMapping("/manage/admin_key")
	String adminKey(Model model, String search, String search_tag) {
		if(search != null && !search.isEmpty()
				&& search_tag != null && !search_tag.isEmpty()) {
			model.addAttribute("search", search);
			model.addAttribute("gameKeys", serv.getSearchResults(search, search_tag, 1));
		} else {
			model.addAttribute("gameKeys", serv.getKeys(1));			
		}
		return "manager/admin_key";
	}

	@ResponseBody
	@GetMapping(value="/manage/admin_key_ajax")
	public List<GameKeyDTO> ajaxKey(int num, String search, String search_tag) {

		if(!search.equals("null") && !search.isEmpty()
				&& !search_tag.equals("null") && !search_tag.isEmpty()) {
			log.info(search);
			log.info(search_tag);
			return serv.getSearchResults(search, search_tag, num);
		} else {
			return serv.getKeys(num);
		}
	}

	@PostMapping("/manage/key_modify")
	String keyModify(Model model, String key_id, String nick_name, int key_num) {

		int[] results = serv.ModifyKey(key_id, nick_name, key_num);
		//results[0] == nick_name
		//results[1] == key_id
		model.addAttribute("modifyAccount", results[0]);
		model.addAttribute("modifyKey", results[1]);
		return "manager/key_modify";
	}

	@GetMapping("/manage/admin_out")
	String adminOut() {
		return "manager/admin_out";
	}

	@GetMapping("/manage/sessionOut")
	String adminOut(HttpServletRequest request) {
		HttpSession session = request.getSession();

		session.removeAttribute("manager_token");

		return "redirect:/";
	}

}
