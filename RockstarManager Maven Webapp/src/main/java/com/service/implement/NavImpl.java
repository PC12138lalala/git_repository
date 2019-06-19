package com.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.NavMapper;
import com.model.Nav;
import com.service.NavService;
import com.util.SnowflakeIdWorker;

@Service("NavService")
public class NavImpl implements NavService {

	@Autowired
	private NavMapper navMapper;
	@Override
	public Nav getNavInfoById(String ids) {
		// TODO Auto-generated method stub
		return navMapper.getNavInfoByIds(ids);
	}
	@Override
	public List<Nav> getAllNav() {
		// TODO Auto-generated method stub
		return navMapper.getAllNavInfo();
	}
	@Override
	public void addNav(Nav nav) {
		// TODO Auto-generated method stub
		SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
		long id = idWorker.nextId();
		navMapper.addNav(Long.toString(id),nav);
	}
	@Override
	public void delnav(String navid) {
		// TODO Auto-generated method stub
		navMapper.delNav(navid);
	}
	
}
