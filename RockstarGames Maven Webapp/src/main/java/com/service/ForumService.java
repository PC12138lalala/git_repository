package com.service;

import java.util.List;
import java.util.Map;

import com.model.Forum;
import com.util.Pageing;

public interface ForumService {

	public void addDisc(Map<String, Object> info);
	public List<Forum> queryAll();
	public void pageingQueryByCondition(String condition,Pageing page);
	public Forum queryById(String id);
	public List<Forum> queryInfoByUserId(String userid);
	public void pageingBasic(Pageing p);
}
