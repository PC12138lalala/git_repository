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
	public List<Userset> findAllUser() {
		// TODO Auto-generated method stub
		List<Userset> usersets=usersetMapper.selectAll();
		return usersets;
	}

	@Override
	public List<Userset> logIn(String account, String pwd) {
		// TODO Auto-generated method stub
		return usersetMapper.findUserByPhoneOrEmail(account, pwd);
	}

	@Override
	public List<Userset> findUserById(String userid) {
		// TODO Auto-generated method stub
		List<Userset> list=usersetMapper.findUserByUserID(userid);
		return list;
	}

	@Override
	public void updateLastSign(String userid) {
		// TODO Auto-generated method stub
		usersetMapper.updateLastSign(userid);
	}

	@Override
	public void updateUserInfo(Userset userset) {
		// TODO Auto-generated method stub
		usersetMapper.updateUserInfo(userset);
	}

	@Override
	public void insertUser(Userset userset) {
		// TODO Auto-generated method stub
		usersetMapper.insertUser(userset);
	}

	@Override
	public boolean isSigned(Userset userset) {
		// TODO Auto-generated method stub
		List<Userset> list=usersetMapper.checkUser(userset);
		if(list.isEmpty())
			return false;
		return true;
		
	}
}