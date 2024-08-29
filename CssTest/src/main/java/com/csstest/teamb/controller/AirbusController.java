package com.csstest.teamb.controller;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.csstest.teamb.VO.airbusTOICNVO;
import com.csstest.teamb.VO.airbuskorVO;
import com.csstest.teamb.repository.airbusRepository;

@Controller
@RequestMapping("/airbus")
public class AirbusController {
	private static final Logger logger = LoggerFactory.getLogger(AirbusController.class);

	public static int PAGE_SIZE = 100; 
	
	@Autowired
	airbusRepository airbusRepository;
	
	@RequestMapping(value="/airbusToICN.do", method=RequestMethod.GET, produces = MediaType.APPLICATION_ATOM_XML_VALUE)
	public String airbusToICN() throws Exception {
		
		int result = 0; 
		int pageNo = 1; 
		int numOfRows = 10; 
		
		while(true) {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551177/BusInformation/getBusInfo");/*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=1nMkc44kPeb5SrgKM5AayNjAT2eTyulMaxyBd6hvKKjahpgMSUHSZuQ9nOzMzEKyekKnrIa4XQ9NlOfb0gBvOw=="); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한페이지 결과수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(String.valueOf(pageNo), "UTF-8")); /*데이터 표출 페이지 수*/
	        urlBuilder.append("&" + URLEncoder.encode("area","UTF-8") + "=" + URLEncoder.encode("7", "UTF-8")); /*1:서울, 2:경기, 3:인천, 4:강원, 5:충청, 6:경상, 7:전라, default=1*/
	        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*응답유형 [xml, json] default=xml*/
		
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
/*	        System.out.println("Response code: " + conn.getResponseCode());*/
	        
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
	        }
	        
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        
	        System.out.println(sb.toString());
	        
	        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance(); 
	        DocumentBuilder dBuilder = dbFactory.newDocumentBuilder(); 
	        Document doc = dBuilder.parse(new ByteArrayInputStream(sb.toString().getBytes("UTF-8"))); 
	        doc.getDocumentElement().normalize();
	        
	        NodeList nList = doc.getElementsByTagName("item"); 

	        logger.info("페이지 번호: {}, 가져온 아이템 수: {}", pageNo, nList.getLength());
	        
	        for(int i=0; i<nList.getLength(); i++) {
	        	Node nNode = nList.item(i); 
	        	if(nNode.getNodeType() == Node.ELEMENT_NODE) {
	        		Element eElement=(Element) nNode;

	        		airbusTOICNVO airbustoicnVo = new airbusTOICNVO(); 
	        		
	        		airbustoicnVo.setAdultfare(getTagValue("adultfare", eElement));
	        		airbustoicnVo.setArea(getTagValue("area", eElement));
	        		airbustoicnVo.setBusclass(getTagValue("busclass", eElement));
	        		airbustoicnVo.setBusnumber(getTagValue("busnumber", eElement));
	        		airbustoicnVo.setCpname(getTagValue("cpname", eElement));
	        		airbustoicnVo.setRouteinfo(getTagValue("routeinfo", eElement));
	        		airbustoicnVo.setT1endfirst(getTagValue("t1endfirst", eElement));
	        		airbustoicnVo.setT1endlast(getTagValue("t1endlast", eElement));
	        		airbustoicnVo.setT1ridelo(getTagValue("t1ridelo", eElement));
	        		airbustoicnVo.setT1wdayt(getTagValue("t1wdayt", eElement));
	        		airbustoicnVo.setT1wt(getTagValue("t1wt", eElement));
	        		airbustoicnVo.setT2endfirst(getTagValue("t2endfirst", eElement));
	        		airbustoicnVo.setT2endlast(getTagValue("t2endlast", eElement));
	        		airbustoicnVo.setT2ridelo(getTagValue("t2ridelo", eElement));
	        		airbustoicnVo.setT2wdayt(getTagValue("t2wdayt", eElement));
	        		airbustoicnVo.setT2wt(getTagValue("t2wt", eElement));
	        		airbustoicnVo.setToawfirst(getTagValue("toawfirst", eElement));
	        		airbustoicnVo.setToawlast(getTagValue("toawlast", eElement));

	        		
	                logger.info("파싱된 데이터: {}", airbustoicnVo);
//	                
	                result += airbusRepository.insert(airbustoicnVo); 
	        	}
	        }
	        
	        pageNo++; 
	        
		        if(nList.getLength() < numOfRows) {
		        	break;
		        }
			}
			
			logger.info("총 삽입된 데이터 수 :{}", result);
		
		return "airbusToICN"; 
	}
	
