package com.controller;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;

import javax.imageio.ImageIO;
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
			userset.setPassword(password);
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
			resizePng(new File(path+File.separator + filename), new File(path+File.separator +filename.replace("BHP", "HP")), 40, 40, true);
			return "index";
		}
		else
		{
			return "profile";
		}
	}
 
	public static void resizePng(File fromFile, File toFile, int outputWidth, int outputHeight,  
            boolean proportion) {  
        try {  
            BufferedImage bi2 = ImageIO.read(fromFile);  
            int newWidth;  
            int newHeight;  
            // 判断是否是等比缩放  
            if (proportion) {  
                // 为等比缩放计算输出的图片宽度及高度  
                double rate1 = ((double) bi2.getWidth(null)) / (double) outputWidth + 0.1;  
                double rate2 = ((double) bi2.getHeight(null)) / (double) outputHeight + 0.1;  
                // 根据缩放比率大的进行缩放控制  
                double rate = rate1 < rate2 ? rate1 : rate2;  
                newWidth = (int) (((double) bi2.getWidth(null)) / rate);  
                newHeight = (int) (((double) bi2.getHeight(null)) / rate);  
            } else {  
                newWidth = outputWidth; // 输出的图片宽度  
                newHeight = outputHeight; // 输出的图片高度  
            }  
            BufferedImage to = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);  
            Graphics2D g2d = to.createGraphics();  
            to = g2d.getDeviceConfiguration().createCompatibleImage(newWidth, newHeight,  
                    Transparency.TRANSLUCENT);  
            g2d.dispose();  
            g2d = to.createGraphics();  
            @SuppressWarnings("static-access")  
            Image from = bi2.getScaledInstance(newWidth, newHeight, bi2.SCALE_AREA_AVERAGING);  
            g2d.drawImage(from, 0, 0, null);  
            g2d.dispose();  
            ImageIO.write(to, "png", toFile);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    } 
}