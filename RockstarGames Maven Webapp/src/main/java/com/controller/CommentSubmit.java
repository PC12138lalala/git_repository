package com.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Sensitive_word;
import com.model.Video;
import com.service.SensitiveWordService;
import com.service.VideoCommentService;
import com.service.VideoService;
import com.util.SensitiveWordCheck;

@Controller
public class CommentSubmit {

	@Autowired
	@Qualifier("videoService")
	private VideoService videoService;
	
	@Autowired
	@Qualifier("videoCommentService")
	private VideoCommentService videoCommentService;
	
	@Autowired
	@Qualifier("SensitiveWordService")
	private SensitiveWordService sensitiveWordService;
	
	@ModelAttribute
	public void createModel(Model model,String game,String videoName,String newcontent,HttpSession session)
	{
		model.addAttribute("game",game);
		model.addAttribute("videoName",videoName);
		try {
			model.addAttribute("content", new String(newcontent.getBytes("iso-8859-1"),"utf-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("userid",session.getAttribute("userid").toString());
		List<Video> list=videoService.getVideoInfo(videoName);
		model.addAttribute("id", list.get(0).getId());
	}
	@RequestMapping("video/comment_submit")
	public String toSubmit(Model model) throws UnsupportedEncodingException
	{
		String content= model.asMap().get("content").toString();
		List<Sensitive_word> list=sensitiveWordService.getAll();
		SensitiveWordCheck sensitiveWordCheck=new SensitiveWordCheck();
		if(sensitiveWordCheck.hasSensitiveWord(content,list)){
			model.addAttribute("hasSensitiveWords", "true");
			return "comment_submit";
		}
		videoCommentService.insertComment((String)model.asMap().get("content"),(String)model.asMap().get("userid"),(String)model.asMap().get("id"));
		return "comment_submit";
	}
}
