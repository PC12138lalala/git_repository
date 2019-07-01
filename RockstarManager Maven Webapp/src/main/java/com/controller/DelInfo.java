package com.controller;

import java.io.File;
import java.util.ResourceBundle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.GameService;
import com.service.NavService;
import com.service.NewsService;
import com.service.RoleService;
import com.service.VideoService;

@Controller
@RequestMapping("manage")
public class DelInfo {

	@Autowired
	@Qualifier("gameService")
	private GameService gameService;
	
	@Autowired
	@Qualifier("RoleService")
	private RoleService roleService;
	
	@Autowired
	@Qualifier("videoService")
	private VideoService videoService;
	
	@Autowired
	@Qualifier("NavService")
	private NavService navService;
	
	@Autowired
	@Qualifier("newsService")
	private NewsService newsService;
	
	
	@ModelAttribute
	public void addAttribute(Model model,String unique)
	{
		model.addAttribute("unique", unique);
	}
	
	@RequestMapping("/delGame")
	@ResponseBody
	public String delGame(Model model)
	{
		gameService.delGameByName(model.asMap().get("unique").toString());
		return "";
	}
	
	@RequestMapping("/delRole")
	@ResponseBody
	public String delRole(Model model)
	{
		roleService.delRole(model.asMap().get("unique").toString());
		return "";
	}
	
	@RequestMapping("/delVideo")
	@ResponseBody
	public String delVideo(Model model)
	{
		videoService.delVideo(model.asMap().get("unique").toString());
		return "";
	}
	
	@RequestMapping("/delNav")
	@ResponseBody
	public String delNav(Model model)
	{
		navService.delnav(model.asMap().get("unique").toString());
		return "";
	}
	
	@RequestMapping("/delNews")
	@ResponseBody
	public String delNews(Model model)
	{
		String id = model.asMap().get("unique").toString();
		newsService.delNews(id);
		ResourceBundle res = ResourceBundle.getBundle("webapp");
		String path = res.getString("XMLPATH");
		
		File file = new File(path + File.separator + id +".xml");
		if(file.exists()&&file.isFile())
			file.delete();
		return "";
	}
}
