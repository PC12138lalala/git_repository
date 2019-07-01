package com.service.implement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.VideoCommentMapper;
import com.model.Video_comment;
import com.service.VideoCommentService;
import com.util.SnowflakeIdWorker;
@Service("videoCommentService")
public class VideoCommentImplement implements VideoCommentService {

	@Autowired
	private VideoCommentMapper videoCommentMapper;
	@Override
	public void insertComment(String content,String userid,String id) {
		// TODO Auto-generated method stub
		SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
		long seq = idWorker.nextId();
		videoCommentMapper.insert(content,userid,id,Long.toString(seq));
	}
	@Override
	public void updateLikes(String seq) {
		// TODO Auto-generated method stub
		videoCommentMapper.updateLikes(seq);
	}
	@Override
	public Video_comment queryOneBySeq(String seq) {
		// TODO Auto-generated method stub
		
		return videoCommentMapper.queryBySeq(seq);
	}
	
	

}
