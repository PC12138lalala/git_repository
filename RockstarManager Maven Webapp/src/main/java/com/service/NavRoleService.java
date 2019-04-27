package com.service;

import java.util.List;

import com.model.RoleNav;

public interface NavRoleService {

	public List<RoleNav> getNavList(String roleid);
	public List<RoleNav> getAllInfo();
	public void delInfoByRoleId(String roleid);
	public void updataPermission(String roleid,List<String> navidList);
}
