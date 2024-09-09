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
import com.csstest.teamb.VO.totalBusVO;
import com.csstest.teamb.repository.airbusRepository;

@Controller
@RequestMapping("/train")
public class SubwayController {
	private static final Logger logger = LoggerFactory.getLogger(SubwayController.class);

	@RequestMapping(value="/subway.do", method=RequestMethod.GET)
	public String subway() throws Exception {

		return "subway"; 
	}

}
