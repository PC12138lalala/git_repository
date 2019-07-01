package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Userset;
import com.service.UsersetService;
import com.util.MD5;

@Controller
public class UserLogIn {

	@Autowired
	@Qualifier("usersetService")
	private UsersetService usersetService;
	
	@ModelAttribute
	public void logInfo(String account,String pwd,Model model,String ReturnURL)
	{
		model.addAttribute("account",account);
		model.addAttribute("pwd",MD5.getInstance().getMD5(pwd));
		model.addAttribute("ReturnURL", ReturnURL);
	}
	
	@RequestMapping(value="UserLogIn")
	public String userLogIn(Model model,HttpSession httpSession,HttpServletRequest request,@Param("ReturnURL")String ReturnURL)
	{
		
		String account=(String) model.asMap().get("account");
		String pwd=(String) model.asMap().get("pwd");
		if(account!=null && pwd!=null && !account.trim().equals("") && !pwd.trim().equals(""))
		{
			List<Userset> list=usersetService.logIn(account, pwd);
			if(list.size()>0)
			{
				if(list.get(0).getUserid()!=null && list.get(0).getIsDelete().equals("N") && list.get(0).getIsLocked().equals("N"))
				{
					httpSession.setAttribute("userInfo", account);
					httpSession.setAttribute("userid", list.get(0).getUserid());
					model.addAttribute("errorInfo", "");
					usersetService.updateLastSign(list.get(0).getUserid());
					model.addAttribute("permission", "true");
					model.addAttribute("account", account);
					model.addAttribute("password", pwd);
					model.addAttribute("ReturnURL",ReturnURL);
					httpSession.setAttribute("ReturnURL", ReturnURL);
					return "index";
				}
				else if(!list.get(0).getIsDelete().equals("N") || !list.get(0).getIsLocked().equals("N"))
				{
					model.addAttribute("errorInfo", "your account is locked");
				}
			}
			else 
			{
				model.addAttribute("errorInfo", "user account OR password error");
			}
			
		}
		return "LogIn";
	}
	
}
