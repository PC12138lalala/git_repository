package com.service;

import com.model.Video_comment;

public interface VideoCommentService {

	public void insertComment(String content,String userid,String id);
	public void updateLikes(String seq);
	public Video_comment queryOneBySeq(String seq);
}
