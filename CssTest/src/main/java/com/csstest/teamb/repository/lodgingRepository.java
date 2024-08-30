package com.csstest.teamb.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.csstest.teamb.VO.lodgingVO;



@Repository
public class lodgingRepository {
	
	@Autowired
	JdbcTemplate templeate;
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private final String NAME_SPACE = "lodgingMapper";
	
	public List<lodgingVO> selectAlldata() {
		List<lodgingVO> lodgingList = sqlSessionTemplate.selectList(NAME_SPACE + ".select_lodging");
		return lodgingList;
	}

}
