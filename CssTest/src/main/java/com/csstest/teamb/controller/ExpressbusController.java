package com.csstest.teamb.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.csstest.teamb.VO.expressgradeVO;
import com.csstest.teamb.VO.expressterVO;

import com.csstest.teamb.repository.express;
import com.csstest.teamb.repository.expressgrade ;
import com.csstest.teamb.repository.terexpress;


 


@Controller
public class ExpressbusController {
	@Autowired
	express exrepository;
	
	
	@Autowired
	expressgrade grepository;
	
	@Autowired
	terexpress terexrepository;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
	    
	    return "bus";
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
	    
	    return "bus";
	}
	
	@RequestMapping(value = "/express.do", method = RequestMethod.GET, produces = MediaType.APPLICATION_ATOM_XML_VALUE)
	public String expressAPI() throws IOException, ParserConfigurationException, SAXException {
		
	
	int pageNo= 1;
     // Total pages, initialized to 1 to start the loop
    int totalCount = 0;
    int numOfRows = 10; 
	String baseUrl="http://apis.data.go.kr/1613000/ExpBusInfoService/getStrtpntAlocFndExpbusInfo";
	String serviceKey = "JuFxJsZ%2FJfeh1DDfL8yvx7WXGXef1SkOVsVKexFpgRM2IuJ6kE2Q%2FlDhEFspVknAtqr52khnBHB8f%2BJujUbVlg%3D%3D";
	  
	while(true) {
	StringBuilder urlBuilder = new StringBuilder(baseUrl); /*URL*/
       urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+ serviceKey); /*Service Key*/
     
       urlBuilder.append("&" + URLEncoder.encode("depTerminalId","UTF-8") + "=" + URLEncoder.encode("NAEK010", "UTF-8")); /*출발터미널ID*/
      urlBuilder.append("&" + URLEncoder.encode("arrTerminalId","UTF-8") + "=" + URLEncoder.encode("NAEK300", "UTF-8")); /*도착터미널ID*/
       urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode("20240820", "UTF-8")); /*출발일(YYYYMMDD)*/
      
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
                
                System.out.println("버스등급:"+getTagValue("gradeNm",eElement));
                System.out.println("출발시간:"+getTagValue("depPlandTime",eElement));
                System.out.println("도착시간:"+getTagValue("arrPlandTime",eElement));
                System.out.println("출발지:"+getTagValue("depPlaceNm",eElement));
                System.out.println("도착지:"+getTagValue("arrPlaceNm",eElement));
                System.out.println("요금:"+getTagValue("charge",eElement));
                
               
				}	
			
			 if (pageNo * numOfRows >= totalCount) {
		            break;
		        }
				
		        // 페이지 번호 증가
		        pageNo++;
		        System.out.println("pageno: " + pageNo);
		      
			}
		    
		    return "bus";
	
}
	
	
}
