package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.Userset;
import com.service.UsersetService;
import com.util.MD5;
import com.util.SnowflakeIdWorker;

@Controller
public class UserSignIn {

	@Autowired
	@Qualifier("usersetService")
	private UsersetService usersetService;
	@ModelAttribute
	public void userModel(Model model,String username,String email,String password1,String phone)
	{
		Userset userset=new Userset();
		userset.setUsername(username);
		userset.setEmail(email);
		userset.setPassword(MD5.getInstance().getMD5(password1));
		userset.setPhone(phone);
		SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
		long id = idWorker.nextId();
		userset.setUserid(Long.toString(id));
		model.addAttribute("userset", userset);
	}
	@RequestMapping(value="UserSignIn",method=RequestMethod.POST)
	public String insert(Model model,HttpSession session)
	{
		Userset userset=(Userset) model.asMap().get("userset");
		if(usersetService.isSigned(userset))
		{
			session.setAttribute("errorInfo", "personal info has signed");
			return "SignIn";
		}
		else 
		{
			usersetService.insertUser(userset);
			session.setAttribute("userid", usersetService.logIn(userset.getEmail(), userset.getPassword()).get(0).getUserid());
			session.setAttribute("userInfo", userset.getEmail());
			session.setAttribute("errorInfo", "");
			
			return "index";
		}
		
	}
}
