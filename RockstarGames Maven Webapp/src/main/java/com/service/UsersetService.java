package com.service;

import java.util.List;

import com.model.Userset;

public interface UsersetService {

	public List<Userset> findAllUser();
	public List<Userset> logIn(String account,String pwd);
	public List<Userset> findUserById(String userid);
	public void updateLastSign(String userid);
	public void updateUserInfo(Userset userset);
	public void insertUser(Userset userset);
	public boolean isSigned(Userset userset);
}
