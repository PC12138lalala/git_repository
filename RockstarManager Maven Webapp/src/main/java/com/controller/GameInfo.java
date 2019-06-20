package com.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ResourceBundle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model.Gameinfo;
import com.service.GameService;
import com.util.Pageing;
import com.util.PhotoResize;

@Controller
@RequestMapping("manage")
public class GameInfo {

	@Autowired
	@Qualifier("gameService")
	private GameService gameService;
	
	@ModelAttribute
	public void addGameAttribute(String name,String developer,String platform,String releaseDate,String info,Model model)
	{
		Gameinfo gameinfo=new Gameinfo();
		gameinfo.setName(name);
		gameinfo.setDeveloper(developer);
		gameinfo.setPlatform(platform);
		gameinfo.setReleasedate(Timestamp.valueOf(releaseDate));
		gameinfo.setInfo(info);
		model.addAttribute("gameinfo", gameinfo);
	}
		
	@RequestMapping("/addGame")
	public String addGame(Model model,@RequestParam MultipartFile photo) throws IllegalStateException, IOException
	{
		Gameinfo gameinfo= (Gameinfo)model.asMap().get("gameinfo");
		gameService.addGame(gameinfo);
		ResourceBundle rsb = ResourceBundle.getBundle("pageing");
		Pageing page = new Pageing(1,Integer.parseInt(rsb.getString("game")));
		gameService.pageingBasic(page);
		model.addAttribute("pageing",page);
		model.addAttribute("game", page.getEntity());
		System.out.println(photo.isEmpty());
		if(!photo.isEmpty())
		{
			ResourceBundle res = ResourceBundle.getBundle("webapp");
			String Path = res.getString("GAMEPATH")+"\\";
			String bigPhotoFileName = gameinfo.getName().replaceAll(" ", "_").replaceAll(":", "_")+".png";
			File filepath = new File(Path,bigPhotoFileName);
	        if (!filepath.getParentFile().exists()) 
	        { 
	        	filepath.getParentFile().mkdirs();
	        }
			photo.transferTo(new File(Path+File.separator+ bigPhotoFileName));
			PhotoResize photoResize=new PhotoResize();
			photoResize.resizePng(new File(Path+File.separator + bigPhotoFileName), new File(Path+File.separator +"S_"+bigPhotoFileName), 200 , 247, true);
			
		}
		return "game";
	}
}
