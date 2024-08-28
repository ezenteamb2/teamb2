package com.csstest.teamb.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csstest.teamb.VO.airportVO;
import com.csstest.teamb.VO.flightSchVO;

@Repository
public class APIRepository {
	//공항 단건 정보 조회

	@Autowired
	private SqlSessionTemplate template;
	
	//공항 정보 삽입
	public int insertAirport(airportVO vo) {
		return template.insert("mappers.airportMapper.insertAirport", vo);
	}
	
	public List<airportVO> getAll() {
		return template.selectList("mappers.airportMapper.getAll");
	}
	
	public int insertDomestic(flightSchVO vo) {
		return template.insert("mappers.flightSchMapper.insertDomestic", vo);
	}
	
	public int insertInternational(flightSchVO vo) {
		return template.insert("mappers.flightSchMapper.insertInternational", vo);
	}
	
	public int deleteFlightSch() {
		return template.delete("mappers.flightSchMapper.deleteFlightSch");
	}
	
	public List<flightSchVO> getDomestic(flightSchVO vo) {
		return template.selectList("mappers.flightSchMapper.getDomestic", vo);
	}
	
	public List<flightSchVO> getInternationalOut(flightSchVO vo) {
		return template.selectList("mappers.flightSchMapper.getInternationalOut", vo);
	}
	
	public List<flightSchVO> getInternationalIn(flightSchVO vo) {
		return template.selectList("mappers.flightSchMapper.getInternationalIn", vo);
	}
	
}
