package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.model.Gameinfo;

public interface GameMapper {

	@Select("select * from gameinfo order by name")
	public List<Gameinfo> queryAllGameInfo();
	@Insert("insert into gameinfo values(#{name},#{developer},#{platform},#{releasedate},#{info})")
	public void addGame(Gameinfo gameinfo);
	@Delete("delete from gameinfo where name=#{game}")
	public void delGame(@Param("game") String game);
	@Select("select * from gameinfo where name=#{name}")
	public List<Gameinfo> queryGameByName(@Param("name") String name);
	@Select("select count(*) from gameinfo")
	public Integer getTotal();
	@Select("select name,developer,platform,releasedate,info from (select rownum rn,name,developer,platform,releasedate,info from gameinfo where rownum <#{stop} order by name) t where t.rn>=#{start}")
	public List<Gameinfo> pageingQuery(@Param("start") int start,@Param("stop") int stop);
}
