package com.service;

import java.util.List;

import com.model.Video;
import com.util.Pageing;

public interface VideoService {

	public List<Video> findVideoByCondition(String name,String condition);
	public List<Video> getVideoInfo(String videoName);
	public void UpdateViewTime(String videoName);
	public List<Video> getAllVideoInfo();
	public void addVideo(String video_name,String userid,String name);
	public void delVideo(String id);
	public void pageingBasic(Pageing p);
}
