package com.csstest.teamb.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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





	public  String getTerminalld(Map<String,String> paramMap) {
		
		
		return sqlSessionTemplate.selectOne(NAME_SPACE+".selectAllCity",paramMap);
	}

	public  String getArrterminalld(Map<String,String> paramMap) {
		
		
		return sqlSessionTemplate.selectOne(NAME_SPACE+".selectAllAirport",paramMap);

	}
}




	
	
	

	
	
	

