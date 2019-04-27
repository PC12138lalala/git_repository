package com.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.RoleMapper;
import com.model.Role;
import com.service.RoleService;
@Service("RoleService")
public class RoleImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public List<Role> getAllRoleInfo() {
		// TODO Auto-generated method stub
		return roleMapper.queryAll();
	}

	@Override
	public void addRole(Role role) {
		// TODO Auto-generated method stub
		roleMapper.addRole(role);
	}

	@Override
	public void delRole(String roleid) {
		// TODO Auto-generated method stub
		roleMapper.delRole(roleid);
	}
	
}
