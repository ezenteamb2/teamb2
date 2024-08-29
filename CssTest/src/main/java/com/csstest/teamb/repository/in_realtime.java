package com.csstest.teamb.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csstest.teamb.VO.inVO;






@Repository
public class in_realtime{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private final String NAME_SPACE ="inrealtimeMapper";
	
	
	
	
	
	public int insert(inVO vo) {
		
		return sqlSessionTemplate.insert(NAME_SPACE+".insert",vo);
	}
	
	public List<inVO> select(int inNo) {
		return sqlSessionTemplate.selectList(NAME_SPACE+".select",inNo);
		
	}
	
	public List<inVO> selectAll() {
		return sqlSessionTemplate.selectList(NAME_SPACE+".selectAll");
		
	}

	public int deletecleartable(){
		return sqlSessionTemplate.delete(NAME_SPACE+".cleartable");
		
	}

	
	
	
}
