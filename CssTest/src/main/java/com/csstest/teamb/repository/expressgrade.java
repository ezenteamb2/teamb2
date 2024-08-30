package com.csstest.teamb.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csstest.teamb.VO.expressgradeVO;












@Repository
public class expressgrade{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private final String NAME_SPACE ="expressgradeMapper";
	
	
	
	
	
	public int insert( expressgradeVO vo) {
		
		return sqlSessionTemplate.insert(NAME_SPACE+".insert",vo);
	}
	
	

	
	
	
}
