package com.ezen.smg.service.commentService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.smg.dto.Comments;
import com.ezen.smg.mapper.CommentsMapper;

@Service
public class CommentsService_Impl implements CommentsService{
	
	@Autowired
	CommentsMapper commentsMapper;
	
	@Override
	public List<Comments> getGameComment(int game_id) {
		List<Comments> comments = commentsMapper.getGameCommentList(game_id);
		
		return comments;
	}

}
