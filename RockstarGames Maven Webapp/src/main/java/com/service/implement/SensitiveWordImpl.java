package com.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.SensitiveWord;
import com.model.Sensitive_word;
import com.service.SensitiveWordService;

@Service("SensitiveWordService")
public class SensitiveWordImpl implements SensitiveWordService {

	@Autowired
	private SensitiveWord sensitiveWord;
	
	@Override
	public List<Sensitive_word> getAll() {
		// TODO Auto-generated method stub
		return sensitiveWord.queryAll();
	}

}
