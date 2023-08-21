package com.ezen.smg.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ezen.smg.common.CommonFunction;
import com.ezen.smg.dto.Comments;
import com.ezen.smg.dto.Games;
import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.mapper.CommentsMapper;
import com.ezen.smg.mapper.GameSpecificationsMapper;
import com.ezen.smg.mapper.GamesMapper;
import com.ezen.smg.mapper.LayoutMapper;
import com.ezen.smg.mapper.UsersMapper;
import com.ezen.smg.service.ImagesService.ImagesService;
import com.ezen.smg.service.commentService.CommentsService;
import com.ezen.smg.service.gamesService.GamesService;
import com.ezen.smg.service.indexService.IndexService;
import com.ezen.smg.service.memberService.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class IndexController {
	
	@Autowired
	IndexService serv;
	
	@Autowired
	GamesService gamesService;
	
	@Autowired
	ImagesService imagesService;

	@Autowired
	MemberService memberService;
	
	@Autowired
	CommentsService commentsService;
	
	@Autowired
	CommentsMapper commentsMapper;
	
	@Autowired
	GamesMapper gamesMapper;
	
	@Autowired
	UsersMapper usersMapper;
	
	@Autowired
	LayoutMapper layoutMapper;
	
	@Autowired
	GameSpecificationsMapper specMapper;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request, @SessionAttribute(name = "user", required = false) SmgUsersDTO user) {
		
		model.addAttribute("latestList", serv.getLatestGameList());
		model.addAttribute("editorList", serv.getEditorRecmdList());
		model.addAttribute("discountList", serv.getLargestDiscountList());
		model.addAttribute("curatorList", serv.getCuratorRecmdList());
		model.addAttribute("hotgameList", serv.getHotGameList());
		
		if (user != null) {
			request.getSession().setAttribute("user", usersMapper.getUserInfo(user.getUser_num()));
		}
		
		log.info("main 실행");
		
		return "index";
	}
	
	@GetMapping(value="/detail")
	public String detail(Integer game, Model model, String layout, @SessionAttribute(name = "user", required = false) SmgUsersDTO user) {
		
		Games gameDTO = gamesMapper.getGame(game);
		gameDTO.setDiscounted_price(CommonFunction.calDiscount(gameDTO.getGame_price(), gameDTO.getDiscount()));
		if (commentsMapper.getGameGrade(game) == null) {
			gameDTO.setGame_grade(0.0);
		} else {
			gameDTO.setGame_grade(commentsMapper.getGameGrade(game));
		}
		
		model.addAttribute("game", gameDTO);
		model.addAttribute("rateds", gameDTO.getRated().split("/"));
		model.addAttribute("images", imagesService.getNomalImages(game, 1, 5));
		model.addAttribute("sub_banner", imagesService.getSubBanner(game));
		
		if (user == null) {
			model.addAttribute("is_use", false);
		} else {
			model.addAttribute("user", usersMapper.getUserInfo(user.getUser_num()));
			model.addAttribute("is_use", memberService.isUseKey(user.getUser_num(), game));
			model.addAttribute("my_gab_list", commentsService.getMyGABList(user.getUser_num(), "comment_id"));
			model.addAttribute("my_status_list", commentsService.getMyGABList(user.getUser_num(), "status"));
			model.addAttribute("my_com", commentsMapper.getMyComment(user.getUser_num(), game));
		}
		
		// 댓글 model
		model.addAttribute("comments", commentsService.getGameComment(game));
		model.addAttribute("comment_len", commentsService.getGameComment(game).size());
		
		List<Comments> coms = commentsMapper.getBestCommentList(game, 1, 10);
		model.addAttribute("best_comments", coms);
		model.addAttribute("best_com_id", commentsService.getComIdList(game, "best"));
		model.addAttribute("best_comment_len", commentsMapper.getBestCommentList(game, 1, 10).size());
		
		// new 댓글
		List<Comments> new_coms = commentsMapper.getNewCommentList(game, 1, 5);
		model.addAttribute("new_comments", new_coms);
		model.addAttribute("new_com_id", commentsService.getComIdList(game, "new"));
		
		// 게임 요구사양 
		model.addAttribute("spec", specMapper.getSpec(game));
		
		switch(layout != null ? layout: "NULL") {
		case "LRA":
			model.addAttribute("layout", layoutMapper.getLayoutLRA(game));
			return "games/layout/type_lra";
		case "JYM":
			return "games/layout/type_jym";
		case "HGT":
			model.addAttribute("layout", layoutMapper.getLayoutHGT(game));
			return "games/layout/type_hgt";
		case "KCW":
			model.addAttribute("layout", layoutMapper.getLayoutKCW(game));
			return "games/layout/type_kcw";
		case "SJH":
			return "games/layout/type_sjh";
		case "BGC":
			return "games/layout/type_bgc";
		default:
			model.addAttribute("layout", layoutMapper.getLayoutDefault(game));
			return "games/default";
		}
		
	}
	
	@GetMapping(value="/detail/review_all")
	public String reviewAll(Model model, Integer game, @SessionAttribute(name = "user", required = false) SmgUsersDTO user) {
		Games gameDTO = gamesMapper.getGame(game);
		List<Comments> comments = commentsService.getNewComments(game, 1, 40);
		model.addAttribute("game", gameDTO);
		model.addAttribute("comments", comments);
		model.addAttribute("comment_len", commentsService.getGameComment(game).size());
		log.info(comments.size());
		return "games/review_all";
	}
	
	@ResponseBody
	@GetMapping(value="/detail/review_all_ajax")
	public List<Comments> reviewAll(@RequestParam("game") Integer game,
			@RequestParam("page") Integer index) {
		
		log.info(game);
		log.info(index);
		return commentsService.getNewComments(game, index, 40);
	}
}

