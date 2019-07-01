package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.model.Gameinfo;

public interface GameMapper {

	@Select("select * from gameinfo where name=#{name}")
	public List<Gameinfo> queryGameByName(@Param("name") String name);
	@Select("select * from GAMEINFO order by releasedate desc")
	public List<Gameinfo> queryGames();
}
