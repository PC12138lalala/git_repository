package com.service.implement;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.ForumMapper;
import com.service.ForumService;
import com.util.Pageing;

@Service("forumService")
public class ForumImpl implements ForumService {

	@Autowired
	private ForumMapper forumMapper;
	@Override
	public void pageingBasic(Pageing p) {
		// TODO Auto-generated method stub
		p.setTotalNum(forumMapper.getTotal());
		p.setEntity(forumMapper.pageingQuery(p.getStart(), p.getPageSize()));
	}
	@Override
	public void updateStatus(String id, String type, String status) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("type", type);
		map.put("status", status);
		forumMapper.updateStatus(map);
	}
	
}
