package com.mapper.dynamicSQL;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import com.model.Userset;

public class UsersetDynamicSQL {

	public String updateUserset(final Userset userset)
	{
		return new SQL()
		{
			{
				UPDATE("Userset");
				if(userset.getUsername()!=null)
					SET("username=#{username}");
				if(userset.getEmail()!=null)
					SET("email=#{email}");
				if(userset.getPhone()!=null)
					SET("phone=#{phone}");
				if(userset.getPassword()!=null)
					SET("password=#{password}");
				WHERE("userid=#{userid}");
			}
		}.toString();
	}
	
	public String updateStatus(final Map<String, Object> map)
	{
		return new SQL(){
			{
				UPDATE("USERSET");
				if(map.get("type").equals("ISLOCKED"))
					SET("ISLOCKED=#{status}");
				else if(map.get("type").equals("ISDELETE"))
					SET("ISDELETE=#{status}");
				else
					SET("ROLEID=#{status}");
				WHERE("userid=#{userid}");
				
			}
		}.toString();
	}
}
