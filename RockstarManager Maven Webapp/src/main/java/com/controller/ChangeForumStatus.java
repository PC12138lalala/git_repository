package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.ForumService;
@Controller
public class ChangeForumStatus {

	@Autowired
	@Qualifier("forumService")
	private ForumService forumService;
	
	@ModelAttribute
	public void addAttribute(Model model,String id,String type,String status)
	{
		model.addAttribute("id",id);
		model.addAttribute("type", type);
		model.addAttribute("status", status);
	}
	
	@RequestMapping(value="changeForumStatus")
	@ResponseBody
	public String changeStatus(Model model)
	{
		forumService.updateStatus(model.asMap().get("id").toString(), model.asMap().get("type").toString(), model.asMap().get("status").toString());
		return null;
	}
}
