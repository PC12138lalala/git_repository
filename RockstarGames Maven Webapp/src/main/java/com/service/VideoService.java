package com.service;

import java.util.List;

import com.model.Video;

public interface VideoService {

	public List<Video> findVideoByCondition(String name,String condition);
	public List<Video> getVideoInfo(String videoName);
	public void UpdateViewTime(String videoName);
	public List<Video> getAllVideoInfo();
}
