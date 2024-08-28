package com.csstest.teamb.service;

import java.util.List;

import com.csstest.teamb.VO.icnSchVO;

public interface ICNService {
	//인천공항 도착 운항 스케줄 조회
	List<icnSchVO> getICNarrival(String departureAirportCode) throws Exception;
	
	//인천공항 출발 운항 스케줄 조회
	List<icnSchVO> getICNdeparture(String arrivalAirportCode) throws Exception;
}
