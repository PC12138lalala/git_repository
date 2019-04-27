package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Role;
import com.service.RoleService;

@Controller
@RequestMapping("manager")
public class RoleInfo {

	@Autowired
	@Qualifier("RoleService")
	private RoleService roleService;
	
	@ModelAttribute
	public void addGameAttribute(String name,String info,Model model)
	{
		Role role=new Role();
		role.setInfo(info);
		role.setRolename(name);
		model.addAttribute("role", role);
	}
	
	@RequestMapping("/addRole")
	public String addRole(Model model)
	{
		Role role=(Role) model.asMap().get("role");
		roleService.addRole(role);
		model.addAttribute("role", roleService.getAllRoleInfo());
		return "role";
	}
}
