package com.st.Util;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpSession;


public class ParamsUtil {
	private static char[] cpass_arr= {'1','2','3', '4', '5', '6', '7', '8', '9', '0', 'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'z', 'x', 'c', 'v', 'b', 'n', 'm', '-', '=', 'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', 'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'Z', 'X', 'C', 'V', 'B', 'N', 'M'};
	/*
	 * 计算出每页数据开始的下标,保存到params中
	 */
	public static void page(Map params) {
		int page =Integer.parseInt(params.get("page").toString()) ;
		int limit =Integer.parseInt(params.get("limit").toString()) ;
		int start =(page-1)*limit;
		params.put("start",start);
}
	/**向params中添加uuid,属性名为uuid
	 * @param params
	 */
	public static void uuid(Map params) {
		UUID uuid=UUID.randomUUID();
		params.put("uuid", uuid.toString());
	}
	/**添加默认密码,属性为User_loginpass
	 * @author Auk
	 *
	 */
	public static String initpass(Map params,String salt) {
		char  c_arr[] = new char[16];
		int index=0;
		for(int i =0;i<16;i++) {
			index = (int)(Math.random()*cpass_arr.length);
			c_arr[i]=cpass_arr[index];
		}
		String pass= new String(c_arr);
		int hashInt = (int)(Math.random()*1025+1024);
		salt+=hashInt;
		String md5pass=Md5.md5(pass, salt, hashInt);
		params.put("User_loginpass", md5pass);
		params.put("uuid", salt);
		return pass;
	}
	
	/**将数组字符的格式变成'a','b'的形式,方便SQL使用
	 * @param params
	 * @param key
	 */
	public static void arr_str(Map params,Object key) {
		String arr_str=params.get(key)+"";
		arr_str=arr_str.substring(0,arr_str.length()-1);
		arr_str=arr_str.replaceAll(",", "','");
		arr_str="'"+arr_str+"'";
		params.put(key,arr_str);
	}
	
	public static void state(Map params,int state) {
		params.put("Customer_state", state);
	}
	public static void loginuserId(Map params,HttpSession session) {
		params.put("loginuserId", session.getAttribute("loginuserid"));
	}
	public static void payment(Map params) {
		String payment=params.get("visit_payment")+"";
		params.put("visit_payment","on".equals(payment)? 1:0);
	}
	/**Map转String
	 * @param Map
	 * @param String
	 */
	public static String getMapToString(Map<String,Object> map){
	       Set<String> keySet = map.keySet();
	       //将set集合转换为数组
	       String[] keyArray = keySet.toArray(new String[keySet.size()]);
	       //给数组排序(升序)
	       Arrays.sort(keyArray);
	       //因为String拼接效率会很低的，所以转用StringBuilder
	       StringBuilder sb = new StringBuilder();
	       for (int i = 0; i < keyArray.length; i++) {
	           // 参数值为空，则不参与签名 这个方法trim()是去空格
	           if ((String.valueOf(map.get(keyArray[i]))).trim().length() > 0) {
	               sb.append(keyArray[i]).append(":").append(String.valueOf(map.get(keyArray[i])).trim());
	           }
	           if(i != keyArray.length-1){
	               sb.append(",");
	           }
	       }
	       return sb.toString();
	   }
	/**String转Map
	 * @param String
	 * @param Map
	 */
	 public static Map<String,Object> getStringToMap(String str){
	       //根据逗号截取字符串数组
		 	//下面两行不是，这是本项目的特殊处理
		 	str = trimFirstAndLastChar(str,"{");
		 	str = trimFirstAndLastChar(str,"}");
	       String[] str1 = str.split(",");
	       //创建Map对象
	       Map map = new HashMap<String, Object>();
	       //循环加入map集合
	       for (int i = 0; i < str1.length; i++) {
	           //根据":"截取字符串数组
	           String[] str2 = str1[i].split(":");
	           //str2[0]为KEY,str2[1]为值
	           map.put(str2[0],str2[1]);
	       }
	       return map;}
	 /**
	 * 去除首尾指定字符
	 * @param str 字符串
	 * @param element 指定字符
	 * @return
	 */
	 public static String trimFirstAndLastChar(String str, String element){
	     boolean beginIndexFlag = true;
	     boolean endIndexFlag = true;
	     do{
	         int beginIndex = str.indexOf(element) == 0 ? 1 : 0;
	         int endIndex = str.lastIndexOf(element) + 1 == str.length() ? str.lastIndexOf(element) : str.length();
	         str = str.substring(beginIndex, endIndex);
	         beginIndexFlag = (str.indexOf(element) == 0);
	         endIndexFlag = (str.lastIndexOf(element) + 1 == str.length());
	     } while (beginIndexFlag || endIndexFlag);
	     return str;
	 }
}
