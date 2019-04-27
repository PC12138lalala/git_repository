package com.util;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtil {

	private Cookie[] cookies;
	private HashMap<String, String> cookieMap;
	
	public CookieUtil()
	{
		cookieMap=new HashMap<String, String>();
	}
	private void getCookies(HttpServletRequest request)
	{
		cookies=request.getCookies();
	}
	
	public HashMap<String, String> getCookiesMap(HttpServletRequest request)
	{
		getCookies(request);
		if(cookies!=null)
		{
			for(Cookie cookie:cookies)
			{
				cookieMap.put(cookie.getName(), cookie.getValue());
			}
		}
		return cookieMap;
	}
}
