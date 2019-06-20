package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;

import com.model.Forum;

public interface ForumMapper {

	@Insert("insert into forum(userid,name,id,title,content,mdate,islocked,isdelete,istop) values(#{userid},#{name},#{id},#{title},#{content},now(),'N','N','N')")
	public void addDisc(@Param("userid") String userid,@Param("name") String name,@Param("id") String id,@Param("title") String title,@Param("content") String content);
	@Select("select * from forum order by istop desc,mdate desc ")
	@Results({
		@Result(column="userid",property="userset",
				one=@One(
						select="com.mapper.UsersetMapper.findUserByUserID",fetchType=FetchType.LAZY
				)),
		@Result(column="name",property="gameinfo",
				one=@One(
						select="com.mapper.GameMapper.queryGameByName",fetchType=FetchType.LAZY
				))
	})
	public List<Forum> queryAll();
	@Select("select userid,name,id,title,content,mdate,islocked,isdelete,istop from forum where isdelete='N' and title like '%${condition}%' order by istop desc,mdate desc limit ${start},${pageSize} ")
	@Results({
		@Result(column="userid",property="userset",
				one=@One(
						select="com.mapper.UsersetMapper.findUserByUserID",fetchType=FetchType.LAZY
				)),
		@Result(column="name",property="gameinfo",
				one=@One(
						select="com.mapper.GameMapper.queryGameByName",fetchType=FetchType.LAZY
				)),
		@Result(column="id",property="comments",
				many=@Many(
						select="com.mapper.ForumCommentMapper.loadForumCommentById",fetchType=FetchType.LAZY
				))
	})
	public List<Forum> queryByCondition(@Param("condition") String condition,@Param("start") int start,@Param("pageSize") int pageSize);
	@Select("select count(*) from FORUM where isdelete='N' and title like '%${condition}%'" )
	public Integer getTotalByCondition(@Param("condition") String condition);
	@Select("select * from forum where id=#{id}")
	@Results({
		@Result(column="userid",property="userset",
				one=@One(
						select="com.mapper.UsersetMapper.findUserByUserID",fetchType=FetchType.LAZY
				)),
		@Result(column="name",property="gameinfo",
				one=@One(
						select="com.mapper.GameMapper.queryGameByName",fetchType=FetchType.LAZY
				))
	})
	public Forum queryById(@Param("id") String id);
	@Select("select * from FORUM t where userid = #{userid} ")
	public List<Forum> queryInfoByUserid(@Param("userid") String userid);
	@Select("select count(*) from FORUM where isdelete='N'")
	public Integer getTotal();
	@Select("select userid,name,id,title,content,mdate,islocked,isdelete,istop from forum where isdelete='N' order by istop desc,mdate desc  limit ${start},${pageSize}")
	@Results({
		@Result(id=true,column="id",property="id"),
		@Result(column="title",property="title"),
		@Result(column="content",property="content"),
		@Result(column="mdate",property="mdate"),
		@Result(column="islocked",property="islocked"),
		@Result(column="isdelete",property="isdelete"),
		@Result(column="istop",property="istop"),
		@Result(column="name",property="gameinfo",
			one=@One(
				select="com.mapper.GameMapper.queryGameByName",fetchType=FetchType.LAZY
				)),
		@Result(column="userid",property="userset",
			one=@One(
				select="com.mapper.UsersetMapper.findUserByUserID",fetchType=FetchType.LAZY
					)),
		@Result(column="id",property="comments",
			many=@Many(
					select="com.mapper.ForumCommentMapper.loadForumCommentById",fetchType=FetchType.LAZY
					))
	})
	public List<Forum> pageingQuery(@Param("start") int start,@Param("pageSize") int pageSize);
}
