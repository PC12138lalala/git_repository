package com.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.UsersetMapper;
import com.model.Userset;
import com.service.UsersetService;

@Service("usersetService")
public class UsersetImplement implements UsersetService{

	@Autowired
	private UsersetMapper usersetMapper;

	@Override
	public List<Userset> logIn(String account, String pwd) {
		// TODO Auto-generated method stub
		return usersetMapper.findUserByPhoneOrEmail(account, pwd);
	}

	@Override
	public void updateLastSign(String userid) {
		// TODO Auto-generated method stub
		usersetMapper.updateLastSign(userid);
	}
}