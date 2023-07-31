package com.ezen.smg.common;

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
	
}
