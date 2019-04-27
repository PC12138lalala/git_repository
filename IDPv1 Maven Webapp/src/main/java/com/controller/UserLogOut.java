package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserLogOut {

	@RequestMapping("Logout")
	public String logOut(HttpSession session,HttpServletRequest request,@Param("ReturnURL") String ReturnURL,Model model)
	{
		model.addAttribute("ReturnURL",ReturnURL);
		session.setAttribute("ReturnURL", ReturnURL);
		return "Logout";
	}
}
