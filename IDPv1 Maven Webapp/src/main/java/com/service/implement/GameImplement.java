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
	public List<Gameinfo> getAllGames() {
		// TODO Auto-generated method stub
		return gameMapper.queryGames();
	}

}
