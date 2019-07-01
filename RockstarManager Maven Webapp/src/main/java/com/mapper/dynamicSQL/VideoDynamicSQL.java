package com.mapper.dynamicSQL;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

public class VideoDynamicSQL {

	public String findVideoByCondition(final Map<String, Object> param)
	{
		return new SQL()
		{
			{
				SELECT("*");
				FROM("Video");
				WHERE("name=#{name}");
				if(param.get("condition").equals("updateDate"))
					ORDER_BY("update_date desc");
				else if(param.get("condition").equals("View_time"))
					ORDER_BY("View_time desc");
			}
		}.toString();
	}
}
