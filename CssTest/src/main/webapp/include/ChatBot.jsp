<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" href="<c:url value='/resources/css/ChatBot.css' />"> <!-- css -->

<!-- 자바스크립트 -->
<script src="<c:url value='/resources/js/jquery-3.7.1.min.js' />"></script>


<script>
	
	$(function(){
		
		/* 챗봇 창열기 */
		$(".Chat_BotProfile").on("mouseenter",function(){
			
			var BotProfile = $(".Chat_BotProfile");
			BotProfile.animate({width: '300px'}, "fast");
		
		});
		
		$(".Chat_BotProfile").on("mouseleave",function(){
			var BotProfile = $(".Chat_BotProfile");
			BotProfile.animate({width: '65px'}, "fast");
		
		});
		
		$(".Chat_BotProfile").on("click",function(){
			
			if($(".ChatBot_Div").css("display") == "none"){
				$(".ChatBot_Div").css("display","block");
				$(".ChatBot_body").empty();
				$(".ChatBot_body").append(
						
					"<div class='ChatBot_box_profile'>" +
						"<img src='<c:url value='/resources/img/ChatBot_img/BotProfile.png' />' style='width: 50px; margin: auto; position: relative;'>"+
					"</div>" +
					"<div class='ChatBot_loding'>"+
						"<div class='dots-flow'></div>"+
					"</div>"
						
				);
				
				setTimeout(function() {
					$(".ChatBot_body").append(
							
					
					"<div class='ChatBot_text'>"+
						"안녕하세요 에어두드림 챗봇 드림이 입니다.<br>"+
						"아래에 궁금한 점을 선택해주세요"+
						
						"<div class='chatBot_question_div'>"+
							"<div class='chatbot_Tag' id='Flight_information'>"+
								"공항 정보"+
							"</div>"+
							"<div class='chatbot_Tag' id='Train_information'>"+
								"열차 정보"+
							"</div>"+
							"<div class='chatbot_Tag' id='Bus_information'>"+
								"버스 정보"+
							"</div>"+
							"<div class='chatbot_Tag' id='Lodging_information'>"+
								"숙박 정보"+
							"</div>"+
						"</div>"+
						
						"다른 궁금한 점은 1:1 채팅을 해주세요"+
						"<a href='http://localhost:5000/' onclick='window.open(this.href, `_blank`, `width=418, height=645`); return false;' style='color : black;' rel='noopener noreferrer'>"+
							"<div class='chatbot_Tag' id='WebSocket_Chat' style='margin-top: 15px; width: 270px;'>"+
								"1:1채팅"+
							"</div>"+
						"</a>"+
					"</div>"
					
					);
				}, 1500);
				
			/* 챗봇 프로필 눌러서 창닫기 */
			}else if($(".ChatBot_Div").css("display") == "block"){
				$(".ChatBot_Div").css("display","none");
				$(".ChatBot_body").empty();
				
				var BotProfile = $(".Chat_BotProfile");
				BotProfile.animate({width: '65px'});
				BotProfile.animate({scale: '1'});
				BotProfile.animate({scale: '1.3'});
				BotProfile.animate({scale: '1'});
				BotProfile.animate({scale: '1.3'});
				BotProfile.animate({scale: '1'});
				
			}
			
		})
		
		/* 챗봇 창 닫기 */
		$("#chatBot_close").on("click",function(){
			$(".ChatBot_Div").css("display","none");
			
			var BotProfile = $(".Chat_BotProfile");
			BotProfile.animate({scale: '1'});
			BotProfile.animate({scale: '1.3'});
			BotProfile.animate({scale: '1'});
			BotProfile.animate({scale: '1.3'});
			BotProfile.animate({scale: '1'});
				
			
		})
		
		/* 챗봇 창 새로고침 */
		$("#chatBot_Refresh").on("click",function(){
			$(".ChatBot_body").empty();
			$(".ChatBot_body").append(
					
				"<div class='ChatBot_box_profile'>" +
					"<img src='<c:url value='/resources/img/ChatBot_img/BotProfile.png' />' style='width: 50px; margin: auto; position: relative;'>" +
				"</div>" +
				"<div class='ChatBot_loding'>"+
					"<div class='dots-flow'></div>"+
				"</div>"
					
			);
			
			setTimeout(function() {
				$(".ChatBot_body").append(
						
				
				"<div class='ChatBot_text'>"+
					"안녕하세요 에어두드림 챗봇 드림이 입니다.<br>"+
					"아래에 궁금한 점을 선택해주세요"+
					
					"<div class='chatBot_question_div'>"+
						"<div class='chatbot_Tag' id='Flight_information'>"+
							"공항 정보"+
						"</div>"+
						"<div class='chatbot_Tag' id='Train_information'>"+
							"열차 정보"+
						"</div>"+
						"<div class='chatbot_Tag' id='Bus_information'>"+
							"버스 정보"+
						"</div>"+
						"<div class='chatbot_Tag' id='Lodging_information'>"+
							"숙박 정보"+
						"</div>"+
					"</div>"+
					
					"다른 궁금한 점은 1:1 채팅을 해주세요"+
					"<a href='http://localhost:5000/' onclick='window.open(this.href, `_blank`, `width=418, height=645`); return false;' style='color : black;' rel='noopener noreferrer'>"+
						"<div class='chatbot_Tag' id='WebSocket_Chat' style='margin-top: 15px; width: 270px;'>"+
							"1:1채팅"+
						"</div>"+
					"</a>"+
				"</div>"
				
				);
			}, 1500);
			
		})
		
			/*  -------------------------------------  태그 선택  -------------------------------------  */
		
		
		
		
		/* 공항정보 */
		$(document).on("click", "#Flight_information", function(){
			/* 사용차 말풍선 */
			$(".ChatBot_body").append("<div class='user_text'>공항 정보</div>");
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			/* 챗봇 로딩 */
			$(".ChatBot_body").append(
					
					"<div class='ChatBot_box_profile'>" +
						"<img src='<c:url value='/resources/img/ChatBot_img/BotProfile.png' />' style='width: 50px; margin: auto; position: relative;'>" +
					"</div>" +
					"<div class='ChatBot_loding'>"+
						"<div class='dots-flow'></div>"+
					"</div>"
						
			);
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			/* 챗봇 말풍선 */
			setTimeout(function() {
				
				
				$(".ChatBot_body").append(
	
					"<div class='ChatBot_text' id='Flight_info'>공항 정보를 선택해주세요"+
						"<div>"+
							"<a href='<c:url value='/air/flight-schedule'/>'>"+
								"<div class='chatbot_Tag' id='Flight_schedule'>운항스케줄</div>"+
							"</a>"+
							"<div class='chatbot_Tag' id='Airline_ticket_reservation'>항공권 구매</div>"+
							"<div class='chatbot_Tag' id='Parking_information'>주차안내</div>"+
							"<div class='chatbot_Tag' id='public_transportation'>대중교통 안내</div>"+
							"<div class='chatbot_Tag' id='Amenities_information'>편의시설 안내</div>"+
						"</div>"+
					"</div>"
				);
			
				$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			}, 1500);
			
		});
		
		
		/* 공항정보 -> 항공권 예매 */
		$(document).on("click", "#Airline_ticket_reservation", function(){
			$(".ChatBot_body").append("<div class='user_text'>항공권 구매</div>");
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			/* 챗봇 로딩 */
			$(".ChatBot_body").append(
					
					"<div class='ChatBot_box_profile'>" +
						"<img src='<c:url value='/resources/img/ChatBot_img/BotProfile.png' />' style='width: 50px; margin: auto; position: relative;'>" +
					"</div>" +
					"<div class='ChatBot_loding'>"+
						"<div class='dots-flow'></div>"+
					"</div>"
						
			);
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			setTimeout(function() {
				
				$(".ChatBot_body").append(
					
					"<div class='ChatBot_text'>항공권 구매 사이트를 선택해주세요"+
						"<div>"+
						
							"<a href='https://kr.trip.com/'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/TripCom.png' />' style='width: 70px; position: relative; top: 2px;'>"+
								"</div>"+
							"</a>"+
							
							"<a href='https://www.hanatour.com/mma/smn/EX00000021'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/hanatour.png' />' style='width: 70px; position: relative; top: 3px;'>"+
								"</div>"+
							"</a>"+

							"<a href='https://www.agoda.com/ko-kr/flights?cid=1834243&tag=709d0d8a-697c-4ab7-8044-9ad608d93f7b&gclid=EAIaIQobChMIicih97zihwMV_M8WBR2imgMCEAMYAiAAEgKPlvD_BwE&ds=TisNug27SQ0ScV2P'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/agoda.png' />' style='width: 48px; position: relative; bottom: 3px'>"+
								"</div>"+
							"</a>"+
							
							"<a href='https://www.modetour.com/flights'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/modu.png' />' style='width: 70px; position: relative; top: 3px;'>"+
								"</div>"+
							"</a>"+
							
							"<a href='https://air.gmarket.co.kr/gm/init/lp/lpMain.do'>"+
								"<div class='chatbot_Tag' style='height:20px; '>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/Gmarket.png' />' style='width: 70px; position: relative;'>"+
								"</div>"+
							"</a>"+
							
							"<a href='https://www.koreanair.com/booking/search?hl=ko'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/koreanAir.png' />' style='width: 70px; width: 74px; margin-top: 5px;'>"+
								"</div>"+
							"</a>"+
							
							"<a href='https://www.expedia.co.kr/air'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/expidia.png' />' style='width: 70px; position: relative; top: 2px;'>"+
								"</div>"+
							"</a>"+
							
							"<a href='https://flyasiana.com/C/KR/KO/index?site_preference=normal'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/asiana.png' />' style='width: 76px; position: relative; bottom: 2px;'>"+
								"</div>"+
							"</a>"+
							
							
						"</div>"+
					"</div>"
				);
				
				$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			}, 1500);
			
		})
		
		/* 공항정보 -> 주차안내 */
		$(document).on("click", "#Parking_information", function(){
			
			$(".ChatBot_body").append("<div class='user_text'>주차안내</div>");
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			/* 챗봇 로딩 */
			$(".ChatBot_body").append(
					
					"<div class='ChatBot_box_profile'>" +
						"<img src='<c:url value='/resources/img/ChatBot_img/BotProfile.png' />' style='width: 50px; margin: auto; position: relative;'>" + 
					"</div>" +
					"<div class='ChatBot_loding'>"+
						"<div class='dots-flow'></div>"+
					"</div>"
						
			);
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			setTimeout(function() {
				
				$(".ChatBot_body").append(
					
					"<div class='ChatBot_text' id='airport_select'>주차정보를 확인할 공항을 선택해주세요"+
						"<div>"+
							
							"<a href='https://www.airport.kr/ap_cnt/ko/tpt/parinf/parinf.do'>"+
								"<div class='chatbot_Tag'>인천 공항</div>" +
							"</a>"+
							
							"<a href='https://www.airport.co.kr/gimpo/cms/frCon/index.do?MENU_ID=1360'>"+
								"<div class='chatbot_Tag'>김포 공항</div>" +
							"</a>"+
							
							"<a href='https://www.airport.co.kr/gimhae/cms/frCon/index.do?MENU_ID=190'>"+
								"<div class='chatbot_Tag'>김해 공항</div>" +
							"</a>"+
							
							"<a href='https://www.airport.co.kr/jeju/cms/frCon/index.do?MENU_ID=120'>"+
								"<div class='chatbot_Tag'>제주 공항</div>"+
							"</a>"+
							
						"</div>"+
					"</div>"
				);
				$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
				
			}, 1500);
			
			
		})
		
		
		/* 공항정보 -> 대중교통 */
		$(document).on("click", "#public_transportation", function(){
			
			$(".ChatBot_body").append("<div class='user_text'>대중교통 안내</div>");
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			/* 챗봇 로딩 */
			$(".ChatBot_body").append(
					
					"<div class='ChatBot_box_profile'>" +
						"<img src='<c:url value='/resources/img/ChatBot_img/BotProfile.png' />' style='width: 50px; margin: auto; position: relative;'>" +
					"</div>" +
					"<div class='ChatBot_loding'>"+
						"<div class='dots-flow'></div>"+
					"</div>"
						
			);
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			setTimeout(function() {
				
				$(".ChatBot_body").append(
					
					"<div class='ChatBot_text' id='airport_select'>대중교통 정보를 확인할 공항을 선택해주세요"+
						"<div>"+
							
							"<a href='https://www.airport.kr/ap_cnt/ko/tpt/pblctpt/pblctpt.do'>"+
								"<div class='chatbot_Tag'>인천 공항</div>" +
							"</a>"+
							
							"<a href='https://www.airport.co.kr/gimpo/cms/frCon/index.do?MENU_ID=1290'>"+
								"<div class='chatbot_Tag'>김포 공항</div>" +
							"</a>"+
							
							"<a href='https://www.airport.co.kr/gimhae/cms/frCon/index.do?MENU_ID=170'>"+
								"<div class='chatbot_Tag'>김해 공항</div>" +
							"</a>"+
							
							"<a href='https://www.airport.co.kr/jeju/cms/frCon/index.do?MENU_ID=100'>"+
								"<div class='chatbot_Tag'>제주 공항</div>"+
							"</a>"+
							
						"</div>"+
					"</div>"
				);
				$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
				
			}, 1500);
			
			
		});
		
		/* 공항정보 -> 편의시설 안내 */
		$(document).on("click", "#Amenities_information", function(){
			
			$(".ChatBot_body").append("<div class='user_text'>편의시설 안내</div>");
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			/* 챗봇 로딩 */
			$(".ChatBot_body").append(
					
					"<div class='ChatBot_box_profile'>" +
						"<img src='<c:url value='/resources/img/ChatBot_img/BotProfile.png' />' style='width: 50px; margin: auto; position: relative;'>" +
					"</div>" +
					"<div class='ChatBot_loding'>"+
						"<div class='dots-flow'></div>"+
					"</div>"
						
			);
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			setTimeout(function() {
				
				$(".ChatBot_body").append(
					
					"<div class='ChatBot_text' id='airport_select'>편의시설 정보를 확인할 공항을 선택해주세요"+
						"<div>"+
							
							"<a href='https://www.airport.kr/ap/ko/svc/getFacilityMain.do'>"+
								"<div class='chatbot_Tag'>인천 공항</div>" +
							"</a>"+
							
							"<a href='https://www.airport.co.kr/gimpo/cms/frCon/index.do?MENU_ID=1420&acd=A1101'>"+
								"<div class='chatbot_Tag'>김포 공항</div>" +
							"</a>"+
							
							"<a href='https://www.airport.co.kr/gimhae/cms/frCon/index.do?MENU_ID=220&acd=A1102'>"+
								"<div class='chatbot_Tag'>김해 공항</div>" +
							"</a>"+
							
							"<a href='https://www.airport.co.kr/jeju/cms/frCon/index.do?MENU_ID=160&acd=A1103'>"+
								"<div class='chatbot_Tag'>제주 공항</div>"+
							"</a>"+
							
						"</div>"+
					"</div>"
				);
				$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
				
			}, 1500);
			
			
		});
		
		
		
		
		
		
		/* 열차정보 */
		$(document).on("click", "#Train_information", function(){
			$(".ChatBot_body").append("<div class='user_text'>열차 정보</div>");
			
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			$(".ChatBot_body").append(
					
					"<div class='ChatBot_box_profile'>" +
						"<img src='<c:url value='/resources/img/ChatBot_img/BotProfile.png' />' style='width: 50px; margin: auto; position: relative;'>" +
					"</div>" +
					"<div class='ChatBot_loding'>"+
						"<div class='dots-flow'></div>"+
					"</div>"
						
			);
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			setTimeout(function() {
				
				$(".ChatBot_body").append(
					
					"<div class='ChatBot_text'>열차 정보를 선택해주세요"+
						"<div>"+
							"<div class='chatbot_Tag' >열차 조회</div>" +
							"<div class='chatbot_Tag' id='Train_ticket_reservation' style='width: 90px;'>열차 예매하기</div>" +
						"</div>"+
					"</div>"
				);
				
				$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			}, 1500);
		});
		
		
		/* 열차정보 -> 열차 예매하기 */
		$(document).on("click", "#Train_ticket_reservation", function(){
			$(".ChatBot_body").append("<div class='user_text'>열차 예매하기</div>");
			
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			$(".ChatBot_body").append(
					
					"<div class='ChatBot_box_profile'>" +
						"<img src='<c:url value='/resources/img/ChatBot_img/BotProfile.png' />' style='width: 50px; margin: auto; position: relative;'>" +
					"</div>" +
					"<div class='ChatBot_loding'>"+
						"<div class='dots-flow'></div>"+
					"</div>"
						
			);
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			setTimeout(function() {
				
				$(".ChatBot_body").append(
					
					"<div class='ChatBot_text'>열차 예매 사이트를 선택해주세요"+
						"<div>"+
						
							"<a href='https://www.letskorail.com/ebizprd/EbizPrdTicketpr21100W_pr21110.do'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/korail.png' />' style='width: 76px; position: relative; bottom: 2px;'>"+
								"</div>"+
							"</a>"+

							"<a href='https://etk.srail.kr/main.do'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/srt.png' />' style='width: 57px; position: relative; bottom: -1px;'>"+
								"</div>"+
							"</a>"+

							"<a href='https://www.yanolja.com/train'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/yanolja.png' />' style='width: 63px; position: relative;'>"+
								"</div>"+
							"</a>"+

							"<a href='https://kr.trip.com/trains/korail/'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/TripCom.png' />' style='width: 70px; position: relative; bottom: -2px;'>"+
								"</div>"+
							"</a>"+

							"<a href='https://www.airportrailroad.com/'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/arex.png' />' style='width: 67px; position: relative;'>"+
								"</div>"+
							"</a>"+
						
						"</div>"+
					"</div>"
				);
				
				$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			}, 1500);
			
			
		})
		
		
		
		
		
		
		
		
		/* 버스정보 */
		$(document).on("click", "#Bus_information", function(){
			$(".ChatBot_body").append("<div class='user_text'>버스 정보</div>");
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			/* 챗봇 로딩 */
			$(".ChatBot_body").append(
					
					"<div class='ChatBot_box_profile'>" +
						"<img src='resources/img/ChatBot_img/BotProfile.png' style='width: 50px; margin: auto; position: relative;'>" +
					"</div>" +
					"<div class='ChatBot_loding'>"+
						"<div class='dots-flow'></div>"+
					"</div>"
						
			);
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			setTimeout(function() {
				
				$(".ChatBot_body").append(
					
					"<div class='ChatBot_text'>버스 정보를 선택해주세요"+
						"<div>"+
							"<a href='<c:url value='/airbus/bus.do'/>'>"+
								"<div class='chatbot_Tag' >버스 조회</div>" +
							"</a>"+
							"<div class='chatbot_Tag' id='bus_ticket_reservation' style='width: 90px;'>버스 예매하기</div>" +
						"</div>"+
					"</div>"
				);
				
				$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			}, 1500);
			
			
		});
		
		
		
		/* 버스정보 -> 버스 예매하기 */
		$(document).on("click", "#bus_ticket_reservation", function(){
			$(".ChatBot_body").append("<div class='user_text'>버스 예매하기</div>");
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			/* 챗봇 로딩 */
			$(".ChatBot_body").append(
					
					"<div class='ChatBot_box_profile'>" +
						"<img src='<c:url value='/resources/img/ChatBot_img/BotProfile.png' />' style='width: 50px; margin: auto; position: relative;'>" +
					"</div>" +
					"<div class='ChatBot_loding'>"+
						"<div class='dots-flow'></div>"+
					"</div>"
						
			);
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			setTimeout(function() {
				
				$(".ChatBot_body").append(
					
					"<div class='ChatBot_text'>버스 예매 사이트를 선택해주세요"+
						"<div>"+
							"<a href='https://www.kobus.co.kr/main.do'>"+
								"<div class='chatbot_Tag' style='height:20px; width: 45px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/kobus.png' />' style='width: 25px; position: relative; bottom: 2px;'>"+
								"</div>"+
							"</a>"+
							
							"<a href='https://txbus.t-money.co.kr/main.do'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/Tmoney.png' />' style='width: 70px; position: relative; bottom: -1px;'>"+
								"</div>"+
							"</a>"+
						
						"</div>"+
					"</div>"
				);
				
				$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			}, 1500);
		});
		
		
		
		
		
		
		
		/* 숙박정보 */
		$(document).on("click", "#Lodging_information", function(){
			$(".ChatBot_body").append("<div class='user_text'>숙박 정보</div>");
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			/* 챗봇 로딩 */
			$(".ChatBot_body").append(
					
					"<div class='ChatBot_box_profile'>" +
						"<img src='<c:url value='/resources/img/ChatBot_img/BotProfile.png' />' style='width: 50px; margin: auto; position: relative;'>" +
					"</div>" +
					"<div class='ChatBot_loding'>"+
						"<div class='dots-flow'></div>"+
					"</div>"
						
			);
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			setTimeout(function() {
				
				$(".ChatBot_body").append(
						
					"<div class='ChatBot_text'>숙박 정보를 선택해주세요"+
						"<div>"+
							"<a href='<c:url value='/lodging.do'/>'>"+
								"<div class='chatbot_Tag' style='width: 120px;'>공항근처 숙소찾기</div>" +
							"</a>"+
							"<div class='chatbot_Tag' id='lodging_reservation' style='width: 100px;'>숙소 예약하기</div>" +
						"</div>"+
					"</div>"
				);
				$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			}, 1500);
			
			
		});
		
		
		/* 숙박 정보 -> 숙소 예약하기 */
		$(document).on("click", "#lodging_reservation", function(){
			$(".ChatBot_body").append("<div class='user_text'>숙소 예약하기</div>");
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			/* 챗봇 로딩 */
			$(".ChatBot_body").append(
					
					"<div class='ChatBot_box_profile'>" +
						"<img src='<c:url value='/resources/img/ChatBot_img/BotProfile.png' />' style='width: 50px; margin: auto; position: relative;'>" +
					"</div>" +
					"<div class='ChatBot_loding'>"+
						"<div class='dots-flow'></div>"+
					"</div>"
						
			);
			$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
			
			setTimeout(function() {
				
				$(".ChatBot_body").append(
					
					"<div class='ChatBot_text' id='airport_select'>숙소 예약 사이트를 선택해주세요"+
						"<div>"+
							
							"<a href='https://kr.trip.com/hotels/'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/TripCom.png' />' style='width: 70px; position: relative; top:3px;'>"+ 
								"</div>"+
							"</a>"+
						
						
							"<a href='https://www.expedia.co.kr/Hotels'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/expidia.png' />' style='width: 70px; position: relative; top: 2px;'>"+
								"</div>"+
							"</a>"+
						
							"<a href='https://www.airbnb.co.kr/'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/airbnb.png' />' style='width: 70px; position: relative; bottom: 2px;'>"+
								"</div>"+
							"</a>"+
						
							"<a href='https://www.hotelscombined.co.kr/'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/hotelscombined.png' />' style='width: 70px; position: relative; bottom: 9px;'>"+
								"</div>"+
							"</a>"+
						
							"<a href='https://www.yanolja.com/'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/yanolja.png' />' style='width: 70px;'>"+
								"</div>"+
							"</a>"+
						
							"<a href='https://www.yeogi.com/'>"+
								"<div class='chatbot_Tag' style='height:20px; margin-top: 3px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/yeogi.png' />' style='width: 70px; position: relative; top: 4px;'>"+
								"</div>"+
							"</a>"+
						
							"<a href='https://www.agoda.com/?cid=1844104&ds=WIv5J77qGUa5BXLP'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/agoda.png' />' style='width: 48px; position: relative; bottom: 2px;'>"+
								"</div>"+
							"</a>"+
							
							"<a href='https://kr.hotels.com/'>"+
								"<div class='chatbot_Tag' style='height:20px;'>"+
									"<img src='<c:url value='/resources/img/ChatBot_img/HotelCom.png' />' style='width: 70px; position: relative; top: 1px;'>"+
								"</div>"+
							"</a>"+
						
						"</div>"+
					"</div>"
				);
				$(".ChatBot_body").scrollTop($(".ChatBot_body").prop('scrollHeight'));
				
			}, 1500);

			
		})
		
		
	});
	
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
				$('.top_button').fadeIn();
            } else {
                $('.top_button').fadeOut();
            }
        });
        
        $(".top_button").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });

	
