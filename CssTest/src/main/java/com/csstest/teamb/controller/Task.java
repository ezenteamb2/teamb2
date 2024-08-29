package com.csstest.teamb.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.csstest.teamb.VO.FlightInfoVO;
import com.csstest.teamb.VO.inVO;
import com.csstest.teamb.repository.flight_realtime;
import com.csstest.teamb.repository.in_realtime;



//스케줄러가 동작할 메서드를 정의하는 클래스
//클래스 이름은 아무 상관 없다.
public class Task {

	@Autowired
	flight_realtime flightrepository;
	@Autowired
	in_realtime inrepository;
	private static final Logger logger = LoggerFactory.getLogger(Task.class);
	//스케줄러가 동작시키는 메서드
	//메서드 이름은 노상관
	public void runTask() {
		//데이터베이스 접근
		//주기적으로 동작해야하는 코드를 작성
		//System.out.println("스케줄러 동작");
	}

	public String FlightApiiDB( )  throws IOException, ParserConfigurationException, SAXException {
		flightrepository.deletecleartable();
		List<FlightInfoVO> flightInfoList = new ArrayList<>();
	    int pageNO= 1;
	     // Total pages, initialized to 1 to start the loop
	    int totalCount = 0;
	    int numOfRows = 10; 
	    String baseUrl = "http://openapi.airport.co.kr/service/rest/FlightStatusList/getFlightStatusList";
	    String serviceKey = "JuFxJsZ%2FJfeh1DDfL8yvx7WXGXef1SkOVsVKexFpgRM2IuJ6kE2Q%2FlDhEFspVknAtqr52khnBHB8f%2BJujUbVlg%3D%3D";
	    	
	    while (true) {
	    // Build the URL for the current page
        	StringBuilder urlBuilder = new StringBuilder(baseUrl);
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+serviceKey); /*Service Key*/
	       // urlBuilder.append("&" + URLEncoder.encode("schLineType","UTF-8") + "=" + URLEncoder.encode("D", "UTF-8")); /*국내 / 국제*/
	       // urlBuilder.append("&" + URLEncoder.encode("schIOType","UTF-8") + "=" + URLEncoder.encode("I", "UTF-8")); /*도착 / 출발*/
	       // urlBuilder.append("&" + URLEncoder.encode("schAirCode","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*공항코드*/
	       // urlBuilder.append("&" + URLEncoder.encode("schStTime","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*예정시간*/
	       // urlBuilder.append("&" + URLEncoder.encode("schEdTime","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*변경시간*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNO", "UTF-8") + "=" + pageNO);

	        URL url = new URL(urlBuilder.toString());
	       
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	       
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        
	        
	        String response = sb.toString();
	        System.out.println(response);

	        
	        // 1. 빌더 팩토리 생성. XML 문서를 파싱하기 위한 DocumentBuilder를 생성하기 위한 DocumentBuilderFactory 객체를 생성합니다
	    	DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
	    	// 2. 빌더 팩토리로부터 빌더 생성. DocumentBuilderFactory를 사용하여 실제로 XML 문서를 parsing할 DocumentBuilder 객체를 생성합니다
	    	DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
	    	
	    	InputSource is = new InputSource(new StringReader(response));
	    	
	    	// 3. 빌더를 통해 XML 문서를 파싱해서 Document 객체로 가져온다.
	    	Document doc = dBuilder.parse(is);
	    	doc.getDocumentElement().normalize();
 			// 제일 첫번째 태그  문서 구조 안정화
	    	// XML 문서의 루트 요소를 가져와서 정규화(normalize)합니다.
	    	//✨이러한 작업을 하는 이유는 XML 문서를 작성하거나 생성하는 과정에서 인간의 실수나 다양한 프로세싱 도중의 변화로 인해 일관성 없는 형태로 문서 구조가 만들어질 수 있기 때문입니다.
 				doc.getDocumentElement().normalize();
 				
 				 if (totalCount == 0) {
 		            NodeList totalCountList = doc.getElementsByTagName("totalCount");
 		            if (totalCountList.getLength() > 0) {
 		                String totalCountStr = totalCountList.item(0).getTextContent().trim();
 		                totalCount = Integer.parseInt(totalCountStr);
 		            }
 		        }
 				
 				
 				
 			 // XML 데이터 중 <item> 태그의 내용을 가져온다.
 				NodeList nList = doc.getElementsByTagName("item");
 				 if (nList.getLength() == 0) {
 		            break; // 더이상 데이터가 없으면 종료
 		        }
 				
 				//NodeList에서 현재 순회 중인 item 요소를 가져옵니다.
 				for(int temp = 0; temp < nList.getLength(); temp++){
 					System.out.println(temp);
 					Node nNode = nList.item(temp);
 					
 					Element eElement = (Element) nNode;
 				    FlightInfoVO flightInfo = new FlightInfoVO();
 				   
 				   flightInfo.setAirFln(getTagValue("airFln", eElement));
 				  
 				   flightInfo.setAirlineEnglish( getTagValue("airlineEnglish", eElement));
 				   flightInfo.setBoardingEng( getTagValue("boardingEng", eElement));
 				   flightInfo.setArrivedEng( getTagValue("arrivedEng", eElement));
 				   flightInfo.setStd(getTagValue("std", eElement));
 				   flightInfo.setEtd(getTagValue("etd", eElement));
 				   flightInfo.setRmkEng(getTagValue("rmkEng", eElement));
 				   flightInfo.setGate(getTagValue("gate", eElement));
 				   flightInfo.setIo(getTagValue("io", eElement));
 				   flightInfo.setLine(getTagValue("line", eElement));
 				   flightInfo.setCity(getTagValue("city", eElement));
 				   flightInfo.setAirport(getTagValue("airport", eElement));
 					
 				  flightInfoList.add(flightInfo);
 				  
 				 flightrepository.insert(flightInfo);
 				}	
 				if (pageNO * numOfRows >= totalCount) {
 		            break;
 		        }
 				
 				
		        // 페이지 번호 증가
		        pageNO++;
	       
	}
		    for (FlightInfoVO flightInfo : flightInfoList) {
		        System.out.println(flightInfo);
		    }
		    
