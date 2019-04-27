package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.model.Sensitive_word;

public interface SensitiveWord {

	@Select("select * from SENSITIVE_WORD order by info")
	public List<Sensitive_word> queryAll();
}
