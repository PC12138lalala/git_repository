package com.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Gameinfo;
import com.model.Userset;
import com.service.GameService;
import com.service.UsersetService;

@Controller
public class UserLogIn {

	@Autowired
	@Qualifier("usersetService")
	private UsersetService usersetService;
	
	@Autowired
	@Qualifier("gameService")
	private GameService gameService;
	
	@ModelAttribute
	public void logInfo(String account,String pwd,Model model)
	{
		model.addAttribute("account",account);
		model.addAttribute("pwd",pwd);
	}
	
	@RequestMapping(value="UserLogIn")
	public String userLogIn(Model model,HttpSession httpSession,HttpServletRequest request,HttpServletResponse response)
	{
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-ALLOW-Credentials", "true");
		String account=(String) model.asMap().get("account");
		String pwd=(String) model.asMap().get("pwd");
		if(account!=null && pwd!=null && !account.trim().equals("") && !pwd.trim().equals(""))
		{
			List<Userset> list=usersetService.logIn(account, pwd);
			if(list.size()>0)
			{
				if(list.get(0).getUserid()!=null && list.get(0).getIsDelete().equals("N") && list.get(0).getIsLocked().equals("N"))
				{
					Cookie userid_cookie=new Cookie("userid", list.get(0).getUserid().toString());
					userid_cookie.setPath("/");
					//userid_cookie.setDomain(".rockstargames.com.cn");
					//userid_cookie.setMaxAge(10*60);
					response.addCookie(userid_cookie);
					Cookie userInfo_cookie=new Cookie("userInfo", account.toString());
					userInfo_cookie.setPath("/");
					//userInfo_cookie.setDomain(".rockstargames.com.cn");
					//userInfo_cookie.setMaxAge(10*60);
					response.addCookie(userInfo_cookie);
					httpSession.setAttribute("userInfo", account);
					httpSession.setAttribute("userid", list.get(0).getUserid());
					model.addAttribute("errorInfo", "");
					usersetService.updateLastSign(list.get(0).getUserid());
					return "index";
				}
				else if(!list.get(0).getIsDelete().equals("N") || !list.get(0).getIsLocked().equals("N"))
				{
					model.addAttribute("errorInfo", "your account is locked");
				}
			}
			else 
			{
				model.addAttribute("errorInfo", "user account OR password error");
			}
			
		}
		return "LogIn";
	}
	@RequestMapping("profile")
	public String loadProfile(HttpSession httpSession,Model model)
	{
		String userid=httpSession.getAttribute("userid").toString();
		List<Userset> list=usersetService.findUserById(userid);
		Userset userset=list.get(0);
		model.addAttribute("userset", userset);
		List<Gameinfo> games = gameService.getAllGames();
		Map<String, String> newGames = new LinkedHashMap<String, String>();
		for(Gameinfo game : games)
		{
			newGames.put(game.getName(), "CSS/image/games/S_"+game.getName().replaceAll(" ", "_").replaceAll(":", "_"));
		}
		model.addAttribute("games", newGames);
		return "profile";
	}
	@RequestMapping("change")
	public String loadChange(HttpSession httpSession,Model model)
	{
		String userid=httpSession.getAttribute("userid").toString();
		List<Userset> list=usersetService.findUserById(userid);
		Userset userset=list.get(0);
		model.addAttribute("userset", userset);
		List<Gameinfo> games = gameService.getAllGames();
		Map<String, String> newGames = new LinkedHashMap<String, String>();
		for(Gameinfo game : games)
		{
			newGames.put(game.getName(), "CSS/image/games/S_"+game.getName().replaceAll(" ", "_").replaceAll(":", "_"));
		}
		model.addAttribute("games", newGames);
		return "change";
	}
	@RequestMapping("Logout")
	public String logOut(HttpSession session,HttpServletRequest request,HttpServletResponse response)
	{
		session.removeAttribute("userInfo");
		session.invalidate();
		session=request.getSession();
		Cookie[] cookies=request.getCookies();
		for(Cookie c:cookies)
		{
			c.setValue("");
			c.setMaxAge(0);
			response.addCookie(c);
		}
		return "index";
	}
}
