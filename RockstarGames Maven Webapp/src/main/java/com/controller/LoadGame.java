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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContext;

import com.model.Gameinfo;
import com.model.Video;
import com.service.GameService;
import com.service.VideoService;

@Controller
public class LoadGame {

	@Autowired
	@Qualifier("gameService")
	private GameService gameService;
	@Autowired
	@Qualifier("videoService")
	private VideoService videoService;
	@RequestMapping("/Game/{name}")
	public String toGamePage(Model model,@PathVariable(value="name") String name,HttpSession httpSession,HttpServletRequest request)
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
		model.addAttribute("name", name);
		Gameinfo gameinfo=gameService.getGameInfoByName(name);
		model.addAttribute("game", gameinfo);
		List<Video> lists=videoService.findVideoByCondition(name, "updateDate");
		model.addAttribute("video", lists);
		List<Gameinfo> games = gameService.getAllGames();
		Map<String, String> newGames = new LinkedHashMap<String, String>();
		for(Gameinfo game : games)
		{
			newGames.put(game.getName(), "CSS/image/games/S_"+game.getName().replaceAll(" ", "_").replaceAll(":", "_"));
		}
		model.addAttribute("games", newGames);
		return "Game";
	}
}