		    return "real";
		}
	
	public static String getTagValue(String tag, Element eElement) {
	    try {
	        NodeList nodeList = eElement.getElementsByTagName(tag);
	        if (nodeList.getLength() > 0) {
	            Node node = nodeList.item(0);
	            if (node.getChildNodes().getLength() > 0) {
	                return node.getChildNodes().item(0).getTextContent().trim();
	            }
	        }
	    } catch (Exception e) {
	        // 로그를 기록하여 문제를 
	    	 // 로그를 기록하여 문제를 추적할 수 있게 합니다.
	        logger.error("Error while retrieving tag value for tag: " + tag, e);
	    }
	    return null; // 태그가 없거나 내용이 없는 경우 null을 반환
	}

		
	 public String IndeAPI() throws IOException, ParserConfigurationException, SAXException  {
		
		 	
		 
		 	List<inVO> InList = new ArrayList<>();
			
			String baseUrl = " http://apis.data.go.kr/B551177/StatusOfPassengerFlightsOdp/getPassengerDeparturesOdp";
		    String serviceKey = "JuFxJsZ%2FJfeh1DDfL8yvx7WXGXef1SkOVsVKexFpgRM2IuJ6kE2Q%2FlDhEFspVknAtqr52khnBHB8f%2BJujUbVlg%3D%3D";
		        
		    	while(true) {
		    	StringBuilder urlBuilder = new StringBuilder(baseUrl); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+serviceKey); /*Service Key*/
		       // urlBuilder.append("&" + URLEncoder.encode("from_time","UTF-8") + "=" + URLEncoder.encode("1300", "UTF-8")); /*검색 시작 시간 (HHMM)*/
		       // urlBuilder.append("&" + URLEncoder.encode("to_time","UTF-8") + "=" + URLEncoder.encode("1800", "UTF-8")); /*검색 종료 시간 (HHMM)*/
		       // urlBuilder.append("&" + URLEncoder.encode("airport","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*출발지 공항 코드*/
		        
		      
		        urlBuilder.append("&" + URLEncoder.encode("lang","UTF-8") + "=" + URLEncoder.encode("E", "UTF-8")); /*국문=K, 영문=E, 중문=C, 일문=J, Null=K*/
		        
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/json");
		       
		        
		        BufferedReader rd;
		        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        } else {
		            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		        }
		        StringBuilder sb = new StringBuilder();
		        String line;
		        while ((line = rd.readLine()) != null) {
		            sb.append(line);
		        }
		        rd.close();
		        conn.disconnect();
		       
		        String response = sb.toString();
		        System.out.println(response);
		        
		        DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				InputSource is = new InputSource(new StringReader(response));
				
				Document doc = dBuilder.parse(is);
				
				// 제일 첫번째 태그
				doc.getDocumentElement().normalize();
				
				
				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("item");
				
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
				
					Element eElement = (Element) nNode;
					 inVO in = new inVO();
					in.setAirline(getTagValue("airline",eElement));
					in.setElapsetime(getTagValue("elapsetime",eElement));
					in.setScheduleDateTime(getTagValue("scheduleDateTime",eElement));
					in.setEstimatedDateTime(getTagValue("estimatedDateTime",eElement));
					in.setFlightId(getTagValue("flightId",eElement));
					in.setGatenumber(getTagValue("gatenumber",eElement));
					in.setRemark(getTagValue("remark",eElement));
					in.setArrairport(getTagValue("airport",eElement));
					in.setTerminalId(getTagValue("terminalId",eElement));
					in.setTypeOfFlight(getTagValue("typeOfFlight",eElement));
				
					
					
					
					InList.add(in);
					
					 inrepository.insert(in);
				}
				return"airport";
			}
	}
	

	
	
	
	
	 public String InAPI() throws IOException, ParserConfigurationException, SAXException  {
			
		 	inrepository.deletecleartable();
		 	IndeAPI();
		 	
		 	
		 	 
		 	
		   
		
		 	List<inVO> InList = new ArrayList<>();
			
			String baseUrl = "http://apis.data.go.kr/B551177/StatusOfPassengerFlightsOdp/getPassengerArrivalsOdp";
		    String serviceKey = "JuFxJsZ%2FJfeh1DDfL8yvx7WXGXef1SkOVsVKexFpgRM2IuJ6kE2Q%2FlDhEFspVknAtqr52khnBHB8f%2BJujUbVlg%3D%3D";
		        
		    	while(true) {
		    	StringBuilder urlBuilder = new StringBuilder(baseUrl); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+serviceKey); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("from_time","UTF-8") + "=" + URLEncoder.encode("1300", "UTF-8")); /*검색 시작 시간 (HHMM)*/
		        urlBuilder.append("&" + URLEncoder.encode("to_time","UTF-8") + "=" + URLEncoder.encode("1800", "UTF-8")); /*검색 종료 시간 (HHMM)*/
		       // urlBuilder.append("&" + URLEncoder.encode("airport","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*출발지 공항 코드*/
		        
		      
		        urlBuilder.append("&" + URLEncoder.encode("lang","UTF-8") + "=" + URLEncoder.encode("E", "UTF-8")); /*국문=K, 영문=E, 중문=C, 일문=J, Null=K*/
		        
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/json");
		       
		        
		        BufferedReader rd;
		        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        } else {
		            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		        }
		        StringBuilder sb = new StringBuilder();
		        String line;
		        while ((line = rd.readLine()) != null) {
		            sb.append(line);
		        }
		        rd.close();
		        conn.disconnect();
		       
		        String response = sb.toString();
		        System.out.println(response);
		        
		        DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				InputSource is = new InputSource(new StringReader(response));
				
				Document doc = dBuilder.parse(is);
				
				// 제일 첫번째 태그
				doc.getDocumentElement().normalize();
				
				
				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("item");
				
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
				
					Element eElement = (Element) nNode;
					 inVO in = new inVO();
					in.setAirline(getTagValue("airline",eElement));
					in.setElapsetime(getTagValue("elapsetime",eElement));
					in.setScheduleDateTime(getTagValue("scheduleDateTime",eElement));//java 년원일 db타임스탬프로 바꾸고 getta앞에 년워일 붙이고 0005이 문자 substring잘라서 00:05 :00이렇게 만들기
					in.setEstimatedDateTime(getTagValue("estimatedDateTime",eElement)); //똑같이함
					in.setFlightId(getTagValue("flightId",eElement));
					in.setGatenumber(getTagValue("gatenumber",eElement));
					in.setRemark(getTagValue("remark",eElement));
					in.setAirport(getTagValue("airport",eElement));
					in.setTerminalId(getTagValue("terminalId",eElement));
					in.setTypeOfFlight(getTagValue("typeOfFlight",eElement));
					
					InList.add(in);
					
					 inrepository.insert(in);
				}
				return"real";
			}
	}
	
	
}
