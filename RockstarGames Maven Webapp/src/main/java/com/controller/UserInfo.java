package com.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model.Userset;
import com.service.UsersetService;
import com.util.PhotoResize;
import com.util.MD5;
@Controller
public class UserInfo {
	
	@Autowired
	@Qualifier("usersetService")
	private UsersetService usersetService;
	
	private String flag="";
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String arg0) {
		this.flag += arg0;
	}
	@ModelAttribute
	public void userModel(HttpSession httpSession,Model model,String username,String password,String email,String phone)
	{
		Userset userset=new Userset();
		userset.setUserid(httpSession.getAttribute("userid").toString());
		if(username!=null && !username.trim().equals(""))
		{
			userset.setUsername(username);
			setFlag("1");
		}
		else {
			setFlag("0");
		}
		if(password!=null &&!password.trim().equals(""))
		{
			userset.setPassword(MD5.getInstance().getMD5(password));
			setFlag("1");
		}
		else {
			setFlag("0");
		}
		if(phone!=null && !phone.trim().equals(""))
		{
			userset.setPhone(phone);
			setFlag("1");
		}
		else {
			setFlag("0");
		}
		if(email!=null &&!email.trim().equals(""))
		{
			userset.setEmail(email);
			setFlag("1");
		}
		else {
			setFlag("0");
		}
		model.addAttribute("userset",userset);
	}
	@RequestMapping(value="userInfoUpdate",method=RequestMethod.POST)
	public String UpdateUserInfo(Model model,HttpSession httpSession)
	{
		Userset userset=(Userset) model.asMap().get("userset");
		//System.out.println("flag is --->"+getFlag());
		if(!getFlag().equals("0000"))
		{
			usersetService.updateUserInfo(userset);
		}
		List<Userset> list=usersetService.findUserById(httpSession.getAttribute("userid").toString());
		userset=list.get(0);
		model.addAttribute("userset",userset);
		flag="";
		return "profile";
	}
	

	@RequestMapping(value="ChangePhoto",method=RequestMethod.POST)
	public String update(HttpSession httpSession,@RequestParam MultipartFile photo,HttpServletRequest request) throws Exception
	{
		if(!photo.isEmpty()){
			String path = request.getServletContext().getRealPath("/CSS/image/userPhoto/");
			String filename = httpSession.getAttribute("userid").toString().trim()+"BHP"+photo.getOriginalFilename().substring(photo.getOriginalFilename().lastIndexOf("."));
		    File filepath = new File(path,filename);
	        if (!filepath.getParentFile().exists()) 
	        { 
	        	filepath.getParentFile().mkdirs();
	        }
			photo.transferTo(new File(path+File.separator+ filename));
			PhotoResize photoResize=new PhotoResize();
			photoResize.resizePng(new File(path+File.separator + filename), new File(path+File.separator +filename.replace("BHP", "HP")), 40, 40, true);
			return "index";
		}
		else
		{
			return "profile";
		}
	}
}