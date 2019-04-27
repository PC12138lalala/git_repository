package com.service;

import java.sql.Timestamp;

import com.util.Pageing;

/** 

 * @author 作者 Your-Name: 郭鹏程 

 * @version 创建时间：2019年4月25日 下午6:22:41 

 * 类说明 

 */
public interface NewsService {

	public void addNews(String userid,String id,Timestamp create_date);
	public void pageingBasic(Pageing p);
	public void delNews(String id);
}
