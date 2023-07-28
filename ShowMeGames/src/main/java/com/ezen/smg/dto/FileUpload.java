package com.ezen.smg.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileUpload {
	private String name;
	private String desc;
	private MultipartFile mpfile;
	
	
}
