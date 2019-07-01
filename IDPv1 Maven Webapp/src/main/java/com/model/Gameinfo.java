package com.model;

import java.sql.Timestamp;
import java.util.List;

public class Gameinfo {

	private String name;
	private String developer;
	private String platform;
	private Timestamp releasedate;
	private String info;
	private List<Forum> forum;
	private List<Video> video;
	public List<Video> getVideo() {
		return video;
	}
	public void setVideo(List<Video> video) {
		this.video = video;
	}
	public List<Forum> getForum() {
		return forum;
	}
	public void setForum(List<Forum> forum) {
		this.forum = forum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDeveloper() {
		return developer;
	}
	public void setDeveloper(String developer) {
		this.developer = developer;
	}
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	public Timestamp getReleasedate() {
		return releasedate;
	}
	public void setReleasedate(Timestamp releasedate) {
		this.releasedate = releasedate;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	
}
