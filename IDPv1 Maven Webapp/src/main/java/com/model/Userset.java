package com.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class Userset implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userid;
	private String password;
	private String email;
	private String phone;
	private String username;
	private String isLocked;
	private String isDelete;
	private Timestamp signDate;
	private Timestamp lastSign;
	private List<Forum> forum;
	private List<Video> video;
	private List<Video_comment> video_comment;
	
	public String getIsLocked() {
		return isLocked;
	}
	public void setIsLocked(String isLocked) {
		this.isLocked = isLocked;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public List<Video_comment> getVideo_comment() {
		return video_comment;
	}
	public void setVideo_comment(List<Video_comment> video_comment) {
		this.video_comment = video_comment;
	}
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Timestamp getSignDate() {
		return signDate;
	}
	public void setSignDate(Timestamp signDate) {
		this.signDate = signDate;
	}
	public Timestamp getLastSign() {
		return lastSign;
	}
	public void setLastSign(Timestamp lastSign) {
		this.lastSign = lastSign;
	}
	
	
}
