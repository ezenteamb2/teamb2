package com.csstest.teamb.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csstest.teamb.VO.expressterVO;




 





@Repository
public class terexpress{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private final String NAME_SPACE ="expressterMapper";
	
	
	
	
	
	public int insert( expressterVO vo) {
		
		return sqlSessionTemplate.insert(NAME_SPACE+".insert",vo);
	}
	
	

	
	
	
}
