package com.csstest.teamb.controller;

import java.io.Console;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.csstest.teamb.VO.airportVO;
import com.csstest.teamb.VO.flightSchVO;
import com.csstest.teamb.VO.icnSchVO;
import com.csstest.teamb.service.AIRService;

@Controller
@RequestMapping("/api")
public class APIController {
	
	@Autowired
	private AIRService apiService;
	
	@RequestMapping(value="/airport", method=RequestMethod.GET)
	public String airport(Model model) throws Exception {
		/*String key = "Y1%2FhfLmPmQpDsAP6SDf06L2irFim7XyUMhudaHI4bq5BGCJj44Swqmolf8Cxfc8DbBVJahD89DqhNiDj%2BaVUOA%3D%3D";

        String baseUrl = "http://openapi.airport.co.kr/service/rest/AirportCodeList/getAirportCodeList";
        
        List<airportVO> allItems = new ArrayList<airportVO>();
        int pageNo = 1;
        int totalCount = 0;
        int numOfRows = 10; 

        while (true) {
            StringBuffer sb = new StringBuffer(baseUrl);
            sb.append("?serviceKey=").append(key);
            sb.append("&pageNo=").append(pageNo);
            sb.append("&numOfRows=").append(numOfRows);

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

            if (totalCount == 0) {
                totalCount = Integer.parseInt(body.getChildText("totalCount"));
            }

            for (Element item : itemList) {
            	
            	airportVO airportVO = new airportVO();
            	
                airportVO.setCityCode(item.getChildText("cityCode"));
                airportVO.setCityEng(item.getChildText("cityEng"));
                airportVO.setCityKor(item.getChildText("cityKor"));
                
                allItems.add(airportVO);
                
                apiService.insertAirport(airportVO);
            }

            if (allItems.size() >= totalCount) {
                break;
            }
            
            
            pageNo++;
        }*/
		
		List<airportVO> list = apiService.getAll();
		
        model.addAttribute("list", list);
        return "airport"; 
	}
	
	@RequestMapping(value="/flight-schedule", method=RequestMethod.GET)
	public String domestic(Model model) throws Exception {
		String[] korCityList = {"GMP", "PUS", "CJU"};
		
		String key = "Y1%2FhfLmPmQpDsAP6SDf06L2irFim7XyUMhudaHI4bq5BGCJj44Swqmolf8Cxfc8DbBVJahD89DqhNiDj%2BaVUOA%3D%3D";
        String schDate = "20240822";
        String schDeptCityCode = "";
        String schArrvCityCode = "";
        
        List<flightSchVO> allItems = new ArrayList<flightSchVO>();
        
        for(int i = 0; i < korCityList.length; i++) {
        	for(int j = 0; j < korCityList.length; j++) {
        		if (i == j) continue;
        		
        		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        		
        		schDeptCityCode = korCityList[i];
        		schArrvCityCode = korCityList[j];
        		
        		String baseUrl = "http://openapi.airport.co.kr/service/rest/FlightScheduleList/getDflightScheduleList";
        		
        		int pageNo = 1;
        		int totalCount = 0;
        		int numOfRows = 10; 
        		
        		while (true) {
        			StringBuffer sb = new StringBuffer(baseUrl);
        			sb.append("?serviceKey=").append(key);
        			sb.append("&schDate=").append(schDate);
        			sb.append("&schDeptCityCode=").append(schDeptCityCode);
        			sb.append("&schArrvCityCode=").append(schArrvCityCode);
        			sb.append("&pageNo=").append(pageNo);
        			sb.append("&numOfRows=").append(numOfRows);
        			
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
        			
        			if (totalCount == 0) {
        				totalCount = Integer.parseInt(body.getChildText("totalCount"));
        				if (totalCount == 0) break;
        			}
        			
        			for (Element item : itemList) {
        				
        				flightSchVO flightSchVO = new flightSchVO();
        				
        				flightSchVO.setAirlineEng(item.getChildText("airlineEnglish"));
        				flightSchVO.setAirlineKor(item.getChildText("airlineKorean"));
        				flightSchVO.setArrivalCity(item.getChildText("arrivalcity"));
        				flightSchVO.setArrivalCityCode(item.getChildText("arrivalcityCode"));
        				flightSchVO.setArrivalTime(item.getChildText("domesticArrivalTime"));
        				flightSchVO.setFlightNum(item.getChildText("domesticNum"));
        				flightSchVO.setStartCity(item.getChildText("startcity"));
        				flightSchVO.setStartCityCode(item.getChildText("startcityCode"));
        				flightSchVO.setStartTime(item.getChildText("domesticStartTime"));
        				flightSchVO.setFlightPurpose(item.getChildText("flightPurpose"));
        				flightSchVO.setSun(item.getChildText("domesticSun"));
        				flightSchVO.setMon(item.getChildText("domesticMon"));
        				flightSchVO.setTue(item.getChildText("domesticTue"));
        				flightSchVO.setWed(item.getChildText("domesticWed"));
        				flightSchVO.setThu(item.getChildText("domesticThu"));
        				flightSchVO.setFri(item.getChildText("domesticFri"));
        				flightSchVO.setSat(item.getChildText("domesticSat"));                
        				
        				allItems.add(flightSchVO);
        			}
        			
        			if (pageNo > totalCount / numOfRows) {
                        break;
                    }
        			
        			pageNo++;
        		}
        		
        	}
        }
        
        model.addAttribute("list", allItems);
        return "flightSch"; 
	}
	
