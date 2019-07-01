package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.util.CookieUtil;

@Controller
public class generalController {

	@ModelAttribute
	public void loginSigninCheck(HttpSession httpSession,Model model,HttpServletRequest request)
	{
		if(httpSession.getAttribute("userid")==null || httpSession.getAttribute("userid").equals(""))
		{
			CookieUtil cookieUtil=new CookieUtil();
			HashMap<String, String> cookies=cookieUtil.getCookiesMap(request);
			httpSession.setAttribute("userid", cookies.get("userid"));
			httpSession.setAttribute("account", cookies.get("account"));
		}
		if(httpSession.getAttribute("userid")==null || httpSession.getAttribute("userid").equals(""))
		{
			model.addAttribute("loginSigninBlock","<li><a href='SignIn'>Sign In</a></li><li><a href='LogIn'>Join In</a></li>");
		}
		else
		{
			model.addAttribute("loginSigninBlock","<li><a href=''><img src='CSS/image/userPhoto/"+httpSession.getAttribute("userid")+"HP.png' onerror=this.src='CSS/image/userPhoto/none_s.png'></a></li>");
		}
	}

	@RequestMapping(value={"/{pageName}","/"})
	public String toAnyPage(@PathVariable String pageName,HttpSession httpSession)
	{
		if(httpSession.getAttribute("userid")==null || httpSession.getAttribute("userid").equals(""))
		{
			return "LogIn";
		}
		else
		{
			return pageName;
		}
	}

}
