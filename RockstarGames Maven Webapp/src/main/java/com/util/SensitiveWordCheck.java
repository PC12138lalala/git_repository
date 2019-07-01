package com.util;

import java.util.List;

import com.model.Sensitive_word;
public class SensitiveWordCheck {

	public boolean hasSensitiveWord(String content,List<Sensitive_word> list)
	{
		
		for(int i=0;i<list.size();i++)
		{
			if(content.indexOf(list.get(i).getInfo().toString())!=-1)
			{
				return true;
			}
		}
		return false;
	}
}
