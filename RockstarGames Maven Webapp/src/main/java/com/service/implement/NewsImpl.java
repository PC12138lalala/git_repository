package com.service.implement;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.NewsMapper;
import com.model.News;
import com.service.NewsService;
import com.util.Pageing;

/** 

 * @author 作者 Your-Name: 郭鹏程 

 * @version 创建时间：2019年4月25日 下午6:24:04 

 * 类说明 

 */

@Service("newsService")
public class NewsImpl implements NewsService {

	@Autowired
	private NewsMapper newsMapper;
	
	@Override
	public void addNews(String userid, String id, Timestamp create_date) {
		// TODO Auto-generated method stub
		newsMapper.addNews(userid, id, create_date);
	}

	@Override
	public void pageingBasic(Pageing p) {
		// TODO Auto-generated method stub
		p.setTotalNum(newsMapper.getTotal());
		List<News> l = newsMapper.pageingQuery(p.getStart(), p.getStop());
		p.setEntity(l);
	}

	@Override
	public void delNews(String id) {
		// TODO Auto-generated method stub
		newsMapper.delNewsById(id);
	}

	@Override
	public List<News> queryAll() {
		// TODO Auto-generated method stub
		return newsMapper.queryAll();
	}

	@Override
	public long getTotal() {
		// TODO Auto-generated method stub
		return newsMapper.getTotal();
	}
	
	
	
}
