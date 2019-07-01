package com.model;

import java.sql.Timestamp;

public class Forum {

	private String id;
	private String title;
	private String content;
	private Timestamp mdate;
	private String islocked;
	private String isdelete;
	private String istop;
	private Userset userset;
	private Gameinfo gameinfo;
	
	public String getIslocked() {
		return islocked;
	}
	public void setIslocked(String islocked) {
		this.islocked = islocked;
	}
	public String getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}
	public String getIstop() {
		return istop;
	}
	public void setIstop(String istop) {
		this.istop = istop;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getMdate() {
		return mdate;
	}
	public void setMdate(Timestamp mdate) {
		this.mdate = mdate;
	}
	public Userset getUserset() {
		return userset;
	}
	public void setUserset(Userset userset) {
		this.userset = userset;
	}
	public Gameinfo getGameinfo() {
		return gameinfo;
	}
	public void setGameinfo(Gameinfo gameinfo) {
		this.gameinfo = gameinfo;
	}
	
	
	
}
