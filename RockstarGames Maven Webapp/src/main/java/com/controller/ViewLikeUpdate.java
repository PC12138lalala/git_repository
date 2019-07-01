package com.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Video;
import com.service.ForumCommentService;
import com.service.VideoCommentService;
import com.service.VideoService;

@Controller
public class ViewLikeUpdate {
	
	@Autowired
	@Qualifier("videoService")
	private VideoService videoService;
	
	@Autowired
	@Qualifier("videoCommentService")
	private VideoCommentService videoCommentService;
	
	@Autowired
	@Qualifier("ForumCommentService")
	private ForumCommentService forumCommentService;
	
	@RequestMapping(value="/UpdateViewLike")
	@ResponseBody
	public HashMap<String, Object> update(@RequestParam(value="type") String type,@RequestParam(value="name") String name)
	{
		videoService.UpdateViewTime(name);
		List<Video> list=videoService.getVideoInfo(name);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("view_time", list.get(0).getView_time());
		return map;
	}
	
	@RequestMapping(value="/UpdateCommentLike")
	@ResponseBody
	public HashMap<String, Object> update1(@RequestParam(value="seq") String seq)
	{
		int length=seq.length();
		videoCommentService.updateLikes(seq);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("likes",videoCommentService.queryOneBySeq(seq).getLikes());
		return map;
	}
	
	@RequestMapping(value="/UpdateForumCommentLike")
	@ResponseBody
	public HashMap<String, Object> update2(@RequestParam(value="seq") String seq)
	{
		int length=seq.length();
		forumCommentService.updateLikes(seq);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("likes",forumCommentService.queryOneBySeq(seq).getLikes());
		return map;
	}
	
	
}
