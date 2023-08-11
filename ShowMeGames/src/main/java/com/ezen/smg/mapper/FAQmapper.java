package com.ezen.smg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.smg.dto.QnADTO;

public interface FAQmapper {

	List<QnADTO> getFAQList(@Param("start") int start, @Param("end") int end);
	
	List<QnADTO> getFAQTopicList(@Param("start") int start, @Param("end") int end, @Param("topic") String topic);
	
	List<QnADTO> getFAQSearchList(@Param("start") int start, @Param("end") int end, @Param("search") String search);
	
	int getTotalNum();

	QnADTO getFAQ(@Param("id") int qna_id);

	int getTopicNum(@Param("topic") String topic);

	int getSearchNum(@Param("search") String search);
	
	int updateFAQ(@Param("dto") QnADTO dto);
	
	int addFAQ(@Param("dto") QnADTO dto);
}
