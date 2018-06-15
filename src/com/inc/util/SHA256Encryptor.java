package com.inc.util;

import java.security.MessageDigest;

public class SHA256Encryptor {
	//SHA암호화 클래스 구현
	public static String shaEncrypt(String str) {
		//멤버변수에 접근할 필요가 없으므로 static메서드로 구현.
		String encryptedStr = null;
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			digest.update("codecoffee".getBytes());
			
			byte[] byteData = digest.digest(str.getBytes("UTF-8"));
			
			StringBuffer sb = new StringBuffer();
			for(byte b : byteData) {
				//byte로 암호화된 데이터를 읽을 수 있는 문자형태로 변환.
				String byteToStr = Integer.toString((b & 0xff) + 0x100, 16).substring(1);
				sb.append(byteToStr);
			}
			//문자로 변환된 데이터를 StringBuffer에 차례차례 담고, String형으로 변환해서 리턴한다.
			encryptedStr = sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return encryptedStr;
	}
}