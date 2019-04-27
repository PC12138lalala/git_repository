package com.model;

import java.sql.Timestamp;

public class Video_comment {

	private String content;
	private Timestamp cdate;
	private long likes;
	private Userset userset;
	private Video video;
	private String seq;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getCdate() {
		return cdate;
	}
	public void setCdate(Timestamp cdate) {
		this.cdate = cdate;
	}
	public long getLikes() {
		return likes;
	}
	public void setLikes(long likes) {
		this.likes = likes;
	}
	public Userset getUserset() {
		return userset;
	}
	public void setUserset(Userset userset) {
		this.userset = userset;
	}
	public Video getVideo() {
		return video;
	}
	public void setVideo(Video video) {
		this.video = video;
	}
	
}
