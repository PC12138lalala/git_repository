package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.UsersetService;

@Controller
public class ChangeUserStatus {
	
	@Autowired
	@Qualifier("usersetService")
	private UsersetService usersetService;

	@ModelAttribute
	public void addAttribute(Model model,String userid,String type,String status)
	{
		model.addAttribute("userid",userid);
		model.addAttribute("type", type);
		model.addAttribute("status", status);
	}
	
	@RequestMapping(value="changeStatus")
	@ResponseBody
	public String changeStatus(Model model)
	{
		usersetService.updateStatus(model.asMap().get("userid").toString(), model.asMap().get("type").toString(), model.asMap().get("status").toString());
		return null;
	}
}