	@RequestMapping("/international")
	public String international(Model model) throws Exception {
		
		String[] korCityList = {"GMP", "PUS", "CJU"};
		String[] containICNList = {"ICN", "TPE", "KHH", "BKK", "CNX", "HKT", "HAN", "SGN", "DAD", "CXR", "DLI", "MNL", "CEB",
				"KLO", "DPS", "SIN", "VTE", "PNH", "BKI", "KUL", "UBN", "DEL", "NRT", "HND", "KIX", "FUK",
				"OKA", "CTS", "NGO", "KOJ", "KKJ", "KMJ", "KMI", "OIT", "KIJ", "TAK", "HKG", "MFM", "PKX",
				"PEK", "PVG", "SHA", "CAN", "TAO", "YNJ", "SHE", "DLC", "SZX", "YNT", "WEH", "TSN", "NKG",
				"CDG", "LHR", "FCO", "MXP", "PRG", "FRA", "BCN", "MAD", "BUD", "AMS", "ZRH", "IST", "HEL",
				"SVO", "VVO", "WAW", "LAX", "JFK", "EWR", "LAS", "SFO", "SEA", "ORD", "IAD", "ATL", "HNL",
				"DTW", "MSP", "DFW", "YVR", "YYZ", "GUM", "SPN", "SYD", "MEL", "BNE", "AKL", "DXB", "AUH",
				"DOH", "ADD"};
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 
		Calendar c1 = Calendar.getInstance();
		String strToday = sdf.format(c1.getTime());
		
		String key = "Y1%2FhfLmPmQpDsAP6SDf06L2irFim7XyUMhudaHI4bq5BGCJj44Swqmolf8Cxfc8DbBVJahD89DqhNiDj%2BaVUOA%3D%3D";
        String schDate = strToday;
        String schDeptCityCode = "";
        String schArrvCityCode = "";
        
        List<flightSchVO> allItems = new ArrayList<flightSchVO>();
        
        for(int i = 0; i < korCityList.length; i++) {
        	for(int j = 0; j < containICNList.length; j++) {
        		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+i+" "+j);
        		
        		schDeptCityCode = korCityList[i];
        		schArrvCityCode = containICNList[j];
        		
        		String baseUrl = "http://openapi.airport.co.kr/service/rest/FlightScheduleList/getIflightScheduleList";
                
                int pageNo = 1;
                int totalCount = 0;
                int numOfRows = 10; 

                while (true) {
                    StringBuffer sb = new StringBuffer(baseUrl);
                    sb.append("?serviceKey=").append(key);
                    sb.append("&schDate=").append(schDate);
                    sb.append("&schDeptCityCode=").append(schDeptCityCode);
                    sb.append("&schArrvCityCode=").append(schArrvCityCode);
                    sb.append("&pageNo=").append(pageNo);
                    sb.append("&numOfRows=").append(numOfRows);

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

                    if (totalCount == 0) {
                        totalCount = Integer.parseInt(body.getChildText("totalCount"));
                        if (totalCount == 0) break;
                    }

                    for (Element item : itemList) {
                    	flightSchVO flightSchVO = new flightSchVO();
                    	
                    	flightSchVO.setAirlineEng(item.getChildText("airlineEnglish"));
                    	flightSchVO.setAirlineKor(item.getChildText("airlineKorean"));
                    	flightSchVO.setCity(item.getChildText("city"));
                    	flightSchVO.setCityCode(item.getChildText("cityCode"));
                        flightSchVO.setFlightNum(item.getChildText("internationalNum"));
                        flightSchVO.setAirport(item.getChildText("airport"));
                        flightSchVO.setAirportCode(item.getChildText("airportCode"));
                        flightSchVO.setFlightPurpose(item.getChildText("flightPurpose"));
                        flightSchVO.setSchTime(item.getChildText("internationalTime"));
                        flightSchVO.setIoType(item.getChildText("internationalIoType"));
                        flightSchVO.setSun(item.getChildText("internationalSun"));
                        flightSchVO.setMon(item.getChildText("internationalMon"));
                        flightSchVO.setTue(item.getChildText("internationalTue"));
                        flightSchVO.setWed(item.getChildText("internationalWed"));
                        flightSchVO.setThu(item.getChildText("internationalThu"));
                        flightSchVO.setFri(item.getChildText("internationalFri"));
                        flightSchVO.setSat(item.getChildText("internationalSat"));
                                        
                        allItems.add(flightSchVO);
                    }

                    if (pageNo > totalCount / numOfRows) {
                        break;
                    }

                    pageNo++;
                }
        	}
        }
        
