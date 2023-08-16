package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.Comments;

public interface CommentsMapper {
	
	List<Comments> getGameCommentList(@Param("game_id") int game_id);
	
	List<Comments> getBestCommentList(@Param("game_id") int game_id, @Param("start") int start, @Param("end") int end);
	
	List<Comments> getNewCommentList(@Param("game_id") int game_id, @Param("start") int start, @Param("end") int end);
}
