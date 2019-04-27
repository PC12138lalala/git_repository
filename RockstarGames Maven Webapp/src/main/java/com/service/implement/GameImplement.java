package com.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.GameMapper;
import com.model.Gameinfo;
import com.service.GameService;
@Service("gameService")
public class GameImplement implements GameService {

	@Autowired
	private GameMapper gameMapper;
	
	@Override
	public Gameinfo getGameInfoByName(String name) {
		// TODO Auto-generated method stub
		List<Gameinfo> list=(List<Gameinfo>) gameMapper.queryGameByName(name);
		Gameinfo gameinfo=list.get(0);
		return gameinfo;
	}

	@Override
	public List<Gameinfo> getAllGames() {
		// TODO Auto-generated method stub
		return gameMapper.queryGames();
	}

}
