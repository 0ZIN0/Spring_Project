package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.Comments;

public interface CommentsMapper {
	
	List<Comments> getGameCommentList(@Param("game_id") int game_id);
}
