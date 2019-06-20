package com.service.implement;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.ForumMapper;
import com.model.Forum;
import com.service.ForumService;
import com.util.Pageing;
import com.util.SnowflakeIdWorker;
@Service("ForumService")
public class ForumImpl implements ForumService {

	@Autowired
	private ForumMapper forumMapper;
	
	@Override
	public void addDisc(Map<String, Object> info) {
		// TODO Auto-generated method stub
		SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
		long id = idWorker.nextId();
		forumMapper.addDisc(info.get("userid").toString(), info.get("name").toString(), Long.toString(id),info.get("title").toString(), info.get("content").toString());
	}

	@Override
	public List<Forum> queryAll() {
		// TODO Auto-generated method stub
		return forumMapper.queryAll();
	}

	@Override
	public void pageingQueryByCondition(String condition,Pageing p) {
		// TODO Auto-generated method stub
		p.setTotalNum(forumMapper.getTotalByCondition(condition));
		p.setEntity(forumMapper.queryByCondition(condition, p.getStart(), p.getPageSize()));
	}

	@Override
	public Forum queryById(String id) {
		// TODO Auto-generated method stub
		return forumMapper.queryById(id);
	}

	@Override
	public List<Forum> queryInfoByUserId(String userid) {
		// TODO Auto-generated method stub
		return forumMapper.queryInfoByUserid(userid);
		
	}

	@Override
	public void pageingBasic(Pageing p) {
		// TODO Auto-generated method stub
		p.setTotalNum(forumMapper.getTotal());
		p.setEntity(forumMapper.pageingQuery(p.getStart(), p.getPageSize()));
	}
	
	
}
