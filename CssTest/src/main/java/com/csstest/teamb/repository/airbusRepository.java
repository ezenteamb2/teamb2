package com.csstest.teamb.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.csstest.teamb.VO.airbusTOICNVO;
import com.csstest.teamb.VO.airbuskorVO;


@Repository
public class airbusRepository {

	@Autowired
	JdbcTemplate template; 

	@Autowired
	SqlSessionTemplate sqlSessionTemplate; 
	
	private final String NAME_SPACE = "airbusMapper"; 
	
	public int insert(airbusTOICNVO vo) {
		return sqlSessionTemplate.insert(NAME_SPACE + ".createAirbus", vo); 
	}
	
	public int insert(airbuskorVO vo) {
		return sqlSessionTemplate.insert(NAME_SPACE + ".createAirbuskor", vo); 
	}
	
	public List<airbusTOICNVO> select(String city){
		return sqlSessionTemplate.selectList(NAME_SPACE+ ".selectAirbus", city);
	}
	
	public List<airbuskorVO> selectkor(String city){
		return sqlSessionTemplate.selectList(NAME_SPACE+ ".selectAirbuskor", city);
	}
}
