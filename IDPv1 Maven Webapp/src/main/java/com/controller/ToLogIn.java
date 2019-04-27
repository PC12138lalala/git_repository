package com.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Gameinfo;
import com.service.GameService;

@Controller
public class ToLogIn {

	@Autowired
	@Qualifier("gameService")
	private GameService gameService;
	
	@RequestMapping("/LogIn")
	public String toLogInPage(Model model,@Param("ReturnURL")String ReturnURL)
	{
		List<Gameinfo> games = gameService.getAllGames();
		Map<String, String> newGames = new LinkedHashMap<String, String>();
		for(Gameinfo game : games)
		{
			newGames.put(game.getName(), "CSS/image/games/S_"+game.getName().replaceAll(" ", "_").replaceAll(":", "_"));
		}
		model.addAttribute("games", newGames);
		model.addAttribute("ReturnURL",ReturnURL);
		return "LogIn";
	}
}
