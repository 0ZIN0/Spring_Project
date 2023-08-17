package com.ezen.smg.service.commentService;

import java.util.List;

import com.ezen.smg.dto.Comments;
import com.ezen.smg.dto.GoodAndBadDTO;

public interface CommentsService {
	List<Comments> getGameComment(int game_id);
	
	int findGAB(int user_num, int comment_id);
	
	String getMyGABList(int user_num, String column);
	
	void goodService(GoodAndBadDTO dto, int result, int comment_id);
	
	void badService(GoodAndBadDTO dto, int result, int comment_id);
	
	List<Comments> getNewComments(int game_id, int page, int scope);
}
