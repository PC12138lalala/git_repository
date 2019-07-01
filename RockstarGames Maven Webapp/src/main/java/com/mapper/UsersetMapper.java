package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;

import com.mapper.dynamicSQL.UsersetDynamicSQL;
import com.model.Userset;

public interface UsersetMapper {

	@Select("select * from Userset")
	public List<Userset> selectAll();
	@Select("select * from Userset where (phone=#{account} or email=#{account}) and password=#{pwd}")
	public List<Userset> findUserByPhoneOrEmail(@Param(value = "account") String account,@Param(value = "pwd") String pwd);
	@Select("select * from userset where userid=#{userid}")
	public List<Userset> findUserByUserID(@Param(value="userid") String userid);
	@Update("update userset set LastSign=now() where userid=#{userid}")
	public void updateLastSign(@Param(value="userid") String userid);
	@UpdateProvider(type=UsersetDynamicSQL.class,method="updateUserset")
	public void updateUserInfo(Userset userset);
	@Insert("insert into userset(userid,password,email,phone,username,SIGNDATE,LASTSIGN) values(#{userid},#{password},#{email},#{phone},#{username},now(),now())")
	public void insertUser(Userset userset);
	@Select("select userid from userset where username=#{username} or email=#{email} or phone=#{phone}")
	public List<Userset> checkUser(Userset userset);
	
}
