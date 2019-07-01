package com.model;

import java.sql.Timestamp;
import java.util.List;

public class Video {

	private String id;
	private String video_name;
	private String view_time;
	private Timestamp update_date;
	private Userset userset;
	private Gameinfo gameinfo;
	private List<Video_comment> video_comment;
	public List<Video_comment> getVideo_comment() {
		return video_comment;
	}
	public void setVideo_comment(List<Video_comment> video_comment) {
		this.video_comment = video_comment;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getVideo_name() {
		return video_name;
	}
	public void setVideo_name(String video_name) {
		this.video_name = video_name;
	}
	public String getView_time() {
		return view_time;
	}
	public void setView_time(String view_time) {
		this.view_time = view_time;
	}
	public Timestamp getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Timestamp update_date) {
		this.update_date = update_date;
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
