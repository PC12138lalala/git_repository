package com.service.implement;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.ForumCommentMapper;
import com.model.Forum_comment;
import com.service.ForumCommentService;
import com.util.Pageing;
@Service("ForumCommentService")
public class ForumCommentImpl implements ForumCommentService {

	@Autowired
	private ForumCommentMapper forumCommentMapper;
	
	@Override
	public void insertComment(String content, String userid, String id) {
		// TODO Auto-generated method stub
		forumCommentMapper.insert(content, userid, id);
	}

	@Override
	public void updateLikes(String seq) {
		// TODO Auto-generated method stub
		forumCommentMapper.updateLikes(seq);
	}

	@Override
	public Forum_comment queryOneBySeq(String seq) {
		// TODO Auto-generated method stub
		return forumCommentMapper.getInfoBySeq(seq);
	}

	@Override
	public List<Forum_comment> getCommentById(String id) {
		// TODO Auto-generated method stub
		return forumCommentMapper.loadForumCommentById(id);
	}

	@Override
	public void pageingBasic(Pageing p,String id) {
		// TODO Auto-generated method stub
		p.setTotalNum(forumCommentMapper.getTotal(id));
		p.setEntity(forumCommentMapper.pageingQuery(p.getStart(), p.getStop(), id));
	}

	
	
}
