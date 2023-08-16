package com.ezen.smg.common;

import java.util.UUID;

public class CommonFunction {

	/**
	 * 할인율 계산, 10원 단위 절삭. discount 0이면 price를 리턴.
	 * @param price 할인이전 가격
	 * @param discount 할인율
	 * @return 최종가격
	 */
	public static int calDiscount(int price, int discount) {
		if(discount == 0) return price; 
		
		double discountPrice = discount / 100.0 * price;  
		
		return (int)(Math.floor((price - discountPrice) / 10) * 10);
	}
	
	/**
	 * 랜덤 UUID 문자열을 반환해주는 메서드. 하이푼('-')을 제외한 순수 숫자로 이루어진 문자열을 반환한다.
	 * @return UUID 128비트의 숫자로 이루어진 문자열, 32자리의 16진수.
	 */
	public static String UUIDRandomCreate() {
		
		UUID temp = UUID.randomUUID();
		String result = temp.toString().replaceAll("-", "");
		
		return result;
	}

	/**
	 * 파일 확장자를 추출해주는 메서드.
	 * @param originalFilename 원래의 파일명
	 * @return .을 포함한 확장자
	 */
	public static String extractExt(String originalFilename) {
	    int posi = originalFilename.lastIndexOf(".");
	    return originalFilename.substring(posi);
	}

	/**
	 * url 전체를 넣어주면 확장자를 포함한 파일명을 추출해주는 메서드.
	 * @param url 전체 경로
	 * @return 확장자를 포함한 파일명
	 */
	public static String getFileName(String url) {
		return url.substring(url.lastIndexOf("/") + 1);
	}

	/**
	 * url 전체를 넣어주면 확장자를 제외한 파일명만 추출해주는 메서드.
	 * @param url 전체 경로
	 * @return 확장자를 제외한 파일명
	 */
	public static String getFileNameWithoutExt(String url) {
		return url.substring(url.lastIndexOf("/") + 1, url.lastIndexOf("."));
	}
	
	/** 
	 * 입력받은 text의 엔터키를 <br>태그로 변환해주는 메서드
	 * @param text textarea로 입력받은 String
	 * @return 변환 후 String
	 */
	public static String handleCrlfToBr(String text) {
		return text.replaceAll("\r\n", "<br>");
	};
	
	public static String handleBrToCrlf(String text) {
		return text.replaceAll("<br>", "\r\n");
	}
	
}
