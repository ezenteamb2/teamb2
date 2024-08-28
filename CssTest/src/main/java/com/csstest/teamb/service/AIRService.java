package com.csstest.teamb.service;

import java.util.List;

import com.csstest.teamb.VO.airportVO;
import com.csstest.teamb.VO.flightSchVO;

public interface AIRService {
	
	//공항 코드 삽입
	int insertAirport(airportVO vo);
	
	//공항 코드 조회
	List<airportVO> getAll(); 
	
	//국내선 운항 스케줄 삽입
	int insertDomestic(flightSchVO vo);
	
	//국제선 운항 스케줄 삽입
	int insertInternational(flightSchVO vo);
	
	//DB삭제
	int deleteFlightSch();
	
	//한국공항공사 국내선 검색 조회
	List<flightSchVO> getDomestic(flightSchVO vo);
	
	//한국공항공사 국외선 출국 검색 조회
	List<flightSchVO> getInternationalOut(flightSchVO vo);
	
	//한국공항공사 국외선 출국 검색 조회
	List<flightSchVO> getInternationalIn(flightSchVO vo);
}