        model.addAttribute("list", allItems);
        return "international"; 
	}
	
	@RequestMapping("/icn-arrival")
	public String icnArrival(Model model) throws Exception {
		//인천공항 도착 운항 스케줄 api 호출
		
		String key = "Y1%2FhfLmPmQpDsAP6SDf06L2irFim7XyUMhudaHI4bq5BGCJj44Swqmolf8Cxfc8DbBVJahD89DqhNiDj%2BaVUOA%3D%3D";
        String airportCode = "IAD";
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
        	
        	icnSchVO.setAirline(item.getChildText("airline"));
        	icnSchVO.setDepartureAirport(item.getChildText("airport"));
        	icnSchVO.setDepartureAirportCode(item.getChildText("airportCode"));
        	icnSchVO.setCarousel(item.getChildText("carousel"));
        	icnSchVO.setEdt(item.getChildText("estimatedDateTime"));
        	icnSchVO.setExitNum(item.getChildText("exitnumber"));
        	icnSchVO.setFlightId(item.getChildText("flightId"));
        	icnSchVO.setGate(item.getChildText("gatenumber"));
        	icnSchVO.setSdt(item.getChildText("scheduleDateTime"));
        	icnSchVO.setTerminal(item.getChildText("terminalid"));
        	
        	allItems.add(icnSchVO);
        }
       
        model.addAttribute("list", allItems);
        return "icnArrival"; 
	}
	
	@RequestMapping("/icn-departure")
	public String icnDeparture(Model model) throws Exception {
		//인천공항 출발 운항 스케줄 api 호출
		
		String key = "Y1%2FhfLmPmQpDsAP6SDf06L2irFim7XyUMhudaHI4bq5BGCJj44Swqmolf8Cxfc8DbBVJahD89DqhNiDj%2BaVUOA%3D%3D";
        String airportCode = "IAD";
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
        	
        	icnSchVO.setAirline(item.getChildText("airline"));
        	icnSchVO.setArrivalAirport(item.getChildText("airport"));
        	icnSchVO.setArrivalAirportCode(item.getChildText("airportCode"));
        	icnSchVO.setChkinRange(item.getChildText("chkinrange"));
        	icnSchVO.setEdt(item.getChildText("estimatedDateTime"));
        	icnSchVO.setFlightId(item.getChildText("flightId"));
        	icnSchVO.setGate(item.getChildText("gatenumber"));
        	icnSchVO.setRemark(item.getChildText("remark"));
        	icnSchVO.setSdt(item.getChildText("scheduleDateTime"));
        	icnSchVO.setTerminal(item.getChildText("terminalid"));
        	
        	allItems.add(icnSchVO);
        }
       
        model.addAttribute("list", allItems);
        return "international"; 
	}
}
