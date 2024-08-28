package com.csstest.teamb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.csstest.teamb.VO.airportVO;
import com.csstest.teamb.VO.flightSchVO;
import com.csstest.teamb.repository.APIRepository;
import com.csstest.teamb.service.AIRService;

@Service
public class AIRServiceImpl implements AIRService {
	
	@Autowired
	private APIRepository apiRepository;

	@Override
	public int insertAirport(airportVO vo) {
		return apiRepository.insertAirport(vo);
	}
	
	@Override
	public List<airportVO> getAll() {
		return apiRepository.getAll();
	}

	@Override
	public int insertDomestic(flightSchVO vo) {
		return apiRepository.insertDomestic(vo);
	}

	@Override
	public int insertInternational(flightSchVO vo) {
		return apiRepository.insertInternational(vo);
	}

	@Override
	public int deleteFlightSch() {
		return apiRepository.deleteFlightSch();
	}

	@Override
	public List<flightSchVO> getDomestic(flightSchVO vo) {
		return apiRepository.getDomestic(vo);
	}

	@Override
	public List<flightSchVO> getInternationalOut(flightSchVO vo) {
		return apiRepository.getInternationalOut(vo);
	}

	@Override
	public List<flightSchVO> getInternationalIn(flightSchVO vo) {
		return apiRepository.getInternationalIn(vo);
	}
	
}
