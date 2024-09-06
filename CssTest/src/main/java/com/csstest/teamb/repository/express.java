package com.csstest.teamb.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csstest.teamb.VO.expressVO;




 



@Repository
public class express{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private final String NAME_SPACE ="expressMapper";
	
	
	
	
	
	public int insert( expressVO vo) {
		
		return sqlSessionTemplate.insert(NAME_SPACE+".insert",vo);
	}
	
	
	public List<expressVO> selectAll() {
		
		return sqlSessionTemplate.selectList(NAME_SPACE+".selectAll");
	}
	
	
	
}
