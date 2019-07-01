package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.model.Nav;

public interface NavMapper {

	@Select("Select * from nav where navid =#{ids}")
	public Nav getNavInfoByIds(@Param("ids")String ids );
	@Select("Select * from nav order by navid")
	public List<Nav> getAllNavInfo();
	@Insert("insert into nav(navid,navname,info) values(#{navid},#{navname},#{info})")
	public void addNav(Nav nav);
	@Delete("delete from nav where navid=#{navid}")
	public void delNav(@Param("navid") String navid);
}
