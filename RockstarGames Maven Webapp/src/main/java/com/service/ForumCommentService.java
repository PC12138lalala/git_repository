package com.service;

import java.util.List;

import com.model.Forum_comment;
import com.util.Pageing;

public interface ForumCommentService {

	public void insertComment(String content,String userid,String id);
	public void updateLikes(String seq);
	public Forum_comment queryOneBySeq(String seq);
	public List<Forum_comment> getCommentById(String id);
	public void pageingBasic(Pageing p,String id);
}
