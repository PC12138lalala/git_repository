package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.model.Gameinfo;

public interface GameMapper {

	@Select("select * from GAMEINFO order by releasedate desc")
	public List<Gameinfo> queryGames();
}
