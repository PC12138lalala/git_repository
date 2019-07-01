package com.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.GameMapper;
import com.model.Gameinfo;
import com.service.GameService;
import com.util.Pageing;
@Service("gameService")
public class GameImplement implements GameService {

	@Autowired
	private GameMapper gameMapper;

	@Override
	public List<Gameinfo> getAllGameInfo() {
		// TODO Auto-generated method stub
		return gameMapper.queryAllGameInfo();
	}

	@Override
	public void addGame(Gameinfo gameinfo) {
		// TODO Auto-generated method stub
		gameMapper.addGame(gameinfo);
	}

	@Override
	public void delGameByName(String name) {
		// TODO Auto-generated method stub
		gameMapper.delGame(name);
	}

	@Override
	public void pageingBasic(Pageing p) {
		// TODO Auto-generated method stub
		p.setTotalNum(gameMapper.getTotal());
		List<Gameinfo> l = gameMapper.pageingQuery(p.getStart(), p.getPageSize());
		p.setEntity(l);
	}
	
}
