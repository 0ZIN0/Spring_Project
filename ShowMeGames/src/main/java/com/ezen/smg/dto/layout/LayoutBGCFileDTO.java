package com.ezen.smg.dto.layout;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class LayoutBGCFileDTO {
	MultipartFile game_img_file_1;
	MultipartFile game_img_file_2;
	MultipartFile game_img_file_3;
	MultipartFile game_img_file_4;
	MultipartFile game_video_file_1;
	MultipartFile game_video_file_2;
	MultipartFile game_video_file_3;
	MultipartFile game_video_file_4;
}
