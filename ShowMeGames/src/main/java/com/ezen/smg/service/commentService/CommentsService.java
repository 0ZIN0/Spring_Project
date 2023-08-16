package com.ezen.smg.service.commentService;

import java.util.List;

import com.ezen.smg.dto.Comments;

public interface CommentsService {
	List<Comments> getGameComment(int game_id);
}
