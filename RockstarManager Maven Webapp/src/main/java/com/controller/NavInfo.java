package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Nav;
import com.service.NavService;

@Controller
@RequestMapping("manage")
public class NavInfo {
	
	@Autowired
	@Qualifier("NavService")
	private NavService navService;
	
	@ModelAttribute
	public void addAttribute(Model model,String name,String info)
	{
		Nav nav=new Nav();
		nav.setNavname(name);
		nav.setInfo(info);
		model.addAttribute("nav",nav);
	}
	
	@RequestMapping("/addNav")
	public String addNav(Model model)
	{
		Nav nav=(Nav) model.asMap().get("nav");
		navService.addNav(nav);
		model.addAttribute("nav" , navService.getAllNav());
		return "right";
	}
}