package com.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class generalController {


	@RequestMapping(value={"/{pageName}","/"})
	public String toAnyPage(@PathVariable String pageName,@Param("ReturnURL")String ReturnURL,Model model)
	{
		model.addAttribute("ReturnURL",ReturnURL);
		return pageName;
	}
}
