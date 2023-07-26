package com.ezen.smg.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/** 
 * SH256방식 단방향 암호화
 * */
public class Encryption_SH256 {
	
	/**
	 * 암호화하려는 문자열을 넣는다.
	 *  */
    public static String encrypt(String text) {
        MessageDigest md = null;
        
		try {
			md = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
        md.update(text.getBytes());

        return bytesToHex(md.digest());
    }

    private static String bytesToHex(byte[] bytes) {
        StringBuilder builder = new StringBuilder();
        for (byte b : bytes) {
            builder.append(String.format("%02x", b));
        }
        return builder.toString();
    }
    
}
