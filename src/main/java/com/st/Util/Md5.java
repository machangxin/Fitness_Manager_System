package com.st.Util;

import org.apache.shiro.crypto.hash.SimpleHash;

public class Md5 {
	
	public static String md5(String src,String salt,int hashInt) {
		SimpleHash sh=new SimpleHash("md5",src,salt,hashInt);
		String md5pass=sh.toHex();
		return md5pass;
	}
}