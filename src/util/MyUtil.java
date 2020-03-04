package util;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import exception.UserLoginNoException;
import po.User;
public class MyUtil {
	/**
	 * 获得时间字符串
	 */
	public static String getStringID(){
		String id=null;
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
		id=sdf.format(date);
		return id;
	}
	/**
	 * 获得用户ID
	 */
	public static String getUserId(HttpSession session){
		User ruser = (User)session.getAttribute("user");
		return ruser.getId();
	}
	
	/**
	 * 获得uuid
	 */
	public static String getUUID() {
		return UUID.randomUUID().toString().replaceAll("-","");
	}
}
