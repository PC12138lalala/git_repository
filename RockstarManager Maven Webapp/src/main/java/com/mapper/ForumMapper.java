package com.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.mapping.FetchType;

import com.mapper.dynamicSQL.ForumDynamicSQL;
import com.model.Forum;

public interface ForumMapper {

	@Select("select userid,name,id,title,content,mdate,islocked,isdelete,istop from (select rownum rn,userid,name,id,title,content,mdate,islocked,isdelete,istop from (select userid,name,id,title,content,mdate,islocked,isdelete,istop from forum where isdelete='N' order by istop desc,mdate desc ) t) t where t.rn>=#{start} and t.rn<#{stop}")
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
					))
	})
	public List<Forum> pageingQuery(@Param("start") int start,@Param("stop") int stop);
	@Select("Select count(*) from forum where isdelete='N'")
	public Integer getTotal();
	@UpdateProvider(type=ForumDynamicSQL.class,method="updateStatus")
	public void updateStatus(Map<String, Object> map);
}