//	태그값을 읽어올 함수 
	private static String getTagValue(String tag, Element eElement) {
		Node nValue = null; 
		
		NodeList x = eElement.getElementsByTagName(tag); 
		Node test = x.item(0); 
		NodeList t = null; 
		if(test != null) {
			t = test.getChildNodes(); 
			if((Node)t.item(0) != null) {
				nValue=(Node)t.item(0);
			}
		}
		if(nValue == null) {
			return null; 
		}
		return nValue.getNodeValue(); 
	}
	
	@RequestMapping(value="/airbuskor.do", method=RequestMethod.GET, produces = MediaType.APPLICATION_ATOM_XML_VALUE)
	public String airbuskor() throws Exception {
		
		int result = 0; 
		int pageNo = 1; 
		int numOfRows = 10; 
		
		while(true) {
			StringBuilder urlBuilder = new StringBuilder("http://openapi.airport.co.kr/service/rest/AirportBusInfo/businfo");/*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=1nMkc44kPeb5SrgKM5AayNjAT2eTyulMaxyBd6hvKKjahpgMSUHSZuQ9nOzMzEKyekKnrIa4XQ9NlOfb0gBvOw=="); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(String.valueOf(pageNo), "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("schAirport","UTF-8") + "=" + URLEncoder.encode("PUS", "UTF-8")); /*제주*/
		
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
/*	        System.out.println("Response code: " + conn.getResponseCode());*/
	        
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
	        }
	        
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        
	        System.out.println(sb.toString());
	        
	        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance(); 
	        DocumentBuilder dBuilder = dbFactory.newDocumentBuilder(); 
	        Document doc = dBuilder.parse(new ByteArrayInputStream(sb.toString().getBytes("UTF-8"))); 
	        doc.getDocumentElement().normalize();
	        
	        NodeList nList = doc.getElementsByTagName("item"); 

	        logger.info("페이지 번호: {}, 가져온 아이템 수: {}", pageNo, nList.getLength());
	        
	        for(int i=0; i<nList.getLength(); i++) {
	        	Node nNode = nList.item(i); 
	        	if(nNode.getNodeType() == Node.ELEMENT_NODE) {
	        		Element eElement=(Element) nNode;

	        		airbuskorVO airbuskorVo = new airbuskorVO(); 
	        		
	        		airbuskorVo.setCategory(getTagValue("busCategoryKorName", eElement));
	        		airbuskorVo.setBusNum(getTagValue("busDataBusNum", eElement));
	        		airbuskorVo.setCard(getTagValue("busDataCard", eElement));
	        		airbuskorVo.setComName(getTagValue("busDataComnameKor", eElement));
	        		airbuskorVo.setEndTime(getTagValue("busDataEndTime", eElement));
	        		airbuskorVo.setEtc(getTagValue("busDataEtcKor", eElement));
	        		airbuskorVo.setFirstTime(getTagValue("busDataFirstTime", eElement));
	        		airbuskorVo.setGate(getTagValue("busDataGetonKor", eElement));
	        		airbuskorVo.setMoney(getTagValue("busDataMoney", eElement));
	        		airbuskorVo.setRoute(getTagValue("busDataRouteKor", eElement));
	        		

	        		
	                logger.info("파싱된 데이터: {}", airbuskorVo);
	                
	                result += airbusRepository.insert(airbuskorVo); 
	        	}
	        }
	        
	        pageNo++; 
	        
		        if(nList.getLength() < numOfRows) {
		        	break;
		        }
			}
			
			logger.info("총 삽입된 데이터 수 :{}", result);
		
		return "airbusToICN"; 
	}

	@RequestMapping(value="/bus.do", method=RequestMethod.GET)
	public String Test() throws Exception {

		return "Bus"; 
	}
	
	@ResponseBody
	@RequestMapping(value="/bus.do", method=RequestMethod.POST)
	public Map<String, Object> TestOk(			
			@RequestParam(name="city", required=false) String city,
			@RequestParam(name="airport", required=false) String airport, 
			Model model) 
			throws Exception {
		
		System.out.println(city);
		System.out.println(airport);
		
		Map<String,Object> map = new HashMap<>();
		List<airbusTOICNVO> icnList = new ArrayList<>();
		List<airbuskorVO> korList = new ArrayList<>();
		
		String airType = ""; 

		if(airport.equals("인천( ICN )")) {
			airbusTOICNVO airbustoicnVo = new airbusTOICNVO(); 
			airbustoicnVo.setBusnumber(city);
			
			icnList = airbusRepository.select(city);
			airType = "icn"; 
		}else {
			airbuskorVO airbuskorVo = new airbuskorVO();
			airbuskorVo.setBusNum(city); 

		}
		//데이터를  Model 객체에 추가
		if(!icnList.isEmpty()) {
			map.put("result", "success"); 
			map.put("data", icnList); 	
			map.put("type", airType); 
		} else {
			map.put("result", "failed");
		}
		
		
		return map; 
	}

}
