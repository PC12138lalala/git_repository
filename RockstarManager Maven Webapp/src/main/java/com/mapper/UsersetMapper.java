package com.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.mapping.FetchType;

import com.mapper.dynamicSQL.UsersetDynamicSQL;
import com.model.Userset;

public interface UsersetMapper {

	@Select("select * from Userset where userid<>'0000' order by userid")
	@Results({
		@Result(column="roleid",property="role",
				one=@One(select="com.mapper.RoleMapper.queryOneByRoleId",fetchType=FetchType.LAZY))
	})
	public List<Userset> selectAll();
	@Select("select * from Userset where (phone=#{account} or email=#{account}) and password=#{pwd}")
	public List<Userset> findUserByPhoneOrEmail(@Param(value = "account") String account,@Param(value = "pwd") String pwd);
	@Select("select * from userset where userid=#{userid}")
	@Results({
		@Result(column="roleid",property="role",
				one=@One(select="com.mapper.RoleMapper.queryOneByRoleId",fetchType=FetchType.LAZY))
	})
	public List<Userset> findUserByUserID(@Param(value="userid") String userid);
	@Update("update userset set LastSign=sysdate where userid=#{userid}")
	public void updateLastSign(@Param(value="userid") String userid);
	@UpdateProvider(type=UsersetDynamicSQL.class,method="updateUserset")
	public void updateUserInfo(Userset userset);
	@Insert("insert into userset(userid,password,email,phone,username,SIGNDATE,LASTSIGN) values(replace(lpad(idplus.nextval,4,'0'),'','0'),#{password},#{email},#{phone},#{username},sysdate,sysdate)")
	public void insertUser(Userset userset);
	@Select("select userid from userset where username=#{username} or email=#{email} or phone=#{phone}")
	public List<Userset> checkUser(Userset userset);
	@UpdateProvider(type=UsersetDynamicSQL.class,method="updateStatus")
	public void updateStatus(Map<String, Object> map);
	@Select("select count(*) from userset")
	public Integer getTotal();
	@Select("select userid,password,email,phone,username,signdate,lastsign,islocked,isdelete,roleid from (select rownum rn,userid,password,email,phone,username,signdate,lastsign,islocked,isdelete,roleid from userset where rownum<#{stop} order by userid) t where t.rn>=#{start}")
	@Results({
		@Result(column="roleid",property="role",
				one=@One(select="com.mapper.RoleMapper.queryOneByRoleId",fetchType=FetchType.LAZY))
	})
	public List<Userset> pageingQuery(@Param("start") int start,@Param("stop") int stop);
}
