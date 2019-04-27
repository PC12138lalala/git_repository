package com.mapper.dynamicSQL;

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
}
