package com.service;

import com.util.Pageing;

public interface ForumService {

	public void pageingBasic(Pageing p);
	public void updateStatus(String id,String type,String status);
}
