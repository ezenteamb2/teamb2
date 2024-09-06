package com.csstest.teamb.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

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
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.csstest.teamb.VO.FlightInfoVO;
import com.csstest.teamb.VO.expressVO;
import com.csstest.teamb.VO.expressgradeVO;
import com.csstest.teamb.VO.expressterVO;

import com.csstest.teamb.repository.express;
import com.csstest.teamb.repository.expressgrade ;
import com.csstest.teamb.repository.terexpress;




 


@Controller
@RequestMapping("/bus")
public class ExpressbusController {
	@Autowired
	express exrepository;
	
	
	@Autowired
	expressgrade grepository;
	
	@Autowired
	terexpress terexrepository;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/i.do", method = RequestMethod.GET)
	public String I() throws Exception{
		return "Bus2";
	}
	
	@RequestMapping(value = "/expresster.do", method = RequestMethod.GET, produces = MediaType.APPLICATION_ATOM_XML_VALUE)
	public String expressterAPI() throws IOException, ParserConfigurationException, SAXException {
	
	List<expressterVO> terlist=new ArrayList<>();
		int pageNo= 1;
    // Total pages, initialized to 1 to start the loop
	   int totalCount = 0;
	   int numOfRows = 10; 
	
	
	String baseUrl="http://apis.data.go.kr/1613000/ExpBusInfoService/getExpBusTrminlList";
	String serviceKey = "JuFxJsZ%2FJfeh1DDfL8yvx7WXGXef1SkOVsVKexFpgRM2IuJ6kE2Q%2FlDhEFspVknAtqr52khnBHB8f%2BJujUbVlg%3D%3D";
	
	
	while(true) {
	StringBuilder urlBuilder = new StringBuilder(baseUrl);
	 urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+serviceKey); /*Service Key*/
	 urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + pageNo);
	
     //urlBuilder.append("&" + URLEncoder.encode("terminalNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*터미널명*/
     
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
	    doc.getDocumentElement().normalize();
	  
	    if (totalCount == 0) {
	            NodeList totalCountList = doc.getElementsByTagName("totalCount");
	            if (totalCountList.getLength() > 0) {
	                String totalCountStr = totalCountList.item(0).getTextContent().trim();
	                totalCount = Integer.parseInt(totalCountStr);
	                
	                System.out.println("Total count: " + totalCount);  // 디버깅: totalCount 확인
	            } else {
	                System.out.println("totalcount없.");
	                break; 
	            }
	        }
			
			
		
	 // XML 데이터 중 <item> 태그의 내용을 가져온다.
		NodeList nList = doc.getElementsByTagName("item");
		 if (nList.getLength() == 0) {
			 System.out.println("데이터 없.");
            break; // 더이상 데이터가 없으면 종료
        }
    
		 for(int temp = 0; temp < nList.getLength(); temp++){
				
				Node nNode = nList.item(temp);
				
          Element eElement=(Element) nNode;
          expressterVO texpress= new expressterVO();
          
         texpress.setTerminalNm(getTagValue("terminalNm", eElement));
         texpress.setTerminalld(getTagValue("terminalId", eElement));
         texpress.setArrterminalld(getTagValue("terminalId", eElement));
        
         texpress.setExpressType(1);
         terlist.add(texpress);
			  
         
         terexrepository.insert(texpress);
			
		 }	
			
		 if (pageNo * numOfRows >= totalCount) {
	            break;
	        }
			
