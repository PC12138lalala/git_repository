package com.service;

import java.util.List;

import com.model.Role;

public interface RoleService {

	public List<Role> getAllRoleInfo();
	public void addRole(Role role);
	public void delRole(String roleid);
}
