package com.service.implement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.GameMapper;
import com.mapper.VideoMapper;
import com.model.Gameinfo;
import com.model.Video;
import com.service.VideoService;
import com.util.Pageing;
@Service("videoService")
public class VideoImplement implements VideoService {

	@Autowired
	private VideoMapper videoMapper;
	@Autowired
	private GameMapper gameMapper;
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
	@Override
	public void addVideo(String video_name, String userid,String name) {
		// TODO Auto-generated method stub
		videoMapper.addVideo(video_name, userid, name);
	}
	@Override
	public void delVideo(String id) {
		// TODO Auto-generated method stub
		videoMapper.delVideo(id);
	}
	@Override
	public void pageingBasic(Pageing p) {
		// TODO Auto-generated method stub
		p.setTotalNum(videoMapper.getTotal());
		List<Gameinfo> game = gameMapper.queryAllGameInfo();
		List<Video> video = videoMapper.pageingQuery(p.getStart(), p.getStop());
		List l = new ArrayList();
		l.add(game);
		l.add(video);
		p.setEntity(l);
	}
	
}
