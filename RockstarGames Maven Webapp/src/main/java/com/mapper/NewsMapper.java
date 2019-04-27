package com.mapper;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;

import com.model.News;

/** 

 * @author 作者 Your-Name: 郭鹏程 

 * @version 创建时间：2019年4月25日 下午5:08:13 

 * 类说明 

 */
public interface NewsMapper {

	@Insert("insert into news(userid,id,create_date,upload_date,likes) values(#{userid},#{id},#{create_date},sysdate,0)")
	public void addNews(@Param("userid") String userid,@Param("id") String id,@Param("create_date") Timestamp create_date);
	@Select("select userid,id,create_date,upload_date,likes from (select rownum rn,userid,id,create_date,upload_date,likes from news where rownum <#{stop} order by upload_date) t where t.rn>=#{start}")
	@Results({
		@Result(id=true,column="ID",property="ID"),
		@Result(column="CREATE_DATE",property="CREATE_DATE"),
		@Result(column="UPLOAD_DATE",property="UPLOAD_DATE"),
		@Result(column="LIKES",property="LIKES"),
		@Result(column="userid",property="userset",
			one=@One(
				select="com.mapper.UsersetMapper.findUserByUserID",fetchType=FetchType.LAZY
					))
	})
	public List<News> pageingQuery(@Param("start") int start,@Param("stop") int stop);
	@Select("select count(*) from news")
	public Integer getTotal();
	@Delete("delete from news where id=#{id}")
	public void delNewsById(@Param("id") String id);
	@Select("select * from news order by create_date,upload_date desc")
	public List<News> queryAll();
}
