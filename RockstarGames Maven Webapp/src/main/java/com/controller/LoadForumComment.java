package com.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContext;

import com.model.Gameinfo;
import com.service.ForumCommentService;
import com.service.ForumService;
import com.service.GameService;
import com.util.Pageing;

@Controller
@RequestMapping("forum")
public class LoadForumComment {

	@Autowired
	@Qualifier("ForumService")
	private ForumService forumService;
	
	@Autowired
	@Qualifier("ForumCommentService")
	private ForumCommentService forumCommentService;
	
	@Autowired
	@Qualifier("gameService")
	private GameService gameService;
	
	@ModelAttribute
	public void loginSigninCheck(HttpSession httpSession,Model model,HttpServletRequest request ,String id,int current)
	{
		if(httpSession.getAttribute("userid")==null || httpSession.getAttribute("userid").equals(""))
		{
			RequestContext req = new RequestContext(request);
			model.addAttribute("loginSigninBlock","<li><a href='SignIn'>"+req.getMessage("Sign In")+"</a></li><li><a href='LogIn'>"+req.getMessage("Join In")+"</a></li>");
		}
		else
		{
			model.addAttribute("forum", forumService.queryById(id));
			model.addAttribute("loginSigninBlock","<li><a href='profile'><img src='CSS/image/userPhoto/"+httpSession.getAttribute("userid")+"HP.png' onerror=this.src='CSS/image/userPhoto/none_s.png'></a></li>");
			model.addAttribute("id", id);
			model.addAttribute("current", current);
		}
	}
	
	@RequestMapping("/content")
	public String toForumContentPage(Model model)
	{
		ResourceBundle rsb = ResourceBundle.getBundle("pageing");
		Pageing page = new Pageing(Integer.parseInt(model.asMap().get("current").toString()), Integer.parseInt(rsb.getString("forum_comment")));
		forumCommentService.pageingBasic(page, model.asMap().get("id").toString());
		model.addAttribute("pageing",page);
		model.addAttribute("forumComment", page.getEntity());
		List<Gameinfo> games = gameService.getAllGames();
		Map<String, String> newGames = new LinkedHashMap<String, String>();
		for(Gameinfo game : games)
		{
			newGames.put(game.getName(), "CSS/image/games/S_"+game.getName().replaceAll(" ", "_").replaceAll(":", "_"));
		}
		model.addAttribute("games", newGames);
		return "content";
	}
}
