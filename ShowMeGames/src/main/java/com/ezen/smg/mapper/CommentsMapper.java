package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.Comments;
import com.ezen.smg.dto.GoodAndBadDTO;

public interface CommentsMapper {
	
	List<Comments> getGameCommentList(@Param("game_id") int game_id);
	
	List<Comments> getBestCommentList(@Param("game_id") int game_id, @Param("start") int start, @Param("end") int end);
	
	List<Comments> getNewCommentList(@Param("game_id") int game_id, @Param("start") int start, @Param("end") int end);
	
	Comments getComment(@Param("comment_id") int comment_id);
	
	GoodAndBadDTO findGAB(@Param("user_num") int user_num, @Param("comment_id") int comment_id);
	
	int addGAB(@Param("dto") GoodAndBadDTO dto);
	
	int deleteGAB(@Param("gab_id") int gab_id);
	
	int updateGood(@Param("dto") Comments dto);
	
	int updateBad(@Param("dto") Comments dto);
	
	int commentGABCnt(@Param("comment_id") String comment_id, @Param("status") String status);
	
	List<GoodAndBadDTO> getMyGABList(@Param("user_num") int user_num);
	
	Comments getMyComment(@Param("user_num") int user_num, @Param("game_id") int game_id);
	
	int deleteMyCommentGAB(@Param("comment_id") int comment_id);
	
	int deleteMyComment(@Param("comment_id") int comment_id);
	
	int addMyComment(@Param("dto") Comments dto);
	
	Double getGameGrade(@Param("game_id") int game_id);
}
