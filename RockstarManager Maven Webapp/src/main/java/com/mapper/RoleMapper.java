package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.model.Role;

public interface RoleMapper {

	@Select("Select * from role order by roleid")
	public List<Role> queryAll();
	@Select("select * from role where roleid=#{roleid}")
	public List<Role> queryOneByRoleId(@Param("roleid") String roleid);
	@Insert("insert into role (roleid,rolename,info) values(#{r_id},#{rolename},#{info})")
	public void addRole(Role role,@Param("r_id") String r_id);
	@Delete("delete from role where roleid=#{roleid}")
	public void delRole(@Param("roleid") String roleid);
}
