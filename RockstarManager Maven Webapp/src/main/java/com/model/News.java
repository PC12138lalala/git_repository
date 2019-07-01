package com.model;

import java.sql.Timestamp;

/** 

 * @author 作者 Your-Name: 郭鹏程 

 * @version 创建时间：2019年4月25日 下午5:09:31 

 * 类说明 

 */
public class News extends Entity{

	private Userset userset;
	private String ID;
	private Timestamp CREATE_DATE;
	private Timestamp UPLOAD_DATE;
	private long LIKES;
	public Userset getUserset() {
		return userset;
	}
	public void setUserset(Userset userset) {
		this.userset = userset;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		this.ID = iD;
	}
	public Timestamp getCREATE_DATE() {
		return CREATE_DATE;
	}
	public void setCREATE_DATE(Timestamp cREATE_DATE) {
		this.CREATE_DATE = cREATE_DATE;
	}
	public Timestamp getUPLOAD_DATE() {
		return UPLOAD_DATE;
	}
	public void setUPLOAD_DATE(Timestamp uPLOAD_DATE) {
		this.UPLOAD_DATE = uPLOAD_DATE;
	}
	public long getLikes() {
		return LIKES;
	}
	public void setLikes(long likes) {
		this.LIKES = likes;
	}
	
}
