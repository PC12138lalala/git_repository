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
import com.model.Userset;
import com.service.ForumService;
import com.service.GameService;
import com.service.UsersetService;
import com.util.Pageing;

@Controller
@RequestMapping("forum")
public class LoadForumByCondition {

	@Autowired
	@Qualifier("usersetService")
	private UsersetService usersetService;
	
	@Autowired
	@Qualifier("ForumService")
	private ForumService forumService;
	
	@Autowired
	@Qualifier("gameService")
	private GameService gameService;
	
	@ModelAttribute
	public void loginSigninCheck(HttpSession httpSession,Model model,HttpServletRequest request,String condition,int current)
	{
		if(httpSession.getAttribute("userid")==null || httpSession.getAttribute("userid").equals(""))
		{
			RequestContext req = new RequestContext(request);
			model.addAttribute("loginSigninBlock","<li><a href='SignIn'>"+req.getMessage("Sign In")+"</a></li><li><a href='LogIn'>"+req.getMessage("Join In")+"</a></li>");
		}
		else
		{
			ResourceBundle rsb = ResourceBundle.getBundle("pageing");
			Pageing page = new Pageing(current, Integer.parseInt(rsb.getString("forum_home")));
			forumService.pageingQueryByCondition(condition, page);
			model.addAttribute("forum", page.getEntity());
			model.addAttribute("pageing",page);
			String userid=httpSession.getAttribute("userid").toString();
			List<Userset> list=usersetService.findUserById(userid);
			Userset userset=list.get(0);
			model.addAttribute("userset", userset);
			model.addAttribute("posts", forumService.queryInfoByUserId(userid).size());
			model.addAttribute("loginSigninBlock","<li><a href='profile'><img src='CSS/image/userPhoto/"+httpSession.getAttribute("userid")+"HP.png' onerror=this.src='CSS/image/userPhoto/none_s.png'></a></li>");
		}
		List<Gameinfo> games = gameService.getAllGames();
		Map<String, String> newGames = new LinkedHashMap<String, String>();
		for(Gameinfo game : games)
		{
			newGames.put(game.getName(), "CSS/image/games/S_"+game.getName().replaceAll(" ", "_").replaceAll(":", "_"));
		}
		model.addAttribute("games", newGames);
	}
	
	@RequestMapping("/condition")
	public String toForumPage()
	{
		return "forum";
	}
}
