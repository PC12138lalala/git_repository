package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.ResourceBundle;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model.Video;
import com.service.GameService;
import com.service.VideoService;
import com.util.Pageing;

@Controller
@RequestMapping("manage")
public class VideoInfo {

	@Autowired
	@Qualifier("videoService")
	private VideoService videoService;
	
	@Autowired
	@Qualifier("gameService")
	private GameService gameService;
	
	@ModelAttribute
	public void addGameAttribute(String name,String video_name,HttpSession session,Model model)
	{
		Video video=new Video();
		video.setVideo_name(video_name);
		model.addAttribute("video1",video);
		model.addAttribute("name",name);
		model.addAttribute("userid", session.getAttribute("userid"));
	}
	
	@RequestMapping("/addVideo")
	public String addGame(Model model,@RequestParam MultipartFile photo,@RequestParam MultipartFile video) throws IllegalStateException, IOException
	{
		Video video1=(Video)model.asMap().get("video1");
		videoService.addVideo(video1.getVideo_name(),(String)model.asMap().get("userid"),(String)model.asMap().get("name"));
		ResourceBundle rsb = ResourceBundle.getBundle("pageing");
		Pageing page = new Pageing(1,Integer.parseInt(rsb.getString("video")));
		videoService.pageingBasic(page);
		model.addAttribute("pageing",page);
		model.addAttribute("game", page.getEntity().get(0));
		model.addAttribute("video", page.getEntity().get(1));
		
		if(!photo.isEmpty())
		{
			ResourceBundle res = ResourceBundle.getBundle("webapp");
			String Path = res.getString("VIDEOPATH")+"\\poster\\"+(String)model.asMap().get("name").toString().replaceAll(":", " ")+"\\";
			String poster = photo.getOriginalFilename();
			File filepath = new File(Path,poster);
	        if (!filepath.getParentFile().exists()) 
	        { 
	        	filepath.getParentFile().mkdirs();
	        }
			photo.transferTo(new File(Path+"\\"+File.separator+ poster));
			
		}
		if(!video.isEmpty())
		{
			ResourceBundle res = ResourceBundle.getBundle("webapp");
			String Path = res.getString("VIDEOPATH")+"\\video\\"+(String)model.asMap().get("name").toString().replaceAll(":", " ")+"\\";
			String videoName = video.getOriginalFilename();
			File filepath = new File(Path,videoName);
	        if (!filepath.getParentFile().exists()) 
	        { 
	        	filepath.getParentFile().mkdirs();
	        }
	        video.transferTo(new File(Path+File.separator+ videoName));
			
			
		}
		
		return "video";
	}
}
