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
public class LoadVideoPage {

	@Autowired
	@Qualifier("videoService")
	private VideoService videoService;
	
	@Autowired
	@Qualifier("gameService")
	private GameService gameService;
	
	@RequestMapping("/video/{path}")
	public String toVideoPage(Model model,@PathVariable("path") String path,HttpSession httpSession,HttpServletRequest request)
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
		String game=path.substring(path.indexOf("=")+1,path.indexOf("&"));
		if(game.equals("GRAND THEFT AUTO CHINATOWN WARS"))
    	{
    		game="GRAND THEFT AUTO:CHINATOWN WARS";
    	}
    	else if(game.equals("GRAND THEFT AUTO Episodes from Liberty City"))
    	{
    		game="GRAND THEFT AUTO:Episodes from Liberty City";
    	}
    	else if(game.equals("GRAND THEFT AUTO LIBERTY CITY STORIES"))
    	{
    		game="GRAND THEFT AUTO:LIBERTY CITY STORIES";
    	}
    	else if(game.equals("GRAND THEFT AUTO LONDON 1969"))
    	{
    		game="GRAND THEFT AUTO:LONDON 1969";
    	}
    	else if(game.equals("GRAND THEFT AUTO San Andreas"))
    	{
    		game="GRAND THEFT AUTO:San Andreas";
    	}
    	else if(game.equals("GRAND THEFT AUTO VICE CITY STORIES"))
    	{
    		game="GRAND THEFT AUTO:VICE CITY STORIES";
    	}
    	else if(game.equals("GRAND THEFT AUTO Vice City"))
    	{
    		game="GRAND THEFT AUTO:Vice City";
    	}
		String videoName=path.substring(path.lastIndexOf("=")+1);
		model.addAttribute("game",game);
		model.addAttribute("videoName", videoName);
		List<Video> list=videoService.getVideoInfo(videoName);
		Video video=list.get(0);
		model.addAttribute("videoInfo", video);
		model.addAttribute("comment",video.getVideo_comment());
		List<Video> lists=videoService.findVideoByCondition(game, "View_time");
		model.addAttribute("hotvideo", lists);
		List<Gameinfo> games = gameService.getAllGames();
		Map<String, String> newGames = new LinkedHashMap<String, String>();
		for(Gameinfo game1 : games)
		{
			newGames.put(game1.getName(), "CSS/image/games/S_"+game1.getName().replaceAll(" ", "_").replaceAll(":", "_"));
		}
		model.addAttribute("games", newGames);
		return "Video_Play";
	}
}
