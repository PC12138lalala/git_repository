package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.mapping.FetchType;

import com.model.Forum_comment;

public interface ForumCommentMapper {

	@Insert("insert into FORUM_COMMENT(id,userid,content,cdate,likes,seq) values(#{id},#{userid},#{content},now(),0,#{seq})")
	public void insert(@Param("content")String content,@Param("userid")String userid,@Param("id")String id,@Param("seq")String seq);
	@Update("update FORUM_COMMENT set likes=likes+1 where seq=#{seq}")
	public void updateLikes(@Param("seq")String seq);
	@Select("select * from FORUM_COMMENT where id=#{id} order by Cdate desc")
	@Results({
		@Result(column="content",property="content"),
		@Result(column="cdate",property="cdate"),
		@Result(column="seq",property="seq"),
		@Result(column="likes",property="likes"),
		@Result(column="userid",property="userset",
		one=@One(
					select="com.mapper.UsersetMapper.findUserByUserID",fetchType=FetchType.LAZY
				))
	})
	public List<Forum_comment> loadForumCommentById(@Param("id" )String id);
	@Select("select * from FORUM_COMMENT where seq=#{seq}")
	public Forum_comment getInfoBySeq(@Param("seq")String seq);
	@Select("select count(*) from FORUM_COMMENT where id = #{id}")
	public Integer getTotal(@Param("id") String id);
	@Select("select id,userid,content,cdate,likes,seq from FORUM_COMMENT where id = #{id} order by likes desc limit ${start},${pageSize}")
	@Results({
		@Result(column="content",property="content"),
		@Result(column="cdate",property="cdate"),
		@Result(column="seq",property="seq"),
		@Result(column="likes",property="likes"),
		@Result(column="userid",property="userset",
		one=@One(
					select="com.mapper.UsersetMapper.findUserByUserID",fetchType=FetchType.LAZY
				))
	})
	public List<Forum_comment> pageingQuery(@Param("start") int start,@Param("pageSize") int pageSize,@Param("id") String id);
}
