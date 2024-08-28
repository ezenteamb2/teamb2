package com.csstest.teamb.scheduler;

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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.csstest.teamb.VO.flightSchVO;
import com.csstest.teamb.controller.HomeController;
import com.csstest.teamb.service.AIRService;

public class flighitScheduler {
	
	/*String[] korCityList = {"GMP", "PUS", "CJU"};
	String[] abroadCityList = {"TPE", "KHH", "BKK", "CNX", "HKT", "HAN", "SGN", "DAD", "CXR", "DLI", "MNL", "CEB",
							"KLO", "DPS", "SIN", "VTE", "PNH", "BKI", "KUL", "UBN", "DEL", "NRT", "HND", "KIX", "FUK",
							"OKA", "CTS", "NGO", "KOJ", "KKJ", "KMJ", "KMI", "OIT", "KIJ", "TAK", "HKG", "MFM", "PKX",
							"PEK", "PVG", "SHA", "CAN", "TAO", "YNJ", "SHE", "DLC", "SZX", "YNT", "WEH", "TSN", "NKG",
							"CDG", "LHR", "FCO", "MXP", "PRG", "FRA", "BCN", "MAD", "BUD", "AMS", "ZRH", "IST", "HEL",
							"SVO", "VVO", "WAW", "LAX", "JFK", "EWR", "LAS", "SFO", "SEA", "ORD", "IAD", "ATL", "HNL",
							"DTW", "MSP", "DFW", "YVR", "YYZ", "GUM", "SPN", "SYD", "MEL", "BNE", "AKL", "DXB", "AUH",
							"DOH", "ADD"};
	String[] containICNList = {"ICN", "TPE", "KHH", "BKK", "CNX", "HKT", "HAN", "SGN", "DAD", "CXR", "DLI", "MNL", "CEB",
							"KLO", "DPS", "SIN", "VTE", "PNH", "BKI", "KUL", "UBN", "DEL", "NRT", "HND", "KIX", "FUK",
							"OKA", "CTS", "NGO", "KOJ", "KKJ", "KMJ", "KMI", "OIT", "KIJ", "TAK", "HKG", "MFM", "PKX",
							"PEK", "PVG", "SHA", "CAN", "TAO", "YNJ", "SHE", "DLC", "SZX", "YNT", "WEH", "TSN", "NKG",
							"CDG", "LHR", "FCO", "MXP", "PRG", "FRA", "BCN", "MAD", "BUD", "AMS", "ZRH", "IST", "HEL",
							"SVO", "VVO", "WAW", "LAX", "JFK", "EWR", "LAS", "SFO", "SEA", "ORD", "IAD", "ATL", "HNL",
							"DTW", "MSP", "DFW", "YVR", "YYZ", "GUM", "SPN", "SYD", "MEL", "BNE", "AKL", "DXB", "AUH",
							"DOH", "ADD"};*/
		
	@Autowired
	private AIRService apiService;
	
	public void flightDomestic() throws Exception {
		//DB 초기화
		apiService.deleteFlightSch();
		
		String[] korCityList = {"GMP", "PUS", "CJU"};
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 
		Calendar c1 = Calendar.getInstance();
		String strToday = sdf.format(c1.getTime());
		
		String key = "Y1%2FhfLmPmQpDsAP6SDf06L2irFim7XyUMhudaHI4bq5BGCJj44Swqmolf8Cxfc8DbBVJahD89DqhNiDj%2BaVUOA%3D%3D";
        String schDate = strToday;
        String schDeptCityCode = "";
        String schArrvCityCode = "";
        
        List<flightSchVO> allItems = new ArrayList<flightSchVO>();
        
        for(int i = 0; i < korCityList.length; i++) {
        	for(int j = 0; j < korCityList.length; j++) {
        		if (i == j) continue;
        		
        		System.out.println("#########" + i + " " + j);
        		
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
        				flightSchVO.setDomestic(1);
        				
        				allItems.add(flightSchVO);
        				
        				apiService.insertDomestic(flightSchVO);
        			}
        			
        			if (pageNo > totalCount / numOfRows) {
                        break;
                    }
        			
        			pageNo++;
        		}
        		
        	}
        }

	}
	
	
	public void flightInternational() throws Exception {
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
        		System.out.println("@@@@@@@@@@@@@@@@@"+i+" "+j);
        		
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
                        flightSchVO.setDomestic(0);
                                        
                        allItems.add(flightSchVO);
                        
                        apiService.insertInternational(flightSchVO);
                    }

                    if (pageNo > totalCount / numOfRows) {
                        break;
                    }

                    pageNo++;
                }
        	}
        }
	}
	
}
