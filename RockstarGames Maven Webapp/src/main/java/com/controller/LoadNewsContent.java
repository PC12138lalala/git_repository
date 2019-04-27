package com.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.support.RequestContext;

import com.model.Gameinfo;
import com.service.GameService;

/** 

 * @author 作者 Your-Name: 郭鹏程 

 * @version 创建时间：2019年4月27日 下午1:39:30 

 * 类说明 

 */
@Controller
@RequestMapping("news")
public class LoadNewsContent {

	@Autowired
	@Qualifier("gameService")
	private GameService gameService;
	
	@ModelAttribute
	public void loginSigninCheck(HttpSession httpSession,Model model,HttpServletRequest request)
	{
		if(httpSession.getAttribute("userid")==null || httpSession.getAttribute("userid").equals(""))
		{
			RequestContext req = new RequestContext(request);
			model.addAttribute("loginSigninBlock","<li><a href='SignIn'>"+req.getMessage("Sign In")+"</a></li><li><a href='LogIn'>"+req.getMessage("Join In")+"</a></li>");
		}
		else
		{
			model.addAttribute("loginSigninBlock","<li><a href='profile'><img src='CSS/image/userPhoto/"+httpSession.getAttribute("userid")+"HP.png' onerror=this.src='CSS/image/userPhoto/none_s.png'></a></li>");
		}
		List<Gameinfo> games = gameService.getAllGames();
		Map<String, String> newGames = new LinkedHashMap<String, String>();
		for(Gameinfo game : games)
		{
			newGames.put(game.getName(), "CSS/image/games/S_"+game.getName().replaceAll(" ", "_").replaceAll(":", "_"));
		}
		model.addAttribute("games", newGames);
	}
	@RequestMapping("/content")
	public String toNews(@RequestParam("id") String id,Model model){
		
		model.addAttribute("id", id);
		
		return "content";
	}
}
