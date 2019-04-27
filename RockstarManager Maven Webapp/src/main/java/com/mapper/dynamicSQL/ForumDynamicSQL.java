package com.mapper.dynamicSQL;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

public class ForumDynamicSQL {
	public String updateStatus(final Map<String, Object> map)
	{
		return new SQL(){
			{
				UPDATE("FORUM");
				if(map.get("type").equals("ISLOCKED"))
					SET("ISLOCKED=#{status}");
				else if(map.get("type").equals("ISDELETE"))
					SET("ISDELETE=#{status}");
				else
					SET("ISTOP=#{status}");
				WHERE("id=#{id}");
				
			}
		}.toString();
	}
}
