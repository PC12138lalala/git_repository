package com.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Sensitive_word;
import com.service.ForumCommentService;
import com.service.SensitiveWordService;

@Controller
@RequestMapping("forum")
public class ForumCommentSubmit {

	@Autowired
	@Qualifier("SensitiveWordService")
	private SensitiveWordService sensitiveWordService;
	
	@Autowired
	@Qualifier("ForumCommentService")
	private ForumCommentService forumCommentService;
	
	@ModelAttribute
	public void addAttribute(Model model,HttpSession session,String id,String newcontent)
	{
		
		try {
			model.addAttribute("content", new String(newcontent.getBytes("iso-8859-1"),"utf-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("userid",session.getAttribute("userid").toString());
		model.addAttribute("id", id);
	}
	
	@RequestMapping("/comment_submit")
	public String toSubmit(Model model) throws UnsupportedEncodingException
	{
		String content= model.asMap().get("content").toString();
		List<Sensitive_word> list=sensitiveWordService.getAll();
		for(int i=0;i<list.size();i++)
		{
			if(content.indexOf(list.get(i).getInfo().toString())!=-1)
			{
				return "contented";
			}
			
		}
		forumCommentService.insertComment(content, (String)model.asMap().get("userid"),(String)model.asMap().get("id"));
		return "contented";
	}
}
