package com.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.RoleNavMapper;
import com.model.RoleNav;
import com.service.NavRoleService;
@Service("NavRoleService")
public class NavRoleImpl implements NavRoleService {

	@Autowired
	private RoleNavMapper roleNavMapper;
	@Override
	public List<RoleNav> getNavList(String roleid) {
		// TODO Auto-generated method stub
		return roleNavMapper.getNavInfoByRoleId(roleid);
	}
	@Override
	public List<RoleNav> getAllInfo() {
		// TODO Auto-generated method stub
		return roleNavMapper.getAllInfo();
	}
	@Override
	public void delInfoByRoleId(String roleid) {
		// TODO Auto-generated method stub
		roleNavMapper.delInfoByRoleId(roleid);
	}
	@Override
	public void updataPermission(String roleid, List<String> navidList) {
		// TODO Auto-generated method stub
		for(int i=0;i<navidList.size();i++)
			roleNavMapper.addNav(roleid, navidList.get(i));
	}
	
}
