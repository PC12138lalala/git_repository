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
	@Insert("insert into role (roleid,rolename,info) values(replace(lpad(ROLEIDSEQ.nextval,4,'0'),'','0'),#{rolename},#{info})")
	public void addRole(Role role);
	@Delete("delete from role where roleid=#{roleid}")
	public void delRole(@Param("roleid") String roleid);
}