</script>

<div class="top_button">
	<img src="<c:url value='/resources/img/ChatBot_img/TopButton.png' />" style="width: 35px; position:relative; top:6px ">
	<p style="font-family: 'Cafe24Decoschool'; margin:0px; position: relative; top: 8px;">TOP</p>
</div>


<div class="Chat_BotProfile">

	<img src="<c:url value='/resources/img/ChatBot_img/BotProfile.png' />" class="bot_img">
	<div class="bot_TitleTextDiv">
		<p style="margin : 0px; margin-top: 15px; font-size: 14px;">안녕하세요</p>
		<p style="margin : 0px; margin-top: 5px; font-size: 14px;">에어두드림 챗봇 입니다</p>
	</div>
	
</div>
	
	<div class="ChatBot_Div">
	
		<div class="chat_title">
			챗봇 드림이
			<div id="chatBot_Refresh" style="position: relative; bottom: 50px; right: -25px; width: 40px;">
				<img src="<c:url value='/resources/img/ChatBot_img/chatBot_Refresh.png' />" style="width: 35px;">	
			</div>
			<div id="chatBot_close" style="position: relative; bottom: 85px; left: 390px; width: 40px;">
				<img src="<c:url value='/resources/img/ChatBot_img/ChatBot_close.png' />" style="width: 35px;">	
			</div>
		</div>
		
		<!-- 챗봇 대화창 -->
		<div class="ChatBot_body">
			
			
			<div class="ChatBot_box_profile">
				<img src="<c:url value='/resources/img/ChatBot_img/BotProfile.png' />" style="width: 50px; margin: auto; position: relative;">
			</div>
			
			<div class="ChatBot_text">
				안녕하세요 에어두드림 챗봇 드림이 입니다.<br>
				아래에 궁금한 점을 선택해주세요
				<div class="chatBot_question_div">
					<div class="chatbot_Tag" id="Flight_information">
						공항 정보
					</div>
					<div class="chatbot_Tag" id="Train_information">
						열차 정보
					</div>
					<div class="chatbot_Tag" id="Bus_information">
						버스 정보
					</div>
					<div class="chatbot_Tag" id="Lodging_information">
						숙박 정보
					</div>
				</div>
				다른 궁금한 점은 1:1 채팅을 해주세요
				<a href="http://localhost:5000/" onclick="window.open(this.href, '_blank', 'width=418, height=645'); return false;" style="color : black;"  rel="noopener noreferrer" >
					<div class="chatbot_Tag" id="WebSocket_Chat" style="margin-top: 15px; width: 270px;">
					1:1채팅
					</div>
				</a>
			</div>
			
			<!-- 사용자 말풍선 
			<div class="user_text">
				test
			</div>
			 -->
			
		</div>
	</div>
