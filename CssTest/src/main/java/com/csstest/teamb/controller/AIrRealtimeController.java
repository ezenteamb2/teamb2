package com.csstest.teamb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.csstest.teamb.VO.FlightInfoVO;
import com.csstest.teamb.VO.inVO;
import com.csstest.teamb.repository.flight_realtime;
import com.csstest.teamb.repository.in_realtime;



@Controller
public class AIrRealtimeController {
	@Autowired
	flight_realtime flightrepository;
	
	@Autowired
	in_realtime inrepository;

	
	@RequestMapping(value = "/airport.do", method = RequestMethod.GET)
	public String airport(Model model) {
			List<inVO> in= inrepository.selectAll();
			List<FlightInfoVO> fv=flightrepository.selectAll();
			model.addAttribute("fv",fv);
			model.addAttribute("in",in);
			
		return "airport";
		
	}
	
}
