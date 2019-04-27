package com.service.implement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.VideoCommentMapper;
import com.model.Video_comment;
import com.service.VideoCommentService;
@Service("videoCommentService")
public class VideoCommentImplement implements VideoCommentService {

	@Autowired
	private VideoCommentMapper videoCommentMapper;
	@Override
	public void insertComment(String content,String userid,String id) {
		// TODO Auto-generated method stub

		videoCommentMapper.insert(content,userid,id);
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
