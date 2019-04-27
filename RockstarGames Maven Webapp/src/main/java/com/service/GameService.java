package com.service;

import java.util.List;

import com.model.Gameinfo;

public interface GameService {

	public Gameinfo getGameInfoByName(String name);
	public List<Gameinfo> getAllGames();
}
