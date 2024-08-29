package com.csstest.teamb.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csstest.teamb.VO.FlightInfoVO;


@Repository
public class flight_realtime{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private final String NAME_SPACE ="flightrealtimeMapper";
	
	
	
	
	
	public int insert(FlightInfoVO vo) {
		
		return sqlSessionTemplate.insert(NAME_SPACE+".insert",vo);
	}
	
	public List<FlightInfoVO> selectAll() {
		
		return sqlSessionTemplate.selectList(NAME_SPACE+".selectAll");
	}
	
	public int deletecleartable(){
		return sqlSessionTemplate.delete(NAME_SPACE+".cleartable");
		
	}
	
	
	
}
