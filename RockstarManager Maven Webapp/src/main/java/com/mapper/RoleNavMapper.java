package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;

import com.model.RoleNav;

public interface RoleNavMapper {

	@Select("select * from navrole where roleid=#{roleid}")
	@Results({
		@Result(column="roleid",property="role",
				one=@One(select="com.mapper.RoleMapper.queryOneByRoleId",fetchType=FetchType.LAZY)),
		@Result(column="navid",property="nav",
				one=@One(select="com.mapper.NavMapper.getNavInfoByIds",fetchType=FetchType.LAZY))
	})
	public List<RoleNav> getNavInfoByRoleId(@Param("roleid") String roleid);
	@Select("select * from navrole order by roleid ,navid asc")
	@Results({
		@Result(column="roleid",property="role",
				one=@One(select="com.mapper.RoleMapper.queryOneByRoleId",fetchType=FetchType.LAZY)),
		@Result(column="navid",property="nav",
				one=@One(select="com.mapper.NavMapper.getNavInfoByIds",fetchType=FetchType.LAZY))
	})
	public List<RoleNav> getAllInfo();
	@Delete("delete from navrole where roleid=#{roleid}")
	public void delInfoByRoleId(@Param("roleid") String roleid);
	@Insert("insert into navrole(roleid,navid) values(#{roleid},#{navid})")
	public void addNav(@Param("roleid") String roleid,@Param("navid") String navid);
}
