package com.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Gameinfo;
import com.model.Userset;
import com.service.ForumService;
import com.service.GameService;
import com.service.UsersetService;
import com.util.Pageing;

@Controller
@RequestMapping("forum")
public class AddDiscussion {

	@Autowired
	@Qualifier("ForumService")
	private ForumService forumService;
	
	@Autowired
	@Qualifier("usersetService")
	private UsersetService usersetService;
	
	@Autowired
	@Qualifier("gameService")
	private GameService gameService;
	
	@ModelAttribute
	public void addAttribute(HttpSession session,Model model,String name,String title,String content)
	{
		Map<String, Object> info=new HashMap<String, Object>();
		info.put("userid", session.getAttribute("userid"));
		info.put("name", name);
		info.put("title", title);
		info.put("content",content);
		model.addAttribute("info", info);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/discSubmit")
	public String discSubmit(Model model,HttpSession session)
	{
		forumService.addDisc((Map<String, Object>) model.asMap().get("info"));
		ResourceBundle rsb = ResourceBundle.getBundle("pageing");
		Pageing page = new Pageing(1, Integer.parseInt(rsb.getString("forum_home")));
		forumService.pageingBasic(page);
		model.addAttribute("forum", page.getEntity());
		model.addAttribute("pageing",page);
		String userid=session.getAttribute("userid").toString();
		List<Userset> list=usersetService.findUserById(userid);
		Userset userset=list.get(0);
		model.addAttribute("userset", userset);
		model.addAttribute("posts", forumService.queryInfoByUserId(userid).size());
		model.addAttribute("loginSigninBlock","<li><a href='profile'><img src='CSS/image/userPhoto/"+session.getAttribute("userid")+"HP.png' onerror=this.src='CSS/image/userPhoto/none_s.png'></a></li>");
		List<Gameinfo> games = gameService.getAllGames();
		Map<String, String> newGames = new LinkedHashMap<String, String>();
		for(Gameinfo game : games)
		{
			newGames.put(game.getName(), "CSS/image/games/S_"+game.getName().replaceAll(" ", "_").replaceAll(":", "_"));
		}
		model.addAttribute("games", newGames);
		
		return "forum";
	}
}
