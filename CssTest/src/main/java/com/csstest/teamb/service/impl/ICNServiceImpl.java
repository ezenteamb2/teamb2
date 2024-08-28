package com.csstest.teamb.service.impl;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Service;

import com.csstest.teamb.VO.icnSchVO;
import com.csstest.teamb.service.ICNService;

@Service
public class ICNServiceImpl implements ICNService{
	
	@Override
	public List<icnSchVO> getICNarrival(String departureAirportCode) throws Exception {
		//인천공항 도착 운항 스케줄
		
		String key = "Y1%2FhfLmPmQpDsAP6SDf06L2irFim7XyUMhudaHI4bq5BGCJj44Swqmolf8Cxfc8DbBVJahD89DqhNiDj%2BaVUOA%3D%3D";
        String airportCode = departureAirportCode;
        String type = "xml";

        String baseUrl = "http://apis.data.go.kr/B551177/StatusOfPassengerFlightsDSOdp/getPassengerArrivalsDSOdp";
        
        List<icnSchVO> allItems = new ArrayList<icnSchVO>();

        StringBuffer sb = new StringBuffer(baseUrl);
        sb.append("?serviceKey=").append(key);
        sb.append("&airport_code=").append(airportCode);
        sb.append("&type=").append(type);

        URL url = new URL(sb.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestProperty("Content-Type", "application/xml");
        conn.connect();

        SAXBuilder builder = new SAXBuilder();
        Document document = builder.build(conn.getInputStream());

        Element response = document.getRootElement();
        Element body = response.getChild("body");
        Element items = body.getChild("items");
        List<Element> itemList = items.getChildren("item");

        for(Element item : itemList) {
        	icnSchVO icnSchVO = new icnSchVO();
        	if(item.getChildText("airline") != null) {
        		icnSchVO.setAirline(item.getChildText("airline"));
        		icnSchVO.setDepartureAirport(item.getChildText("airport"));
        		icnSchVO.setDepartureAirportCode(item.getChildText("airportCode"));
        		icnSchVO.setCarousel(item.getChildText("carousel"));
        		icnSchVO.setEdt(item.getChildText("estimatedDateTime"));
        		icnSchVO.setExitNum(item.getChildText("exitnumber"));
        		icnSchVO.setFlightId(item.getChildText("flightId"));
        		icnSchVO.setGate(item.getChildText("gatenumber"));
        		icnSchVO.setSdt(item.getChildText("scheduleDateTime"));
        		icnSchVO.setTerminal(terminalFn(item.getChildText("terminalid")));
        		icnSchVO.setArrivalAirport("서울/인천");
        		icnSchVO.setArrivalAirportCode("ICN");
        		icnSchVO.setIo("IN");        		
        	}
        	else {
        		icnSchVO.setAirline("스위스 국제항공");
        		icnSchVO.setDepartureAirport(item.getChildText("airport"));
        		icnSchVO.setDepartureAirportCode(item.getChildText("airportCode"));
        		icnSchVO.setCarousel(item.getChildText("carousel"));
        		icnSchVO.setEdt(item.getChildText("estimatedDateTime"));
        		icnSchVO.setExitNum(item.getChildText("exitnumber"));
        		icnSchVO.setFlightId(item.getChildText("flightId"));
        		icnSchVO.setGate(item.getChildText("gatenumber"));
        		icnSchVO.setSdt(item.getChildText("scheduleDateTime"));
        		icnSchVO.setTerminal(terminalFn(item.getChildText("terminalid")));
        		icnSchVO.setArrivalAirport("서울/인천");
        		icnSchVO.setArrivalAirportCode("ICN");
        		icnSchVO.setIo("IN");
        	}
        	
        	allItems.add(icnSchVO);
        }
		
        System.out.println("도착 성공");
        
		return allItems;
	}

	@Override
	public List<icnSchVO> getICNdeparture(String arrivalAirportCode) throws Exception {
		//인천공항 출발 운항 스케줄
		
		String key = "Y1%2FhfLmPmQpDsAP6SDf06L2irFim7XyUMhudaHI4bq5BGCJj44Swqmolf8Cxfc8DbBVJahD89DqhNiDj%2BaVUOA%3D%3D";
        String airportCode = arrivalAirportCode;
        String type = "xml";

        String baseUrl = "http://apis.data.go.kr/B551177/StatusOfPassengerFlightsDSOdp/getPassengerDeparturesDSOdp";
        
        List<icnSchVO> allItems = new ArrayList<icnSchVO>();

        StringBuffer sb = new StringBuffer(baseUrl);
        sb.append("?serviceKey=").append(key);
        sb.append("&airport_code=").append(airportCode);
        sb.append("&type=").append(type);

        URL url = new URL(sb.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestProperty("Content-Type", "application/xml");
        conn.connect();

        SAXBuilder builder = new SAXBuilder();
        Document document = builder.build(conn.getInputStream());

        Element response = document.getRootElement();
        Element body = response.getChild("body");
        Element items = body.getChild("items");
        List<Element> itemList = items.getChildren("item");

        for(Element item : itemList) {
        	icnSchVO icnSchVO = new icnSchVO();
        	
        	if(item.getChildText("airline") != null) {
        		icnSchVO.setAirline(item.getChildText("airline"));
        		icnSchVO.setArrivalAirport(item.getChildText("airport"));
        		icnSchVO.setArrivalAirportCode(item.getChildText("airportCode"));
        		icnSchVO.setChkinRange(item.getChildText("chkinrange"));
        		icnSchVO.setEdt(item.getChildText("estimatedDateTime"));
        		icnSchVO.setFlightId(item.getChildText("flightId"));
        		icnSchVO.setGate(item.getChildText("gatenumber"));
        		icnSchVO.setRemark(item.getChildText("remark"));
        		icnSchVO.setSdt(item.getChildText("scheduleDateTime"));
        		icnSchVO.setTerminal(terminalFn(item.getChildText("terminalid")));
        		icnSchVO.setDepartureAirport("서울/인천");
        		icnSchVO.setDepartureAirportCode("ICN");
        		icnSchVO.setIo("OUT");        		
        	}
        	else{
        		icnSchVO.setAirline("스위스 국제항공");
        		icnSchVO.setArrivalAirport(item.getChildText("airport"));
        		icnSchVO.setArrivalAirportCode(item.getChildText("airportCode"));
        		icnSchVO.setChkinRange(item.getChildText("chkinrange"));
        		icnSchVO.setEdt(item.getChildText("estimatedDateTime"));
        		icnSchVO.setFlightId(item.getChildText("flightId"));
        		icnSchVO.setGate(item.getChildText("gatenumber"));
        		icnSchVO.setRemark(item.getChildText("remark"));
        		icnSchVO.setSdt(item.getChildText("scheduleDateTime"));
        		icnSchVO.setTerminal(terminalFn(item.getChildText("terminalid")));
        		icnSchVO.setDepartureAirport("서울/인천");
        		icnSchVO.setDepartureAirportCode("ICN");
        		icnSchVO.setIo("OUT");
        	}
        	
        	
        	allItems.add(icnSchVO);
        }
        
        System.out.println("출발 성공");
        
		return allItems;
	}
	
	public String terminalFn(String terminal) {
		if(terminal.equals("P01")) {
			return "제1여객터미널";
		} else if(terminal.equals("P02")) {
			return "탑승동";
		} else if(terminal.equals("P03")) {
			return "제2여객터미널";
		} else if(terminal.equals("C01")) {
			return "화물터미널 남측";
		} else if(terminal.equals("C02")) {
			return "화물터미널 북측";
		} else if(terminal.equals("C03")) {
			return "제2화물터미널";
		} else {
			return "";
		}
	}

}
