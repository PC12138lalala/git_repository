package com.service.implement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.VideoMapper;
import com.model.Video;
import com.service.VideoService;
@Service("videoService")
public class VideoImplement implements VideoService {

	@Autowired
	private VideoMapper videoMapper;
	@Override
	public List<Video> findVideoByCondition(String name, String condition) {
		// TODO Auto-generated method stub
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("name", name);
		param.put("condition", condition);
		List<Video> lists=videoMapper.findVideoOrderByCondition(param);
		return lists;
	}
	@Override
	public List<Video> getVideoInfo(String videoName) {
		// TODO Auto-generated method stub
		return videoMapper.getVideoInfoByVideoName(videoName);
	}
	@Override
	public void UpdateViewTime(String videoName) {
		// TODO Auto-generated method stub
		videoMapper.updateViewTime(videoName);
	}
	@Override
	public List<Video> getAllVideoInfo() {
		// TODO Auto-generated method stub
		return videoMapper.queryAll();
	}
	
	
}
