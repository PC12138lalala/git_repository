package com.service;

import java.util.List;

import com.model.Gameinfo;
import com.util.Pageing;

public interface GameService {

	public List<Gameinfo> getAllGameInfo();
	public void addGame(Gameinfo gameinfo);
	public void delGameByName(String name);
	public void pageingBasic(Pageing p);
}
