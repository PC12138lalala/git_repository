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

import com.model.Video_comment;

public interface VideoCommentMapper {
	@Select("select * from video_comment where id=#{id} order by cdate desc")
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
	public List<Video_comment> loadVideoCommentById(@Param("id" )String id);
	@Insert("insert into video_comment(id,userid,content,cdate,likes,seq) values(#{id},#{userid},#{content},now(),0,#{seq}")
	public void insert(@Param("content")String content,@Param("userid")String userid,@Param("id")String id,@Param("seq")String seq);
	@Update("update VIDEO_COMMENT set likes=likes+1 where seq=#{seq}")
	public void updateLikes(@Param("seq")String seq);
	@Select("select * from VIDEO_COMMENT where seq=#{seq}")
	public Video_comment queryBySeq(@Param("seq")String seq);
}
