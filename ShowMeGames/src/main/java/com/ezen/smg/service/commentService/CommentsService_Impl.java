package com.ezen.smg.service.commentService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.Comments;
import com.ezen.smg.dto.GoodAndBadDTO;
import com.ezen.smg.mapper.CommentsMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CommentsService_Impl implements CommentsService{

	@Autowired
	CommentsMapper commentsMapper;

	@Override
	public List<Comments> getGameComment(int game_id) {
		List<Comments> comments = commentsMapper.getGameCommentList(game_id);

		return comments;
	}

	/** 
	 * 0 : null,
	 * 1 : G,
	 * 2 : B
	 * */
	@Override
	public int findGAB(int user_num, int comment_id) {
		GoodAndBadDTO dto = commentsMapper.findGAB(user_num, comment_id);
		log.info("dto: " + dto);
		if (dto != null) {
			if (dto.getStatus().equals("G")) {
				return 1;
			}
			return 2;
		}
		return 0;
	}

	@Override
	public void goodService(GoodAndBadDTO dto, int result, int comment_id) {
		Comments comment = commentsMapper.getComment(comment_id);

		if (result == 1) {
			int goodCnt = comment.getGood_cnt();
			comment.setGood_cnt(++goodCnt);
			commentsMapper.updateGood(comment);
			commentsMapper.addGAB(dto);
		} else if (result == 2) {
			int goodCnt = comment.getGood_cnt();
			comment.setGood_cnt(--goodCnt);
			commentsMapper.updateGood(comment);
			commentsMapper.addGAB(dto);
			commentsMapper.deleteGAB(dto.getGab_id());
		}
	}

	@Override
	public void badService(GoodAndBadDTO dto, int result, int comment_id) {
		Comments comment = commentsMapper.getComment(comment_id);

		if (result == 1) {
			int badCnt = comment.getBad_cnt();
			comment.setBad_cnt(++badCnt);
			commentsMapper.updateBad(comment);
			commentsMapper.addGAB(dto);
		} else if (result == 2) {
			int badCnt = comment.getBad_cnt();
			comment.setGood_cnt(--badCnt);
			commentsMapper.updateBad(comment);
			commentsMapper.addGAB(dto);
			commentsMapper.deleteGAB(dto.getGab_id());
		}
	}
}
