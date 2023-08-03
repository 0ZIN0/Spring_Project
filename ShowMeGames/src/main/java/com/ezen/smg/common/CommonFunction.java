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
	
}
