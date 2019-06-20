package com.util;

import java.util.ArrayList;
import java.util.List;

public class Pageing {

	private int current = 0;
	private int totalNum = 0;
	private int totalPage = 0;
	private int pageSize = 0;
	private int start = 0;
	private int stop = 0;
	private List entity = new ArrayList();
	
	public int getCurrent() {
		return current;
	}
	public void setCurrent(int current) {
		this.current = current;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
		if(totalNum%pageSize ==0)
			this.totalPage=totalNum/pageSize;
		else
			this.totalPage=totalNum/pageSize+1;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public int getStart() {
		return start;
	}
	public int getStop() {
		return stop;
	}
	public List getEntity() {
		return entity;
	}
	public void setEntity(List entity) {
		this.entity = entity;
	}
	public Pageing(int current,int pageSize) {
		super();
		this.current = current;
		this.pageSize = pageSize;
		start = (current-1)*pageSize;
		stop = start+pageSize;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return current+" "+totalNum+" "+totalPage+" "+pageSize+" "+start+" "+stop+" "+entity.toString();
	}
	
	
}
