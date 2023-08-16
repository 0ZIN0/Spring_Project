package com.ezen.smg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ezen.smg.dto.GoodAndBadDTO;
import com.ezen.smg.dto.SmgUsersDTO;
import com.ezen.smg.mapper.CommentsMapper;
import com.ezen.smg.service.commentService.CommentsService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommentsController {
	
	@Autowired
	CommentsService commentsService;
	
	@Autowired
	CommentsMapper commentsMapper;
	
	@ResponseBody
	@RequestMapping(value = "/comment-good")
	public int commentGoodGAB(@RequestBody Integer comment_id, @SessionAttribute(name = "user", required = false) SmgUsersDTO user) {
		if (user != null) {
			log.error("user: " + user);
			int result = commentsService.findGAB(user.getUser_num(), comment_id);
			GoodAndBadDTO dto = commentsMapper.findGAB(user.getUser_num(), comment_id);
			if (result == 1) {
				commentsService.goodService(dto, 2, comment_id);
				return 2; // 유저가 GOOD 버튼을 누름 (good 버튼 취소)
			} else if (result == 2) {
				return 3; // 유저가 BAD 버튼을 누름 (alret 창)
			}
			GoodAndBadDTO newDTO = new GoodAndBadDTO();
			
			newDTO.setComment_id(comment_id);
			newDTO.setStatus("G");
			newDTO.setUser_num(user.getUser_num());
			
			commentsService.goodService(newDTO, 1, comment_id);
			return 1; // 유저가 GAB버튼을 누르지 않음 (good 버튼 선택)
		}
		return 0; // 로그인 필요
	}
	
	@ResponseBody
	@RequestMapping(value = "/comment-bad")
	public int commentBadGAD(@RequestBody Integer comment_id, @SessionAttribute(name = "user", required = false) SmgUsersDTO user) {
		if (user != null) {
			int result = commentsService.findGAB(user.getUser_num(), comment_id);
			GoodAndBadDTO dto = commentsMapper.findGAB(user.getUser_num(), comment_id);
			if (result == 1) {
				commentsService.goodService(dto, 2, comment_id);
				return 2; // 유저가 BAD 버튼을 누름 (BAD 버튼 취소)
			} else if (result == 2) {
				return 3; // 유저가 GOOD 버튼을 누름 (alret 창)
			}
			GoodAndBadDTO newDTO = new GoodAndBadDTO();
			
			newDTO.setComment_id(comment_id);
			newDTO.setStatus("B");
			newDTO.setUser_num(user.getUser_num());
			
			commentsService.goodService(newDTO, 1, comment_id);
			return 1; // 유저가 GAB버튼을 누르지 않음 (BAD 버튼 선택)
		}
		return 0; // 로그인 필요
	}
}