	        // 페이지 번호 증가
	        pageNo++;
	        System.out.println("pageno: " + pageNo);
	        
	        
       
}
	    for (expressterVO texpress : terlist) {
	        System.out.println(texpress);
	    }
	    
	    return "Bus2";
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
	
	
	@RequestMapping(value = "/expressgrade.do", method = RequestMethod.GET, produces = MediaType.APPLICATION_ATOM_XML_VALUE)
	public String expressgradeAPI() throws IOException, ParserConfigurationException, SAXException {
	List<expressgradeVO> gradelist=new ArrayList<>();
		int pageNo= 1;
    // Total pages, initialized to 1 to start the loop
	   int totalCount = 0;
	   int numOfRows = 10; 
	
	
	String baseUrl="http://apis.data.go.kr/1613000/ExpBusInfoService/getExpBusGradList";
	String serviceKey = "JuFxJsZ%2FJfeh1DDfL8yvx7WXGXef1SkOVsVKexFpgRM2IuJ6kE2Q%2FlDhEFspVknAtqr52khnBHB8f%2BJujUbVlg%3D%3D";
	
	
	while(true) {
	StringBuilder urlBuilder = new StringBuilder(baseUrl);
	 urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+serviceKey); /*Service Key*/
	 urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + pageNo);
	
     //urlBuilder.append("&" + URLEncoder.encode("terminalNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*터미널명*/
     
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
	    doc.getDocumentElement().normalize();
	  
	   
			
			
		
	 // XML 데이터 중 <item> 태그의 내용을 가져온다.
		NodeList nList = doc.getElementsByTagName("item");
		 if (nList.getLength() == 0) {
			 System.out.println("데이터 없.");
            break; // 더이상 데이터가 없으면 종료
        }
    
		 for(int temp = 0; temp < nList.getLength(); temp++){
				
				Node nNode = nList.item(temp);
				
          Element eElement=(Element) nNode;
          expressgradeVO gexpress= new expressgradeVO();
          
         gexpress.setGradeNm(getTagValue("gradeNm", eElement));
         gexpress.setGradeId(getTagValue("gradeId", eElement));
        
         gexpress.setExpressType(1);
         gradelist.add(gexpress);
			  
         
         grepository.insert(gexpress);
			
		 }	
			
		 if (pageNo * numOfRows >= totalCount) {
	            break;
	        }
			
	        // 페이지 번호 증가
	        pageNo++;
	        System.out.println("pageno: " + pageNo);
	        
	        
       
}
	    for (expressgradeVO gexpress : gradelist) {
	        System.out.println(gexpress);
	    }
	    
	    return "bus2";
	}
	
	@ResponseBody
	@RequestMapping(value = "/express.do", method = RequestMethod.POST)
	public Map<String, Object> expressAPI (Model model, @RequestParam(name="city", required=false) String city, @RequestParam(name="airport",required=false) String airport
			, @RequestParam(name="expressType",required=false) String expressType
			) throws IOException, ParserConfigurationException, SAXException {
		Map<String,Object> map=new HashMap<>();
		List<expressVO> eList = new ArrayList<>();
		Map<String,String> paramMap=new HashMap<>();
		
		paramMap.put("city", city);
		paramMap.put("airport", airport);
		if(expressType.equals("고속")) {
			paramMap.put("expressType", "1");
		}else {
			paramMap.put("expressType", "0");
		}
			if (city ==  null || airport ==  null ) {
	        //throw new IllegalArgumentException("터미널 ID가 존재하지 않습니다.");
				map.put("data", "fail");
				return map; 
	} 
		
		String depTerminalId = terexrepository.getTerminalld(paramMap); // 예시 메소드
		String arrTerminalId = terexrepository.getArrterminalld(paramMap); // 예시 메소드
		
		if (depTerminalId == null || arrTerminalId == null) {
	        //throw new IllegalArgumentException("터미널 ID가 존재하지 않습니다.");
		map.put("data", "fail");
		return map; 
	} 
		
		
		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        String formattedDate = currentDate.format(formatter);
		
		System.out.println("depTerminalId::"+depTerminalId);
		System.out.println("arrTerminalId::"+arrTerminalId);
		System.out.println(formattedDate);
		   
		    
		   
		
	int pageNo= 1;
     // Total pages, initialized to 1 to start the loop
    int totalCount = 0;
    int numOfRows = 10; 
	String baseUrl="http://apis.data.go.kr/1613000/ExpBusInfoService/getStrtpntAlocFndExpbusInfo";
	String serviceKey = "JuFxJsZ%2FJfeh1DDfL8yvx7WXGXef1SkOVsVKexFpgRM2IuJ6kE2Q%2FlDhEFspVknAtqr52khnBHB8f%2BJujUbVlg%3D%3D";
	  
	while(true) {
	StringBuilder urlBuilder = new StringBuilder(baseUrl); /*URL*/
       urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+ serviceKey); /*Service Key*/
     
       urlBuilder.append("&" + URLEncoder.encode("depTerminalId","UTF-8") + "=" + URLEncoder.encode(depTerminalId, "UTF-8")); /*출발터미널ID*/
       urlBuilder.append("&" + URLEncoder.encode("arrTerminalId","UTF-8") + "=" + URLEncoder.encode(arrTerminalId, "UTF-8")); /*도착터미널ID*/
       urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(formattedDate,"UTF-8")); /*출발일(YYYYMMDD)*/
      
       urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + pageNo);
       urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + numOfRows);
    
       URL url = new URL(urlBuilder.toString());
       HttpURLConnection conn = (HttpURLConnection) url.openConnection();
       conn.setRequestMethod("GET");
       conn.setRequestProperty("Content-type", "application/json");
       System.out.println("Response code: " + conn.getResponseCode());
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
      
       
       	DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
		InputSource is = new InputSource(new StringReader(response));
		Document doc = dBuilder.parse(is);
	    doc.getDocumentElement().normalize();
	  
	    if (totalCount == 0) {
            NodeList totalCountList = doc.getElementsByTagName("totalCount");
            if (totalCountList.getLength() > 0) {
                String totalCountStr = totalCountList.item(0).getTextContent().trim();
                totalCount = Integer.parseInt(totalCountStr);
                
                System.out.println("Total count: " + totalCount);  // 디버깅: totalCount 확인
            } else {
                System.out.println("totalcount없.");
                break; 
            }
        }
	    
	    
			
			
		 // XML 데이터 중 <item> 태그의 내용을 가져온다.
			NodeList nList = doc.getElementsByTagName("item");
			 if (nList.getLength() == 0) {
	            break; // 더이상 데이터가 없으면 종료
	        }
	    
			 for(int temp = 0; temp < nList.getLength(); temp++){
					
					Node nNode = nList.item(temp);
					
                Element eElement=(Element) nNode;
                expressVO evo = new expressVO();
                evo.setGradeNm(getTagValue("gradeNm",eElement));
                evo.setDepPlandTime(getTagValue("depPlandTime",eElement));
                evo.setArrPlandTime(getTagValue("arrPlandTime",eElement));
                evo.setDepPlaceNm(getTagValue("depPlaceNm",eElement));
                evo.setArrPlaceNm(getTagValue("arrPlaceNm",eElement));
                evo.setCharge(getTagValue("charge",eElement));
                
               eList.add(evo);
               
               if(!eList.isEmpty()) {
			 		map.put("result", "success");
			 		map.put("data",eList);
			 		
			 	}else {
			 		map.put("result", "failed");
			 	}
               
			 }
			 
			
			 	
			 
			 if (pageNo * numOfRows >= totalCount) {
		            break;
		        }
				
		        // 페이지 번호 증가
		        pageNo++;
		        System.out.println("pageno: " + pageNo);
		        
		        
	}
	return map;
		
	
}
	@RequestMapping(value = "/express.do", method = RequestMethod.GET)
	public String ex()throws Exception{
		return "Bus2";
	}
}
