package com.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.mapping.FetchType;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import com.mapper.dynamicSQL.VideoDynamicSQL;
import com.model.Video;

public interface VideoMapper {

	@SelectProvider(type=VideoDynamicSQL.class,method="findVideoByCondition")
	public List<Video> findVideoOrderByCondition(Map<String, Object> param);
	@Select("select * from video where video_name=#{videoname}")
	@Results({
			@Result(id=true,column="id",property="id"),
			@Result(column="video_name",property="video_name"),
			@Result(column="view_time",property="view_time"),
			@Result(column="update_date",property="update_date"),
			@Result(column="userid",property="userset",
			one=@One(
					select="com.mapper.UsersetMapper.findUserByUserID",fetchType=FetchType.LAZY
					)),
			@Result(column="id",property="video_comment",
			many=@Many(
					select="com.mapper.VideoCommentMapper.loadVideoCommentById",fetchType=FetchType.LAZY
					))
			
	})
	public List<Video> getVideoInfoByVideoName(@Param("videoname")String videoName);
	@Select("select * from video where id=#{id}")
	public List<Video> getVideoInfoById(@Param("id") String id);
	@Update("update video set view_time=view_time+1 where video_name=#{video_name}")
	public void updateViewTime(@Param("video_name")String videoName);
	@Select("select * from video order by view_time desc")
	@Results({
		@Result(id=true,column="id",property="id"),
		@Result(column="video_name",property="video_name"),
		@Result(column="view_time",property="view_time"),
		@Result(column="update_date",property="update_date"),
		@Result(column="name",property="gameinfo",
			one=@One(
				select="com.mapper.GameMapper.queryGameByName",fetchType=FetchType.LAZY
				))
	})
	public List<Video> queryAll();
}
