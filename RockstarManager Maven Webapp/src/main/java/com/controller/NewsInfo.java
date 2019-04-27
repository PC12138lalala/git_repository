package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.sql.Timestamp;
import java.util.Date;
import java.util.ResourceBundle;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.News;
import com.service.NewsService;
import com.util.MD5;
import com.util.Pageing;

/** 

 * @author 作者 Your-Name: 郭鹏程 

 * @version 创建时间：2019年4月25日 下午5:05:56 

 * 类说明 

 */
@Controller
@RequestMapping("manager")
public class NewsInfo {
	
	@Autowired
	@Qualifier("newsService")
	private NewsService newsService;
	
	@ModelAttribute
	public void addNewsAttribute(Model model,HttpSession session,String create_date,
			String title_1,String title_2,String title_3,String rank,String content){
		
		News news = new News();
		String id = MD5.getInstance().getMD5(new Date().toGMTString().toString());
		news.setID(id);
		news.setCREATE_DATE(Timestamp.valueOf(create_date));
		model.addAttribute("news", news);
		model.addAttribute("id", id);
		model.addAttribute("userid",session.getAttribute("userid"));
		
		ResourceBundle res = ResourceBundle.getBundle("webapp");
		String path = res.getString("XMLPATH");
		
		File file = new File(path + File.separator + id +".xml");
		try {
			RandomAccessFile f1=new RandomAccessFile(file,"rw");
			f1.writeBytes("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			f1.writeBytes("<news>");
			f1.writeBytes("<title_1>"+title_1+"</title_1>");
			f1.writeBytes("<title_2>"+title_2+"</title_2>");
			f1.writeBytes("<title_3>"+title_3+"</title_3>");
			f1.writeBytes("<author>"+session.getAttribute("userid")+"</author>");
			f1.writeBytes("<create_date>"+create_date+"</create_date>");
			f1.writeBytes("<rank>"+rank+"</rank>");
			f1.writeBytes("<id>"+id+"</id>");
			f1.writeBytes("<content>"+content+"</content>");
			f1.writeBytes("</news>");
			
			f1.close();
		} 
		catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/addNews")
	public String addNews(Model model){
		News news = (News) model.asMap().get("news");
		newsService.addNews((String) model.asMap().get("userid"), news.getID(), news.getCREATE_DATE());
		ResourceBundle rsb = ResourceBundle.getBundle("pageing");
		Pageing page = new Pageing(1,Integer.parseInt(rsb.getString("news")));
		newsService.pageingBasic(page);
		model.addAttribute("pageing",page);
		model.addAttribute("news", page.getEntity());
		
		return "news";
	}
	
	
	
}
