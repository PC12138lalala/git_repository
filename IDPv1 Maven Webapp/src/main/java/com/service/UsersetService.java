package com.service;

import java.util.List;

import com.model.Userset;

public interface UsersetService {

	public List<Userset> logIn(String account,String pwd);
	public void updateLastSign(String userid);
}
