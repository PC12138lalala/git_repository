package com.service;

import java.util.List;

import com.model.Nav;

public interface NavService {

	public Nav getNavInfoById(String ids);
	public List<Nav> getAllNav();
	public void addNav(Nav nav);
	public void delnav(String navid);
}
