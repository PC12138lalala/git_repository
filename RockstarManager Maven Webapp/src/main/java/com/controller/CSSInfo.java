package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ResourceBundle;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("manager")
public class CSSInfo {

	@RequestMapping("/changeCSS")
	public String change(@RequestParam MultipartFile css) throws IllegalStateException, IOException
	{
		if(!css.isEmpty())
		{
			ResourceBundle res = ResourceBundle.getBundle("webapp");
			String projectPath = res.getString("PROJECTLOCATION")+"\\src\\main\\webapp\\CSS\\";
			String serverPath = res.getString("SERVERLOCATION")+"\\webapps\\ROOT\\CSS\\";
			String cssName = css.getOriginalFilename();
			File filepath = new File(projectPath,cssName);
	        if (!filepath.getParentFile().exists()) 
	        { 
	        	filepath.getParentFile().mkdirs();
	        }
			css.transferTo(new File(projectPath+"\\"+File.separator+ cssName));
			
			FileInputStream input1 = new FileInputStream(new File(projectPath+File.separator+ cssName));
			FileOutputStream output1 = new FileOutputStream(new File(serverPath+File.separator+ cssName));
			
			byte[] bt = new byte[1024];  
	        int realbyte = 0;  
	        while ((realbyte = input1.read(bt)) > 0) {  
	            output1.write(bt,0,realbyte);  
	        } 
	        output1.close();
		}
		return "CSS";
	}
}
