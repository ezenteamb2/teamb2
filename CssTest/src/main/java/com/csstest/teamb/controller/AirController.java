package com.csstest.teamb.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csstest.teamb.VO.flightSchVO;
import com.csstest.teamb.VO.icnSchVO;
import com.csstest.teamb.repository.APIRepository;
import com.csstest.teamb.scheduler.flighitScheduler;
import com.csstest.teamb.service.AIRService;
import com.csstest.teamb.service.ICNService;
import com.csstest.teamb.service.impl.AIRServiceImpl;

@Controller
@RequestMapping("/air")
public class AirController {
	
	@Autowired
	APIRepository apiRepository;
	
	@Autowired
	private AIRService apiService;
	
	@Autowired
	ICNService icnService;
	
	@RequestMapping("/ticket")
	public String ticket() {
		return "boardingPass";
	}
	
	@RequestMapping("/print")
	public String print() {
		return "ticketPrint";
	}
	
	@RequestMapping("/test")
	public String test() {
		return "Test";
	}
	
	@RequestMapping(value="/flight-schedule", method=RequestMethod.GET)
	public String flightSch() {
		return "Test2";
	}
	
	@ResponseBody
	@RequestMapping(value="/flight-schedule", method=RequestMethod.POST)
	public Map<String, Object> flightSchSearch(
						@RequestParam(name="selectedDate") String selectedDate,
						@RequestParam(name="selectedDay") String selectedDay,
						@RequestParam(name="departureCity") String departureCity,
						@RequestParam(name="arrivalCity") String arrivalCity,
						@RequestParam(name="departureTime") String departureTime,
						@RequestParam(name="arrivalTime") String arrivalTime
						) throws Exception {
		System.out.println(selectedDate);
		System.out.println(selectedDay);
		System.out.println(departureCity);
		System.out.println(arrivalCity);
		System.out.println(departureTime);
		System.out.println(arrivalTime);
		
		flightSchVO flightSchVO = new flightSchVO();
		List<flightSchVO> list = new ArrayList<flightSchVO>();
		List<icnSchVO> icnList = new ArrayList<icnSchVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(departureCity.equals("ICN") || arrivalCity.equals("ICN")) {
			//인천공항행 또는 발 운항
			
			if(departureCity.equals("ICN")) {
				//인천공항 출발
				
				//검색 날짜 시간 합키고 format
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
				SimpleDateFormat timeFormat = new SimpleDateFormat("HHmm");
				Date formatDate = dateFormat.parse(selectedDate);
				Date formatTime = timeFormat.parse(departureTime);
				
				//조회
				List<icnSchVO> icnAPIList =  icnService.getICNdeparture(arrivalCity);
				
				System.out.println(icnAPIList);
				
				//검색 정보에 맞게 가공
				for(int i = 0; i < icnAPIList.size(); i++) {
					//조회 날짜 format
					String icnDate = icnAPIList.get(i).getEdt().substring(0, 8);
					Date formatICNDate = dateFormat.parse(icnDate);
					
					//조회 시간 format
					String icnTime = icnAPIList.get(i).getEdt().substring(8);
					Date formatICNTime = timeFormat.parse(icnTime);
					
					//날짜가 같은 경우
					if(formatDate.equals(formatICNDate)) {
						//검색 시간이 조회 시간보다 빠를 경우
						if(formatTime.before(formatICNTime)) {
							icnList.add(icnAPIList.get(i));
						}
						//검색 시간이 조회 시간보다 느릴 경우
						else if(formatTime.after(formatICNTime)) {
							System.out.println("인천공항 출발 조회 실패");
						}
					}
					
				}
				
				//데이터 결과 보내기
				map.put("result", icnList.isEmpty() ? "failed" : "success");
				map.put("data", icnList);
				map.put("type", "icn");
				
			}
			else if(arrivalCity.equals("ICN")) {
				//인천공항 도착
				
				//검색 날짜 시간 합키고 format
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
				SimpleDateFormat timeFormat = new SimpleDateFormat("HHmm");
				Date formatDate = dateFormat.parse(selectedDate);
				Date formatTime = timeFormat.parse(arrivalTime);
				
				//조회
				List<icnSchVO> icnAPIList =  icnService.getICNarrival(departureCity);
				
				//검색 정보에 맞게 가공
				for(int i = 0; i < icnAPIList.size(); i++) {
					//조회 날짜 format
					String icnDate = icnAPIList.get(i).getEdt().substring(0, 8);
					Date formatICNDate = dateFormat.parse(icnDate);
					
					//조회 시간 format
					String icnTime = icnAPIList.get(i).getEdt().substring(8);
					Date formatICNTime = timeFormat.parse(icnTime);
					
					//날짜가 같은 경우
					if(formatDate.equals(formatICNDate)) {
						//검색 시간이 조회 시간보다 느릴 경우
						if(formatTime.after(formatICNTime)) {
							icnList.add(icnAPIList.get(i));
						}
						//검색 시간이 조회 시간보다 빠를 경우
						else if(formatTime.before(formatICNTime)) {
							System.out.println("인천공항 도착 조회 실패");
						}
					}
					
				}
				
				//데이터 결과 보내기
				map.put("result", icnList.isEmpty() ? "failed" : "success");
				map.put("data", icnList);
				map.put("type", "icn");
			}
			
		}
		else if((departureCity.equals("GMP") || departureCity.equals("PUS") || departureCity.equals("CJU")) 
			&& (arrivalCity.equals("GMP") || arrivalCity.equals("PUS") || arrivalCity.equals("CJU"))) {
			//국내선 운항
			flightSchVO.setStartCityCode(departureCity);	//출발공항코드
			flightSchVO.setArrivalCityCode(arrivalCity);	//도착공항코드
			flightSchVO.setStartTime(departureTime);		//출발시간
			flightSchVO.setArrivalTime(arrivalTime);		//도착시간
			flightSchVO.setDomestic(1);						//국내선 판단 여부
			switch (selectedDay) {
				//요일 선택
			case "일요일": flightSchVO.setSun("Y");
				break;
			case "월요일": flightSchVO.setMon("Y");
				break;
			case "화요일": flightSchVO.setTue("Y");
				break;
			case "수요일": flightSchVO.setWed("Y");
				break;
			case "목요일": flightSchVO.setThu("Y");
				break;
			case "금요일": flightSchVO.setFri("Y");
				break;
			case "토요일": flightSchVO.setSat("Y");
				break;
				//사용자 요일 x null
			}
			
			//데이터 가져오기
			list = apiRepository.getDomestic(flightSchVO);
			
			//데이터 결과 보내기
			map.put("result", list.isEmpty() ? "failed" : "success");
			map.put("data", list);
			map.put("type", "kor");

		}
		else if((departureCity.equals("GMP") || departureCity.equals("PUS") || departureCity.equals("CJU")) 
				|| (arrivalCity.equals("GMP") || arrivalCity.equals("PUS") || arrivalCity.equals("CJU"))) {
			//국제선 운항
			if(departureCity.equals("GMP") || departureCity.equals("PUS") || departureCity.equals("CJU")) {
				//출국
				flightSchVO.setAirportCode(departureCity);
				flightSchVO.setCityCode(arrivalCity);
				flightSchVO.setSchTime(departureTime);
				flightSchVO.setDomestic(0);
				flightSchVO.setIoType("OUT");
				switch (selectedDay) {
				//요일 선택
				case "일요일": flightSchVO.setSun("Y");
					break;
				case "월요일": flightSchVO.setMon("Y");
					break;
				case "화요일": flightSchVO.setTue("Y");
					break;
				case "수요일": flightSchVO.setWed("Y");
					break;
				case "목요일": flightSchVO.setThu("Y");
					break;
				case "금요일": flightSchVO.setFri("Y");
					break;
				case "토요일": flightSchVO.setSat("Y");
					break;
					//사용자 요일 x null
				}
				
				//데이터 가져오기
				list = apiRepository.getInternationalOut(flightSchVO);
				
				//데이터 결과 보내기
				map.put("result", list.isEmpty() ? "failed" : "success");
				map.put("data", list);
				map.put("type", "kor");

			}
			else if(arrivalCity.equals("GMP") || arrivalCity.equals("PUS") || arrivalCity.equals("CJU")) {
				//입국
				flightSchVO.setCityCode(departureCity);
				flightSchVO.setAirportCode(arrivalCity);
				flightSchVO.setSchTime(arrivalTime);
				flightSchVO.setDomestic(0);
				flightSchVO.setIoType("IN");
				switch (selectedDay) {
				//요일 선택
				case "일요일": flightSchVO.setSun("Y");
					break;
				case "월요일": flightSchVO.setMon("Y");
					break;
				case "화요일": flightSchVO.setTue("Y");
					break;
				case "수요일": flightSchVO.setWed("Y");
					break;
				case "목요일": flightSchVO.setThu("Y");
					break;
				case "금요일": flightSchVO.setFri("Y");
					break;
				case "토요일": flightSchVO.setSat("Y");
					break;
					//사용자 요일 x null
				}
				
				//데이터 가져오기
				list = apiRepository.getInternationalIn(flightSchVO);

				//데이터 결과 보내기
				map.put("result", list.isEmpty() ? "failed" : "success");
				map.put("data", list);
				map.put("type", "kor");
			}
			
		    
		}
		else {
			System.out.println("외국 공항 데이터 없다고");
		}
		
		return map;
	}
	
	@ResponseBody
	@PostMapping("/flightSchUp")
	public String flightSchUp() {
		
		String result = "";
		
		try {
			flightDomestic();
			flightInternational();
			result = "success";
		} catch (Exception e) {
			 e.printStackTrace();
			result = "failed";
		}
		return result;
	}
	
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
