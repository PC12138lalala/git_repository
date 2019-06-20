package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.model.Userset;

public interface UsersetMapper {

	@Select("select * from Userset where (phone=#{account} or email=#{account}) and password=#{pwd}")
	public List<Userset> findUserByPhoneOrEmail(@Param(value = "account") String account,@Param(value = "pwd") String pwd);
	@Update("update userset set LastSign=now() where userid=#{userid}")
	public void updateLastSign(@Param(value="userid") String userid);
	
}
