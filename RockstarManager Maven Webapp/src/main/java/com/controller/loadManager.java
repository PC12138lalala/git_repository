package com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.Nav;
import com.model.RoleNav;
import com.model.Userset;
import com.service.ForumService;
import com.service.GameService;
import com.service.NavRoleService;
import com.service.NavService;
import com.service.NewsService;
import com.service.RoleService;
import com.service.UsersetService;
import com.service.VideoService;
import com.util.Pageing;

@Controller
@RequestMapping("manage")
public class loadManager {

	@Autowired
	@Qualifier("usersetService")
	private UsersetService usersetService;
	
	@Autowired
	@Qualifier("NavRoleService")
	private NavRoleService navRoleService;
	
	@Autowired
	@Qualifier("NavService")
	private NavService navService;
	
	@Autowired
	@Qualifier("gameService")
	private GameService gameService;
	
	@Autowired
	@Qualifier("RoleService")
	private RoleService roleService;
	
	@Autowired
	@Qualifier("videoService")
	private VideoService videoService;
	
	@Autowired
	@Qualifier("forumService")
	private ForumService forumService;
	
	@Autowired
	@Qualifier("newsService")
	private NewsService newsService;
	
	@RequestMapping("/{path}")
	public String toPage(@PathVariable(value="path") String path,HttpSession httpSession,Model model)
	{
		if(httpSession.getAttribute("userid")==null || httpSession.getAttribute("userid").equals(""))
		{
			//model.addAttribute("loginSigninBlock","<li><a href='SignIn' target='_top'>Sign In</a></li><li><a href='LogIn' target='_top'>Join In</a></li>");
			return "LogIn";
		}
		else
		{
			model.addAttribute("loginSigninBlock","<li><a href='' target='_top'><img src='CSS/image/userPhoto/"+httpSession.getAttribute("userid")+"HP.png' onerror=this.src='CSS/image/userPhoto/none_s.png'></a></li>");
			return path;
		}
		
	}
	@RequestMapping("/nav")
	public String toNav(HttpSession session,Model model)
	{
		List<Userset> list=usersetService.findUserById(session.getAttribute("userid").toString());
		Userset userset=list.get(0);
		String roleid=userset.getRole().getRoleid().toString();
		List<RoleNav> navList=navRoleService.getNavList(roleid);
		if(navList.size()==0)
		{
			System.out.println("无导航权限");
			return "nav";
		}
		List<Nav> navs=new ArrayList<Nav>();
		for(int i=0;i<navList.size();i++)
		{
			navs.add(navList.get(i).getNav());
		}
		model.addAttribute("nav", navs);
		return "nav";
	}
	@RequestMapping("/profile")
	public String toProfile(Model model,@RequestParam("target") String target)
	{
		return "profile";
	}
	@RequestMapping("/role")
	public String toRole(Model model,@RequestParam("target") String target)
	{
		model.addAttribute("role", roleService.getAllRoleInfo());
		return "role";
	}
	@RequestMapping("/video")
	public String toVideo(Model model,@RequestParam("target") String target,@RequestParam("current") int current)
	{
		ResourceBundle rsb = ResourceBundle.getBundle("pageing");
		Pageing page = new Pageing(current,Integer.parseInt(rsb.getString("video")));
		videoService.pageingBasic(page);
		model.addAttribute("pageing",page);
		model.addAttribute("game", page.getEntity().get(0));
		model.addAttribute("video", page.getEntity().get(1));
		return "video";
	}
	@RequestMapping("/CSS")
	public String toCSS(Model model,@RequestParam("target") String target,HttpServletRequest request)
	{
		return "CSS";
	}
	@RequestMapping("/news")
	public String toNews(Model model,@RequestParam("target") String target,@RequestParam("current") int current)
	{
		ResourceBundle rsb = ResourceBundle.getBundle("pageing");
		Pageing page = new Pageing(current,Integer.parseInt(rsb.getString("news")));
		newsService.pageingBasic(page);
		model.addAttribute("pageing",page);
		model.addAttribute("news", page.getEntity());
		return "news";
	}
	@RequestMapping("/right")
	public String toRight(Model model,@RequestParam("target") String target)
	{
		model.addAttribute("nav" , navService.getAllNav());
		return "right";
	}
	@RequestMapping("/user")
	public String toUser(Model model,@RequestParam("target") String target,@RequestParam("current") int current)
	{
		ResourceBundle rsb = ResourceBundle.getBundle("pageing");
		Pageing page = new Pageing(current,Integer.parseInt(rsb.getString("user")));
		usersetService.pageingBasic(page);
		model.addAttribute("pageing",page);
		model.addAttribute("userset", page.getEntity());
		model.addAttribute("role", roleService.getAllRoleInfo());
		return "user";
	}
	@RequestMapping("/forum")
	public String toForum(Model model,@RequestParam("target") String target,@RequestParam("current") int current)
	{
		ResourceBundle rsb = ResourceBundle.getBundle("pageing");
		Pageing page = new Pageing(current,Integer.parseInt(rsb.getString("forum_home")));
		
		forumService.pageingBasic(page);
		model.addAttribute("pageing",page);
		model.addAttribute("forum", page.getEntity());
		return "forum";
	}
	@RequestMapping("/game")
	public String toGame(Model model,@RequestParam("target") String target,@RequestParam("current") int current)
	{
		ResourceBundle rsb = ResourceBundle.getBundle("pageing");
		Pageing page = new Pageing(current,Integer.parseInt(rsb.getString("game")));
		gameService.pageingBasic(page);
		model.addAttribute("pageing",page);
		model.addAttribute("game", page.getEntity());
		return "game";
	}
	@RequestMapping("/Assign permissions")
	public String toAssignPermissions(Model model,@RequestParam("target") String target)
	{
		List<RoleNav> roleNav=navRoleService.getAllInfo();
		model.addAttribute("navrole", roleNav);
		model.addAttribute("role", roleService.getAllRoleInfo());
		model.addAttribute("nav" , navService.getAllNav());
		return "Assign permissions";
	}
}
