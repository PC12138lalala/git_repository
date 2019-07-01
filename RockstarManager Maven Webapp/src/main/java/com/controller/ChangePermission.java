package com.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.service.NavRoleService;

@Controller
public class ChangePermission {

	@Autowired
	@Qualifier("NavRoleService")
	private NavRoleService navRoleService;
	
	@ModelAttribute
	public void addAttribute(Model model,String roleid,String data)
	{
		model.addAttribute("roleid",roleid);
		model.addAttribute("data", data);
	}
	
	@RequestMapping("changePermission")
	@ResponseBody
	public String doUpdate(Model model)
	{
		navRoleService.delInfoByRoleId(model.asMap().get("roleid").toString());
		String data=model.asMap().get("data").toString();
		List<String> dataList=new ArrayList<String>();
		for(int i=0;i<data.length()/7;i++)
		{
			dataList.add(data.substring(1+(i*7),5+(i*7)));
		}
		navRoleService.updataPermission(model.asMap().get("roleid").toString(), dataList);
		return "";
	}
}
