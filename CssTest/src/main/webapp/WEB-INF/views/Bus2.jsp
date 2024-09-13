<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%@ include file="/include/header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bus2.css">

<!-- 자바스크립트 -->
 <script src="<%=request.getContextPath() %>/resources/js/jquery-3.7.1.min.js"></script> 

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>




<title>Insert title here</title>

	<style>
		.category {
			font-family: 'Ownglyph_UNZ-Rg';
			margin-top: 95px; 
			font-size: 25px;
		}
		
		.nav-tabs {
			width: 75%;
			margin: auto;
		}
		
		.table {
			width: 75%;
			margin: auto;
		}
		
		.justify-content-center {
			justify-content: center !important;
			margin-top: 3%;
		}
		
		.table_container{
			height: 55vh; 
		}
		
		@font-face {
			font-family: 'Ownglyph_UNZ-Rg';
			src:
				url('https://fastly.jsdelivr.net/gh/projectnoonnu/2406-1@1.0/Ownglyph_UNZ-Rg.woff2')
				format('woff2');
			font-weight: normal;
			font-style: normal;
		}
		
		a {
			text-decoration: none;
		}
	</style>


</head>


			 
<body>
<%@ include file="/include/ChatBot.jsp" %>
<!-- 전체 div -->
<div class="reservation_div">
		
		
								<!---------------------------------- 태그 ---------------------------------->
<!-- 	<div style="margin-bottom : 30px;">
		<div class="Schedule_div">
			운송 스케줄
		</div>
		</div> -->
	
	<div class="reservation_sibling">
	
<!-- 		<div class="search_title">
			승차권 검색
		</div> -->

								<!---------------------------------- 목적지 선택 ---------------------------------->		

	<form id="busForm" action="Test.do" method="post" enctype="multipart/form-data">
		<div class="select_people_div">
			
			<img src="<%=request.getContextPath() %>/resources/img/airport/map.png" class="end_img">
			<img src="<%=request.getContextPath() %>/resources/img/airport/search.png" class="end_search_img">
			<div class="location">From city</div>
			<div class="select_people" id="select_people">
				From city
			</div>
			<input type="hidden" id="hiddenSelectPeople" name="hiddenSelectPeople">
		</div>
		<div class="select_endBox" style="display : none">
			
				<div style="font-size : 16px; margin-bottom : 40px;">From city</div>
				
				<div class="city_container">
					<!-- 나라 -->
					<div style="width: 170px; height: 450px; border-right: 1px solid #d0d0d0; display : inline-block;">
						<diV class="country_tag" id="Southeast_Asia_tag" style="border : 1px solid #4B73E1; background : #f3f6fd;">경기</div>
						<diV class="country_tag" id="Oceania_tag">경기/인천</div>
						<diV class="country_tag" id="japan_tag">강원</div>
						<diV class="country_tag" id="europe_tag">경상</div>
						<diV class="country_tag" id="Americas_tag">전라</div>
<!-- 					<diV class="country_tag" id="Oceania_tag" style="visibility:hidden;">대양주</div>
						<diV class="country_tag" id="Middle_East_tag" style="visibility:hidden;">중동/아프리카</div> -->
					</div>
					
					<!-- 수도권 -->
					<div id="Southeast_Asia_div" style="display : inline-block; width: 570px; margin-left: 198px; position: relative; top: -436px;">
					
						<div class="city_tag" id="citySelect_1">광주(경기)  </div>
						<div class="city_tag" id="citySelect_2">가평 </div>
						<div class="city_tag" id="citySelect_3">남양(경남)</div>
						
						<div class="city_tag" id="citySelect_4">동탄</div>
						<div class="city_tag" id="citySelect_5">부천  </div>
						<div class="city_tag" id="citySelect_6">성남</div>
					
						<div class="city_tag" id="citySelect_7">시흥하늘휴게소</div>
						<div class="city_tag" id="citySelect_8">수원TR(정)</div>
						<div class="city_tag" id="citySelect_9">신갈(용인)</div>
						
						<div class="city_tag" id="citySelect_10">용인</div>
						<div class="city_tag" id="citySelect_11">고양 </div>
						<div class="city_tag" id="citySelect_12">연천</div>
						
						<div class="city_tag" id="citySelect_13">영통</div>
						<div class="city_tag" id="citySelect_14">오산</div>
						<div class="city_tag" id="citySelect_15">안성</div>
						
						
						
					</div>
					
					 <div id="Oceania_div" style="width: 572px;margin-left: 196px;position: relative;top: -439px; display:none;">
						
						<div class="city_tag" id="citySelect_16">의왕</div>
						<div class="city_tag" id="citySelect_17">이천</div>
						<div class="city_tag" id="citySelect_18">청북</div>
						
						<div class="city_tag" id="citySelect_19">시흥하늘휴게소</div>
						<div class="city_tag" id="citySelect_20">평택</div> 
						<div class="city_tag" id="citySelect_77">가천대</div>
						<div class="city_tag" id="citySelect_78">강남대</div>
						<div class="city_tag" id="citySelect_79">공도</div>
						
						<div class="city_tag" id="citySelect_80">광교중앙역</div>
						<div class="city_tag" id="citySelect_81">광릉내</div>
						<div class="city_tag" id="citySelect_82">마두</div>
						
						<div class="city_tag" id="citySelect_83">망포역</div>
						
						<div class="city_tag" id="citySelect_84">명지대</div>
						<div class="city_tag" id="citySelect_85">범계역</div>
						<div class="city_tag" id="citySelect_86">KCC(별내)</div>
						
						<!-- <div class="city_tag" id="citySelect_87">텔아비브</div>
						<div class="city_tag" id="citySelect_88">아디스아바바</div>
						<div class="city_tag" id="citySelect_89">리야드</div>
						
						<div class="city_tag" id="citySelect_90">제다</div> -->
						
					</div>
					
						
					
					<!-- 강원 -->
					<div id="japan_div" style="display : inline-block; width: 570px; margin-left: 198px; position: relative; top: -436px; display:none;">
					
						<div class="city_tag" id="citySelect_21">강릉시외터미널</div>
						<div class="city_tag" id="citySelect_22">춘천</div>
						<div class="city_tag" id="citySelect_23">원주</div>
						
						<div class="city_tag" id="citySelect_24">양양</div>
						<div class="city_tag" id="citySelect_25">속초</div>
						
						<div class="city_tag" id="citySelect_26">평창</div>
					
						<div class="city_tag" id="citySelect_27">삼척</div>
						<div class="city_tag" id="citySelect_28">동해</div>
						<!--<div class="city_tag" id="citySelect_29">기타큐슈</div>
						
						<div class="city_tag" id="citySelect_30">구마모토</div>
						<div class="city_tag" id="citySelect_31">미야자키</div>
						<div class="city_tag" id="citySelect_32">오이타</div>
						
						<div class="city_tag" id="citySelect_33">이바라키</div> -->
						
					</div>
					
					<!-- 충청 -->
					<div id="china_div" style="display : inline-block; width: 570px; margin-left: 198px; position: relative; top: -436px; display:none;">
					
						<div class="city_tag" id="citySelect_34">청주</div>
						<div class="city_tag" id="citySelect_35">천안</div>
						<div class="city_tag" id="citySelect_36">충북혁신도시</div>
						
						<div class="city_tag" id="citySelect_37">충주</div>
						<div class="city_tag" id="citySelect_38">홍성</div>
						<div class="city_tag" id="citySelect_39">유성</div>
						
						<div class="city_tag" id="citySelect_40">증평</div>
						<div class="city_tag" id="citySelect_41">아산(온양)</div>
						<div class="city_tag" id="citySelect_42">서산</div>
						
						<div class="city_tag" id="citySelect_43">논산</div>
						<div class="city_tag" id="citySelect_44">계룡금암</div>
						 <div class="city_tag" id="citySelect_45">대전복합</div> 
	
						
					</div>
					
					<!-- 경상 -->
					<div id="europe_div" style="display : inline-block; width: 570px; margin-left: 198px; position: relative; top: -436px; display:none;">
					
						<div class="city_tag" id="citySelect_48">포항</div>
						<div class="city_tag" id="citySelect_49">통영</div>
						<div class="city_tag" id="citySelect_50">진주개양(공항)</div>
						
						<div class="city_tag" id="citySelect_51">점촌</div>
						<div class="city_tag" id="citySelect_52">예천</div>
						<div class="city_tag" id="citySelect_53">영주</div>
						
						<div class="city_tag" id="citySelect_54">안동</div>
						<div class="city_tag" id="citySelect_55">마산</div>
						<div class="city_tag" id="citySelect_56">김천부곡한남</div>


						<div class="city_tag" id="citySelect_57">구미</div>
						<div class="city_tag" id="citySelect_58">경주시외 </div>
						<div class="city_tag" id="citySelect_59">경북도청(신)</div>

						
						<div class="city_tag" id="citySelect_60">거제(고현)</div>
<!-- 					<div class="city_tag" id="citySelect_61">모스크바</div>
						<div class="city_tag" id="citySelect_62">블라디보스톡</div>
						
						<div class="city_tag">바르샤바</div>-->
						
					</div>
					
					<!-- 전라 -->
					<div id="Americas_div" style="display : inline-block; width: 570px; margin-left: 198px; position: relative; top: -436px; display:none;">
					
						<div class="city_tag" id="citySelect_63">전주</div>
						<div class="city_tag" id="citySelect_64">군산</div>
						<div class="city_tag" id="citySelect_65">김제</div>
						
						<div class="city_tag" id="citySelect_66">대야</div>
						<div class="city_tag" id="citySelect_67">익산</div>
						<div class="city_tag" id="citySelect_68">임실</div>
						
						<div class="city_tag" id="citySelect_69">정읍</div>
						
						<div class="city_tag" id="citySelect_70">전주시외터미널</div>
						<!-- div class="city_tag" id="citySelect_71"></div>
						
						<div class="city_tag" id="citySelect_72">호놀룰루</div>
						<div class="city_tag" id="citySelect_73">디트로이트</div>
						<div class="city_tag" id="citySelect_74">미네아폴리스</div>
						
						<div class="city_tag" id="citySelect_75">밴쿠버</div>
						<div class="city_tag" id="citySelect_76">토론토</div> -->
						
						
					</div>
					
					<!-- 대양주 -->
					<!-- <div id="Oceania_div" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -250px; display:none;">
					
						<div class="city_tag" id="citySelect_77">괌</div>
						<div class="city_tag" id="citySelect_78">사이판</div>
						<div class="city_tag" id="citySelect_79">시드니</div>
						
						<div class="city_tag" id="citySelect_80">멜버른</div>
						<div class="city_tag" id="citySelect_81">브리즈번</div>
						<div class="city_tag" id="citySelect_82">오클랜드</div>
						
						<div class="city_tag" id="citySelect_83">팔라우</div>
						
					</div> -->
					
					<!-- 중동/아프리카 -->
					<!-- <div id="Middle_East_div" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -250px; display:none;">
					
						<div class="city_tag" id="citySelect_84">두바이</div>
						<div class="city_tag" id="citySelect_85">아부다비</div>
						<div class="city_tag" id="citySelect_86">도하</div>
						
						<div class="city_tag" id="citySelect_87">텔아비브</div>
						<div class="city_tag" id="citySelect_88">아디스아바바</div>
						<div class="city_tag" id="citySelect_89">리야드</div>
						
						<div class="city_tag" id="citySelect_90">제다</div>
						
					</div> -->
					
				</div>  <!-- div class="city_container" -->
				
				<div class="select_endBox_close">취소</div>
				
			</div>
		
										<!---------------------------------- 출발지 선택 ---------------------------------->	
		<!-- 출발지 선택 div -->
		<div class="select_startDiv">

			<img src="<%=request.getContextPath() %>/resources/img/airport/map.png" class="start_img">
			<img src="<%=request.getContextPath() %>/resources/img/airport/search.png" class="start_search_img">
			
			<div class="airport">To airport</div>

			<div class="start_result" id="start_result">
				To airport
			</div>
			<input type="hidden" id="hiddenStartResult" name="hiddenStartResult">
		</div>
		<div class="select_startBox" style="display : none">
				<div style="font-size : 16px;">To airport</div>
				
				<div style="margin-top: 3px;">
				
					<div class="start_tag1">
						<div style="margin-top: 10px;">인천</div>
						<div>ICN</div>
					</div>
					<div class="start_tag1-1">
						<div style="margin-top: 10px;">인천공항T1</div>
						<div>ICN</div>
					</div>
					<div class="start_tag1-2">
						<div style="margin-top: 10px;">인천공항T2</div>
						<div>ICN</div>
					</div>
					
					<div class="start_tag2">
						<div style="margin-top: 10px;">김포공항</div>
						<div>GMP</div>
					</div>
					<div class="start_tag3">
						<div style="margin-top: 10px;">김해</div>
						<div>PUS</div>
					</div>
					<div class="start_tag4">
						<div style="margin-top: 10px;">제주</div>
						<div>CJU</div>
					</div>
				
				</div>
				
				<div class="startBox_close">
					취소
				</div>
				
		</div>
		
		
		
								<!---------------------------------- 날짜 선택 ---------------------------------->		
								
								
								
		<div class="select_day_div">
			<img src="<%=request.getContextPath() %>/resources/img/airport/calender.png" class="calender_img">
			<img src="<%=request.getContextPath() %>/resources/img/airport/day.png" class="day_img">
			<div class="date">Date</div>
			<div class="select_day">
					Date
			</div>
		
		</div>
		
		<div class="date_selectBox" style="display : none">

<!-- 달력 -->				
<div class="container">
  <div class="my-calendar clearfix">
    <div class="clicked-date">
      <div class="cal-day"></div>
      <div class="cal-date"></div>
    </div>
    <div class="calendar-box">
      <div class="ctr-box clearfix">
        <button type="button" title="prev" class="btn-cal prev">
        </button>
        <span class="cal-month"></span>
        <span class="cal-year"></span>
        <button type="button" title="next" class="btn-cal next">
        </button>
      </div>
      <table class="cal-table">
        <thead>
          <tr>
            <th>S</th>
            <th>M</th>
            <th>T</th>
            <th>W</th>
            <th>T</th>
            <th>F</th>
            <th>S</th>
          </tr>
        </thead>
        <tbody class="cal-body"></tbody>
      </table>
    </div>
  </div>
</div>
				<div class="date_seleteBox_close">취소</div>
			</div>
		
								<!---------------------------------- 출발시간 선택 ---------------------------------->
								
<%-- 		<div class="select_seat_div">
		
			<img src="<%=request.getContextPath() %>/resources/img/airport/startTime.png" class="startTime_img">
			<div class="select_seat">
				출발시간
			</div>
			
			
		</div>
		<div class="select_startTimeBox" style="display : none">
				<div style="font-size : 16px;">출발시간 선택</div>
				
				<div style="margin-top: 40px;">
				
					<div class="startTime_tag" style="display:none">
							<div style="margin-top: 10px;" id="tagTime0">0</div>
					</div>
					
					<%
					for(int i = 1; i <= 24; i++){
						if(i < 9){
							
					%>
						<div class="startTime_tag">
							<div style="margin-top: 10px;" id="tagTime<%= i %>">0<%= i %> : 00</div>
						</div>
					<%		
						}else{
					%>
						<div class="startTime_tag">
							<div style="margin-top: 10px;" id="tagTime<%= i %>"><%= i %> : 00</div>
						</div>
					<%
					}}
					%>
					
				</div>
				<div class="startTimeBox_close">취소</div>
				
		</div> --%>
			
								<!---------------------------------- 종료 시간 선택 ---------------------------------->			
			
			
<%-- 		<div class="select_seat_div2">
			<img src="<%=request.getContextPath() %>/resources/img/airport/endTime.png" class="endTime_img">		
			<div class="select_endTime">
				종료시간
			</div>
		</div>
		
		<div class="select_endTimeBox" style=" display : none">
				<div style="font-size : 16px;">종료시간 선택</div>
				
				<div style="margin-top: 40px;">
					<div class="endTime_tag" style="display:none">
							<div style="margin-top: 10px;" id="etagTime0">0</div>
					</div>
					<%
					for(int i = 1; i <= 24; i++){
						if(i < 9){
							
					%>
						<div class="endTime_tag">
							<div style="margin-top: 10px;" id="etagTime<%= i %>">0<%= i %> : 00</div>
						</div>
					<%		
						}else{
					%>
						<div class="endTime_tag">
							<div style="margin-top: 10px;" id="etagTime<%= i %>"><%= i %> : 00</div>
						</div>
					<%
					}}
					%>
					
				</div>
				<div class="endTimeBox_close">취소</div>
			</div>
		 --%>
		
								<!---------------------------------- 검색 버튼 ---------------------------------->
										
		<!-- 검색버튼 -->
		<div class="search_div">
			<div class="search_btn" id="search_btn">
				Search
			</div>
		</div>
		</form>	
	</div>
	
</div>

	<!-------------------------------- category 시작---------------------------- -->
  
  
	<div class="category">

      <ul class="nav nav-tabs" id="myTab" role="tablist">
       
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false" onclick="clickTab('고속')">고속버스</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false" onclick="clickTab('시외')">시외버스</button>
        </li>
       
      </ul>
			
   
        
        <!---------------------고속버스 ------------------>
        
       
        <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
	       	<div class="table_container">
	         
	         
			<!-- <div class="main-content">
					  <div class="ticket">
					    <div class="ticket__main">
					    
					      <div class="header"> Express Bus</div>
					      <div class="info passenger">
					        <div class="info__item">Passenger</div>
					        <div class="info__detail">Your School Group</div>
					      </div>
					      <div class="info platform"> <span>Depart </span><span>from </span><span>Your School</span>
					        <div><span>To</span></div>
					        <div><span>Muir Woods</span></div>
					      </div>
					      <div class="info departure">
					        <div class="info__item">Depart</div>
					        <div class="info__detail"></div>
					      </div>
					      <div class="info arrival">
					        <div class="info__item">Arrive</div>
					        <div class="info__detail"></div>
					      </div>
					      <div class="info ddate">
					        <div class="info__item">Date</div>
					        <div class="info__detail">1 Sep 2023</div>
					      </div>
					      <div class="info time">
					        <div class="info__item">Time</div>
					        <div class="info__detail"></div>
					      </div>
					      <div class="info carriage">
					        <div class="info__item">charge</div>
					        <div class="info__detail">40</div>
					      </div>
					      <div class="info seat">
					        <div class="info__item">grade</div>
					        <div class="info__detail">No</div>
					      </div>
					      <div class="fineprint"> 
					        <p>Boarding begins 30 minutes before departure. All food and drink, with an exception for water, are prohibited while onboard.</p>
					        <p>This ticket is Non-refundable • D Harris Tours Transit</p>
					      </div>
					      <div class="snack">
					        <svg viewBox="0 -11 414.00053 414">
					          <path d="m202.480469 352.128906c0-21.796875-17.671875-39.46875-39.46875-39.46875-21.800781 0-39.472657 17.667969-39.472657 39.46875 0 21.800782 17.671876 39.472656 39.472657 39.472656 21.785156-.023437 39.445312-17.683593 39.46875-39.472656zm0 0"></path>
					          <path d="m348.445312 348.242188c2.148438 21.691406-13.695312 41.019531-35.390624 43.167968-21.691407 2.148438-41.015626-13.699218-43.164063-35.390625-2.148437-21.691406 13.695313-41.019531 35.386719-43.167969 21.691406-2.148437 41.019531 13.699219 43.167968 35.390626zm0 0"></path>
					          <path d="m412.699219 63.554688c-1.3125-1.84375-3.433594-2.941407-5.699219-2.941407h-311.386719l-3.914062-24.742187c-3.191407-20.703125-21.050781-35.9531252-42-35.871094h-42.699219c-3.867188 0-7 3.132812-7 7s3.132812 7 7 7h42.699219c14.050781-.054688 26.03125 10.175781 28.171875 24.0625l33.800781 213.515625c3.191406 20.703125 21.050781 35.957031 42 35.871094h208.929687c3.863282 0 7-3.132813 7-7 0-3.863281-3.136718-7-7-7h-208.929687c-14.050781.054687-26.03125-10.175781-28.171875-24.0625l-5.746094-36.300781h213.980469c18.117187-.007813 34.242187-11.484376 40.179687-28.597657l39.699219-114.578125c.742188-2.140625.402344-4.511718-.914062-6.355468zm0 0"></path>
					        </svg>
					      </div>
					      <div class="barcode">
					        <div class="barcode__scan"></div>
					        <div class="barcode__id">001256733</div>
					      </div>
					    </div>
					    <div class="ticket__side">
					      <div class="logo"> 
					        <p>D Harris Tours</p>
					      </div>
					      <div class="info side-arrive">
					        <div class="info__item">Arrive</div>
					        <div class="info__detail">Anywhere</div>
					      </div>
					      <div class="info side-depart">
					        <div class="info__item">Depart</div>
					        <div class="info__detail">The Yard</div>
					      </div>
					      <div class="info side-ddate">
					        <div class="info__item">Date</div>
					        <div class="info__detail">1 Sep 2023</div>
					      </div>
					      <div class="info side-time">
					        <div class="info__item">Time</div>
					        <div class="info__detail">11:00AM</div>
					      </div>
					      <div class="barcode">
					        <div class="barcode__scan"></div>
					        <div class="barcode__id">001256733</div>
					      </div>
					    </div>
					  </div>
			</div>
				          
	         
	          </div> <div class="table_container">
	             </div> -->
	               
	      <!--     <nav aria-label="Page navigation example">
	            <ul class="pagination justify-content-center">
	              <li class="page-item disabled">
	                <a class="page-link">&#60;</a>
	              </li>
	              <li class="page-item"><a class="page-link" href="#">1</a></li>
	              <li class="page-item"><a class="page-link" href="#">2</a></li>
	              <li class="page-item"><a class="page-link" href="#">3</a></li>
	              <li class="page-item">
	                <a class="page-link" href="#">&#62;</a>
	              </li>
	            </ul>
	          </nav> 
	          
	    --> 
	     </div>   
	      </div>  
	        <!---------------------시외버스 ------------------>
	       
		
	         

        </div>
       <!--  <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">...</div> -->
  
      
      <!---------------------시내버스 ------------------>
      

<!--class="category"  -->
<script>
var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
	console.log(popoverTriggerEl)
	return new bootstrap.Popover(popoverTriggerEl,{
		trigger: 'focus'
	})
	
})


var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
	console.log(popoverTriggerEl)
	return new bootstrap.Popover(popoverTriggerEl,{
		trigger: 'focus'
	})
	
})
document.getElementById('select_people').addEventListener('click', function(){
	 document.querySelector('.table_container').innerHTML = '';
});


document.getElementById('search_btn').addEventListener('click', function() {
	
	if (busType == 'null') {
	        alert("타입을 먼저 선택해 주세요");
	 }else if(busType == '고속'){
	   expressFn();
   	 }else{
	   intercityFn();
   	 }
});

function expressFn(){
	 // 'innerText'로 값을 가져오고 공백을 제거합니다.
    var FromCity = document.getElementById('select_people').innerText.trim(); 
    var ToAirport = document.getElementById('start_result').innerText.trim(); 
    var Day = document.getElementById('select_day')
    console.log("FromCity:", FromCity); 
    console.log("ToAirport:", ToAirport); 
    console.log("Day:", Day); 
   
   
    $.ajax({
        url: "express.do",/*"<c:url value='/bus/express.do'/>"*/
        method: "POST", 
        data: {
            city: FromCity,
            airport: ToAirport,
            expressType:busType,
            
        },
        success: function(data) {
            console.log(data.data);
            let element = ""; // 초기화
            
            if(data.result === "success") {
            	
            	    
                	data.data.forEach(function(item) {
               		let names=["천일고속", "경기고속", "천마고속", "전북고속", "금남고속", "금강고속"
        					,"경남고속", "아성고속", "대원고속", "천안고속", "중부고속", "강원고속"
        					,"금호고속", "동양고속", "동부고속", "서울고속", "한일고속",
        					"중앙고속", "영암고속", "삼화고속" ,"삼흥고속"]
                   	const randomIndex = Math.floor(Math.random() * names.length);
               
               	   	let randomName = names[randomIndex];
                		
                    element += '<div class="main-content">';
                    element += '<div class="ticket">';
                    element += '<div class="ticket__main">';
                    element += '<div class="header">Express Bus</div>';
                    element += '<div class="info passenger">';
                    element += '<div class="info__item">Company</div>';
                    element += '<div class="info__detail">'+randomName+'</div>';
                    element += '</div>'; // .info passenger 종료
                    element += '<div class="info platform">';
                    
                    let engDe='null'
                  	if(item.depPlaceNm == '전주'){
                    	engDe ='Jeon Ju'
                    }else if(item.depPlaceNm == '익산'){
                    	
                    		engDe ='Ik San'
                    }else{
                    	item.depPlaceNm
                    }
                    
                    let engAr='null'
                      	if(item.arrPlaceNm == '인천'){
                        	engAr ='InCheon'
                        }else{
                        	item.arrPlaceNm
                        }
                    
                    element += '<span>Depart </span><span>from </span><span>'+engDe+'</span>';
                    element += '<div><span>To</span></div>';
                    element += '<div><span>'+engAr+'</span></div>';
                    element += '</div>'; // .info platform 종료
                    element += '<div class="info departure">';
                    element += '<div class="info__item">Depart</div>';
                    element += '<div class="info__detail">' + item.depPlaceNm + '</div>';
                    element += '</div>'; // .info departure 종료
                    element += '<div class="info arrival">';
                    element += '<div class="info__item">Arrive</div>';
                    element += '<div class="info__detail">' + item.arrPlaceNm + '</div>';
                    element += '</div>'; // .info arrival 종료
                    element += '<div class="info ddate">';
                    element += '<div class="info__item">Date</div>';
                    
                    let today = new Date();
                    
                    let month = today.getMonth()+1+"";
                    if(month.length == 1){
                    	month = "0"+month;
                    }
                    
					let day = today.getDate()+"";
                    if(day.length < 2){
                    	day = "0"+day;
                    }
                    let format = today.getFullYear()+"-"+month+"-"+day;
                    
                    
                    element += '<div class="info__detail">'+format+'</div>';
                    element += '</div>'; // .info ddate 종료
                    element += '<div class="info time">';
                    
                    
                  
                    let time=item.depPlandTime;
                   	let hours=time.substring(8,12);
                   	let min=hours.substring(0,2)+":"+hours.substring(2,4);
                    
                    
                    
                    
                    element += '<div class="info__item">Time</div>';
                    element += '<div class="info__detail">' +min + '</div>';
                    element += '</div>'; // .info time 종료
                    element += '<div class="info carriage">';
                    element += '<div class="info__item">Charge</div>';
                    element += '<div class="info__detail">' + item.charge + '</div>';
                    element += '</div>'; // .info carriage 종료
                    element += '<div class="info seat">';
                    element += '<div class="info__item">Grade</div>';
                    element += '<div class="info__detail">' + item.gradeNm + '</div>';
                    element += '</div>'; // .info seat 종료
                    element += '<div class="fineprint">';
                    element += '<p>Boarding begins 30 minutes before departure. All food and drink, with an exception for water, are prohibited while onboard.</p>';
                    element += '<p>This ticket is Non-refundable • D Harris Tours Transit</p>';
                    element += '</div>'; // .fineprint 종료
                    element += '<div class="snack">';
                    element += '<svg viewBox="0 -11 414.00053 414.00053">';
                    element += '<path d="m202.480469 352.128906c0-21.796875-17.671875-39.46875-39.46875-39.46875-21.800781 0-39.472657 17.667969-39.472657 39.46875 0 21.800782 17.671876 39.472656 39.472657 39.472656 21.785156-.023437 39.445312-17.683593 39.46875-39.472656zm0 0"></path>';
                    element += '<path d="m348.445312 348.242188c2.148438 21.691406-13.695312 41.019531-35.390624 43.167968-21.691407 2.148438-41.015626-13.699218-43.164063-35.390625-2.148437-21.691406 13.695313-41.019531 35.386719-43.167969 21.691406-2.148437 41.019531 13.699219 43.167968 35.390626zm0 0"></path>';
                    element += '<path d="m412.699219 63.554688c-1.3125-1.84375-3.433594-2.941407-5.699219-2.941407h-311.386719l-3.914062-24.742187c-3.191407-20.703125-21.050781-35.9531252-42-35.871094h-42.699219c-3.867188 0-7 3.132812-7 7s3.132812 7 7 7h42.699219c14.050781-.054688 26.03125 10.175781 28.171875 24.0625l33.800781 213.515625c3.191406 20.703125 21.050781 35.957031 42 35.871094h208.929687c3.863282 0 7-3.132813 7-7 0-3.863281-3.136718-7-7-7h-208.929687c-14.050781.054687-26.03125-10.175781-28.171875-24.0625l-5.746094-36.300781h213.980469c18.117187-.007813 34.242187-11.484376 40.179687-28.597657l39.699219-114.578125c.742188-2.140625.402344-4.511718-.914062-6.355468zm0 0"></path>';
                    element += '</svg>';
                    element += '</div>'; // .snack 종료
                    
                    let randomFourDigitNumber = Math.random().toString().slice(2, 11);
                    	
                    
                    element += '<div class="barcode">';
                    element += '<div class="barcode__scan"></div>';
                    element += '<div class="barcode__id">'+randomFourDigitNumber+'</div>';
                    element += '</div>'; // .barcode 종료
                    element += '</div>'; // .ticket__main 종료
                    element += '<div class="ticket__side">';
                    element += '<div class="logo">';
                    element += '<p>D Harris Tours</p>';
                    element += '</div>'; // .logo 종료
                    element += '<div class="info side-arrive">';
                    element += '<div class="info__item">Arrive</div>';
                    element += '<div class="info__detail">'+engAr+'</div>';
                    element += '</div>'; // .info side-arrive 종료
                    element += '<div class="info side-depart">';
                    element += '<div class="info__item">Depart</div>';
                    element += '<div class="info__detail">'+engDe+'</div>';
                    element += '</div>'; // .info side-depart 종료
                    element += '<div class="info side-ddate">';
                    element += '<div class="info__item">Date</div>';
                    element += '<div class="info__detail">'+format+'</div>';
                    element += '</div>'; // .info side-ddate 종료
                    element += '<div class="info side-time">';
                    element += '<div class="info__item">Time</div>';
                    element += '<div class="info__detail">' + min + '</div>';
                    element += '</div>'; // .info side-time 종료
                    element += '<div class="barcode">';
                    element += '<div class="barcode__scan"></div>';
                    element += '<div class="barcode__id">'+randomFourDigitNumber+'</div>';
                    element += '</div>'; // .barcode 종료
                    element += '</div>'; // .ticket__side 종료
                    element += '</div>'; // .ticket 종료
                    element += '</div>'; // .main-content 종료
                });

                // 최종적으로 element를 원하는 곳에 삽입합니다.
                document.querySelector('.table_container').innerHTML = element;

                console.log("성공");
            } else {
            	
            	element += '<div class="main-content">';
                element += '<div class="ticket">';
                element += '<div class="ticket__main">';
                element += '<div class="header">Express Bus</div>';
                element += '<div class="info passenger">';
                element += '<div class="info__item">Passenger</div>';
                element += '<div class="info__detail">No More Service</div>';
                element += '</div>'; // .info passenger 종료
                element += '<div class="info platform">';
                element += '<span>No More Service </span>';
               
               
                element += '</div>'; // .info platform 종료
                element += '<div class="info departure">';
                element += '<div class="info__item">Depart</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info departure 종료
                element += '<div class="info arrival">';
                element += '<div class="info__item">Arrive</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info arrival 종료
                element += '<div class="info ddate">';
                element += '<div class="info__item">Date</div>';
                
                element += '<div class="info__item">Time</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info time 종료
                element += '<div class="info carriage">';
                element += '<div class="info__item">Charge</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info carriage 종료
                element += '<div class="info seat">';
                element += '<div class="info__item">Grade</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info seat 종료
                element += '<div class="fineprint">';
                element += '<p>Boarding begins 30 minutes before departure. All food and drink, with an exception for water, are prohibited while onboard.</p>';
                element += '<p>This ticket is Non-refundable • D Harris Tours Transit</p>';
                element += '</div>'; // .fineprint 종료
                element += '<div class="snack">';
                element += '<svg viewBox="0 -11 414.00053 414.00053">';
                element += '<path d="m202.480469 352.128906c0-21.796875-17.671875-39.46875-39.46875-39.46875-21.800781 0-39.472657 17.667969-39.472657 39.46875 0 21.800782 17.671876 39.472656 39.472657 39.472656 21.785156-.023437 39.445312-17.683593 39.46875-39.472656zm0 0"></path>';
                element += '<path d="m348.445312 348.242188c2.148438 21.691406-13.695312 41.019531-35.390624 43.167968-21.691407 2.148438-41.015626-13.699218-43.164063-35.390625-2.148437-21.691406 13.695313-41.019531 35.386719-43.167969 21.691406-2.148437 41.019531 13.699219 43.167968 35.390626zm0 0"></path>';
                element += '<path d="m412.699219 63.554688c-1.3125-1.84375-3.433594-2.941407-5.699219-2.941407h-311.386719l-3.914062-24.742187c-3.191407-20.703125-21.050781-35.9531252-42-35.871094h-42.699219c-3.867188 0-7 3.132812-7 7s3.132812 7 7 7h42.699219c14.050781-.054688 26.03125 10.175781 28.171875 24.0625l33.800781 213.515625c3.191406 20.703125 21.050781 35.957031 42 35.871094h208.929687c3.863282 0 7-3.132813 7-7 0-3.863281-3.136718-7-7-7h-208.929687c-14.050781.054687-26.03125-10.175781-28.171875-24.0625l-5.746094-36.300781h213.980469c18.117187-.007813 34.242187-11.484376 40.179687-28.597657l39.699219-114.578125c.742188-2.140625.402344-4.511718-.914062-6.355468zm0 0"></path>';
                element += '</svg>';
                element += '</div>'; // .snack 종료
         
                element += '<div class="barcode">';
                element += '<div class="barcode__scan"></div>';
                element += '<div class="barcode__id"></div>';
                element += '</div>'; // .barcode 종료
                element += '</div>'; // .ticket__main 종료
                element += '<div class="ticket__side">';
                element += '<div class="logo">';
                element += '<p>D Harris Tours</p>';
                element += '</div>'; // .logo 종료
                element += '<div class="info side-arrive">';
                element += '<div class="info__item">Arrive</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info side-arrive 종료
                element += '<div class="info side-depart">';
                element += '<div class="info__item">Depart</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info side-depart 종료
                element += '<div class="info side-ddate">';
                element += '<div class="info__item">Date</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info side-ddate 종료
                element += '<div class="info side-time">';
                element += '<div class="info__item">Time</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info side-time 종료
                element += '<div class="barcode">';
                element += '<div class="barcode__scan"></div>';
                element += '<div class="barcode__id">001256733</div>';
                element += '</div>'; // .barcode 종료
                element += '</div>'; // .ticket__side 종료
                element += '</div>'; // .ticket 종료
                element += '</div>'; // .main-content 종료
               console.log( document.querySelector('.table_container'));
                document.querySelector('.table_container').innerHTML = element;
                $(".fade").addClass("show");
               
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("AJAX 오류 발생:", textStatus, errorThrown);
            console.error("응답 내용:", jqXHR.responseText);
        }
    });
}

function intercityFn(){
	 // 'innerText'로 값을 가져오고 공백을 제거합니다.
    var FromCity = document.getElementById('select_people').innerText.trim(); 
    var ToAirport = document.getElementById('start_result').innerText.trim(); 

    console.log("FromCity:", FromCity); 
    console.log("ToAirport:", ToAirport); 
    
   
   
    $.ajax({
        url: "intercity.do",/*"<c:url value='/bus/express.do'/>"*/
        method: "POST", 
        data: {
            city: FromCity,
            airport: ToAirport,
            expressType:busType
        },
        success: function(data) {
            console.log(data.data);
            let element = ""; // 초기화
            if(data.result === "success") {
 				data.data.forEach(function(item) {
 					let names=["천일고속", "경기고속", "천마고속", "전북고속", "금남고속", "금강고속"
    					,"경남고속", "아성고속", "대원고속", "천안고속", "중부고속", "강원고속"
    					,"금호고속", "동양고속", "동부고속", "서울고속", "한일고속",
    					"중앙고속", "영암고속", "삼화고속" ,"삼흥고속"]
               		const randomIndex = Math.floor(Math.random() * names.length);
           	   		let randomName = names[randomIndex];
           	   		
                    element += '<div class="main-content">';
                    element += '<div class="ticket">';
                    element += '<div class="ticket__main">';
                    element += '<div class="header">Intercity Bus</div>';
                    element += '<div class="info passenger">';
                    element += '<div class="info__item">Company</div>';
                    element += '<div class="info__detail">'+randomName+' </div>';
                    element += '</div>'; // .info passenger 종료
                    element += '<div class="info platform">';
                    element += '<span>Depart </span><span>from </span><span>Your School</span>';
                    element += '<div><span>To</span></div>';
                    element += '<div><span>Muir Woods</span></div>';
                    element += '</div>'; // .info platform 종료
                    element += '<div class="info departure">';
                    element += '<div class="info__item">Depart</div>';
                    element += '<div class="info__detail">' + item.depPlaceNm + '</div>';
                    element += '</div>'; // .info departure 종료
                    element += '<div class="info arrival">';
                    element += '<div class="info__item">Arrive</div>';
                    element += '<div class="info__detail">' + item.arrPlaceNm + '</div>';
                    element += '</div>'; // .info arrival 종료
                    element += '<div class="info ddate">';
                    element += '<div class="info__item">Date</div>';
                    
                    let today = new Date();
                    
                    let month = today.getMonth()+1+"";
                    if(month.length == 1){
                    	month = "0"+month;
                    }
                    
					let day = today.getDate()+"";
                    if(day.length < 2){
                    	day = "0"+day;
                    }
                    
                    let format = today.getFullYear()+"-"+month+"-"+day;
                    
                    
                    element += '<div class="info__detail">'+format+'</div>';
                    element += '</div>'; // .info ddate 종료
                    element += '<div class="info time">';
                    
                    
                  
                    let time=item.depPlandTime;
                   	let hours=time.substring(8,12);
                   	let min=hours.substring(0,2)+":"+hours.substring(2,4);
                    
                    element += '<div class="info__item">Time</div>';
                    element += '<div class="info__detail">' +min + '</div>';
                    element += '</div>'; // .info time 종료
                    element += '<div class="info carriage">';
                    element += '<div class="info__item">Charge</div>';
                    element += '<div class="info__detail">' + item.charge + '</div>';
                    element += '</div>'; // .info carriage 종료
                    element += '<div class="info seat">';
                    element += '<div class="info__item">Grade</div>';
                    element += '<div class="info__detail">' + item.gradeNm + '</div>';
                    element += '</div>'; // .info seat 종료
                    element += '<div class="fineprint">';
                    element += '<p>Boarding begins 30 minutes before departure. All food and drink, with an exception for water, are prohibited while onboard.</p>';
                    element += '<p>This ticket is Non-refundable • D Harris Tours Transit</p>';
                    element += '</div>'; // .fineprint 종료
                    element += '<div class="snack">';
                    element += '<svg viewBox="0 -11 414.00053 414.00053">';
                    element += '<path d="m202.480469 352.128906c0-21.796875-17.671875-39.46875-39.46875-39.46875-21.800781 0-39.472657 17.667969-39.472657 39.46875 0 21.800782 17.671876 39.472656 39.472657 39.472656 21.785156-.023437 39.445312-17.683593 39.46875-39.472656zm0 0"></path>';
                    element += '<path d="m348.445312 348.242188c2.148438 21.691406-13.695312 41.019531-35.390624 43.167968-21.691407 2.148438-41.015626-13.699218-43.164063-35.390625-2.148437-21.691406 13.695313-41.019531 35.386719-43.167969 21.691406-2.148437 41.019531 13.699219 43.167968 35.390626zm0 0"></path>';
                    element += '<path d="m412.699219 63.554688c-1.3125-1.84375-3.433594-2.941407-5.699219-2.941407h-311.386719l-3.914062-24.742187c-3.191407-20.703125-21.050781-35.9531252-42-35.871094h-42.699219c-3.867188 0-7 3.132812-7 7s3.132812 7 7 7h42.699219c14.050781-.054688 26.03125 10.175781 28.171875 24.0625l33.800781 213.515625c3.191406 20.703125 21.050781 35.957031 42 35.871094h208.929687c3.863282 0 7-3.132813 7-7 0-3.863281-3.136718-7-7-7h-208.929687c-14.050781.054687-26.03125-10.175781-28.171875-24.0625l-5.746094-36.300781h213.980469c18.117187-.007813 34.242187-11.484376 40.179687-28.597657l39.699219-114.578125c.742188-2.140625.402344-4.511718-.914062-6.355468zm0 0"></path>';
                    element += '</svg>';
                    element += '</div>'; // .snack 종료
                    
                    let randomFourDigitNumber = Math.random().toString().slice(2, 11);
                    
                    
                    
                    element += '<div class="barcode">';
                    element += '<div class="barcode__scan"></div>';
                    element += '<div class="barcode__id">'+randomFourDigitNumber+'</div>';
                    element += '</div>'; // .barcode 종료
                    element += '</div>'; // .ticket__main 종료
                    element += '<div class="ticket__side">';
                    element += '<div class="logo">';
                    element += '<p>D Harris Tours</p>';
                    element += '</div>'; // .logo 종료
                    element += '<div class="info side-arrive">';
                    element += '<div class="info__item">Arrive</div>';
                    element += '<div class="info__detail">'+item.arrPlaceNm+'</div>';
                    element += '</div>'; // .info side-arrive 종료
                    element += '<div class="info side-depart">';
                    element += '<div class="info__item">Depart</div>';
                    element += '<div class="info__detail">'+item.depPlaceNm+'</div>';
                    element += '</div>'; // .info side-depart 종료
                    element += '<div class="info side-ddate">';
                    element += '<div class="info__item">Date</div>';
                    element += '<div class="info__detail">'+format+'</div>';
                    element += '</div>'; // .info side-ddate 종료
                    element += '<div class="info side-time">';
                    element += '<div class="info__item">Time</div>';
                    element += '<div class="info__detail">' + min + '</div>';
                    element += '</div>'; // .info side-time 종료
                    element += '<div class="barcode">';
                    element += '<div class="barcode__scan"></div>';
                    element += '<div class="barcode__id">'+randomFourDigitNumber+'</div>';
                    element += '</div>'; // .barcode 종료
                    element += '</div>'; // .ticket__side 종료
                    element += '</div>'; // .ticket 종료
                    element += '</div>'; // .main-content 종료
                });

                // 최종적으로 element를 원하는 곳에 삽입합니다.
                document.querySelector('.table_container').innerHTML = element;

                console.log("성공");
            } else {
            	element += '<div class="main-content">';
                element += '<div class="ticket">';
                element += '<div class="ticket__main">';
                element += '<div class="header">Intercity Bus</div>';
                element += '<div class="info passenger">';
                element += '<div class="info__item">Service</div>';
                element += '<div class="info__detail">No More Service</div>';
                element += '</div>'; // .info passenger 종료
                element += '<div class="info platform">';
                element += '<span>No More Service </span>';
               
                element += '</div>'; // .info platform 종료
                element += '<div class="info departure">';
                element += '<div class="info__item">Depart</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info departure 종료
                element += '<div class="info arrival">';
                element += '<div class="info__item">Arrive</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info arrival 종료
                element += '<div class="info ddate">';
                element += '<div class="info__item">Date</div>';
                
                
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info ddate 종료
                element += '<div class="info time">';
                
                
                element += '<div class="info__item">Time</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info time 종료
                element += '<div class="info carriage">';
                element += '<div class="info__item">Charge</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info carriage 종료
                element += '<div class="info seat">';
                element += '<div class="info__item">Grade</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info seat 종료
                element += '<div class="fineprint">';
                element += '<p>Boarding begins 30 minutes before departure. All food and drink, with an exception for water, are prohibited while onboard.</p>';
                element += '<p>This ticket is Non-refundable • D Harris Tours Transit</p>';
                element += '</div>'; // .fineprint 종료
                element += '<div class="snack">';
                element += '<svg viewBox="0 -11 414.00053 414.00053">';
                element += '<path d="m202.480469 352.128906c0-21.796875-17.671875-39.46875-39.46875-39.46875-21.800781 0-39.472657 17.667969-39.472657 39.46875 0 21.800782 17.671876 39.472656 39.472657 39.472656 21.785156-.023437 39.445312-17.683593 39.46875-39.472656zm0 0"></path>';
                element += '<path d="m348.445312 348.242188c2.148438 21.691406-13.695312 41.019531-35.390624 43.167968-21.691407 2.148438-41.015626-13.699218-43.164063-35.390625-2.148437-21.691406 13.695313-41.019531 35.386719-43.167969 21.691406-2.148437 41.019531 13.699219 43.167968 35.390626zm0 0"></path>';
                element += '<path d="m412.699219 63.554688c-1.3125-1.84375-3.433594-2.941407-5.699219-2.941407h-311.386719l-3.914062-24.742187c-3.191407-20.703125-21.050781-35.9531252-42-35.871094h-42.699219c-3.867188 0-7 3.132812-7 7s3.132812 7 7 7h42.699219c14.050781-.054688 26.03125 10.175781 28.171875 24.0625l33.800781 213.515625c3.191406 20.703125 21.050781 35.957031 42 35.871094h208.929687c3.863282 0 7-3.132813 7-7 0-3.863281-3.136718-7-7-7h-208.929687c-14.050781.054687-26.03125-10.175781-28.171875-24.0625l-5.746094-36.300781h213.980469c18.117187-.007813 34.242187-11.484376 40.179687-28.597657l39.699219-114.578125c.742188-2.140625.402344-4.511718-.914062-6.355468zm0 0"></path>';
                element += '</svg>';
                element += '</div>'; // .snack 종료
                element += '<div class="barcode">';
                element += '<div class="barcode__scan"></div>';
                element += '<div class="barcode__id">001256733</div>';
                element += '</div>'; // .barcode 종료
                element += '</div>'; // .ticket__main 종료
                element += '<div class="ticket__side">';
                element += '<div class="logo">';
                element += '<p>D Harris Tours</p>';
                element += '</div>'; // .logo 종료
                element += '<div class="info side-arrive">';
                element += '<div class="info__item">Arrive</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info side-arrive 종료
                element += '<div class="info side-depart">';
                element += '<div class="info__item">Depart</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info side-depart 종료
                element += '<div class="info side-ddate">';
                element += '<div class="info__item">Date</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info side-ddate 종료
                element += '<div class="info side-time">';
                element += '<div class="info__item">Time</div>';
                element += '<div class="info__detail"></div>';
                element += '</div>'; // .info side-time 종료
                element += '<div class="barcode">';
                element += '<div class="barcode__scan"></div>';
                element += '<div class="barcode__id">001256733</div>';
                element += '</div>'; // .barcode 종료
                element += '</div>'; // .ticket__side 종료
                element += '</div>'; // .ticket 종료
                element += '</div>'; // .main-content 종료
                console.log( document.querySelector('.table_container'));
                document.querySelector('.table_container').innerHTML = element;
                $(".fade").addClass("show");
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("AJAX 오류 발생:", textStatus, errorThrown);
            console.error("응답 내용:", jqXHR.responseText);
        }
    });
}






	$(function(){
		
		/* 태그 선택 */  
		$(".Schedule_div").on("click",function(){
			$(".Schedule_div").css("color","#009c75");
			$(".Real_Time_div").css("color","black");
		});
		

	
	
		/* 출발지 선택 */
		$(".select_startDiv").on("click",function(){
			$(".select_startBox").css("display","block");
			$(".select_startTimeBox").css("display","none");
			$(".select_endTimeBox").css("display","none");
			$(".date_selectBox").css("display","none");
			$(".select_endBox").css("display","none");
			
			$(".start_tag1").on("click",function(){
					$(".start_result").text("인천");
					$(".select_startBox").css("display","none");
			});
			
			$(".start_tag1-1").on("click",function(){
				$(".start_result").text("인천공항T1");
				$(".select_startBox").css("display","none");
			});
			
			$(".start_tag1-2").on("click",function(){
				$(".start_result").text("인천공항T2");
				$(".select_startBox").css("display","none");
			});
			
			$(".start_tag2").on("click",function(){
					$(".start_result").text("김포공항");
					$(".select_startBox").css("display","none");
			});
			
			$(".start_tag3").on("click",function(){
					$(".start_result").text("김해");
					$(".select_startBox").css("display","none");
			});
			
			$(".start_tag4").on("click",function(){
					$(".start_result").text("제주");
					$(".select_startBox").css("display","none");
			});
			
			$(".startBox_close").on("click", function(){
				$(".select_startBox").css("display","none");
			});
			
		});
	
	
		
	
		
		/* 출발시간 선택 */
		/* $(".select_seat_div").on("click",function(){
			$(".select_startTimeBox").css("display","block");
			$(".select_endTimeBox").css("display","none");
			$(".select_startBox").css("display","none");
			$(".date_selectBox").css("display","none");
			$(".select_endBox").css("display","none");
			
			$(".startTime_tag").on("click",function(){
			
				let startTime_tag = document.querySelectorAll('.startTime_tag');
				
				for (let i = 1; i <= startTime_tag.length; i++) {
					let tagTime = document.querySelector('#tagTime'+ i);
		        	startTime_tag[i].addEventListener("click", () => {
		        		$(".select_seat").text(i + ":00");
		        		$(".select_startTimeBox").css("display","none");
		        	});
		        };

			});
			
			$(".startTimeBox_close").on("click",function(){
				$(".select_startTimeBox").css("display","none");
			});
			
			
		}); */
		
		
	
		
	
	
		/* 종료시간 선택 */
		/* $(".select_seat_div2").on("click",function(){
			$(".select_endTimeBox").css("display","block");
			$(".select_startBox").css("display","none");
			$(".select_startTimeBox").css("display","none");
			$(".date_selectBox").css("display","none");
			$(".select_endBox").css("display","none");
			
			$(".endTime_tag").on("click",function(){
				
				let endTime_tag = document.querySelectorAll('.endTime_tag');
				
				for (let i = 1; i <= endTime_tag.length; i++) {
					let etagTime = document.querySelector('#etagTime'+ i);
					endTime_tag[i].addEventListener("click", () => {
		        		$(".select_endTime").text(i + ":00");
		        		$(".select_endTimeBox").css("display","none");
		        	});
		        };
			
			});
			
			$(".endTimeBox_close").on("click",function(){
					$(".select_endTimeBox").css("display","none");
			});
			
		}); */
		
		
		/* 날짜 선택 */
		$(".select_day_div").on("click",function(){
			$(".date_selectBox").css("display","block");
			$(".select_startBox").css("display","none");
			$(".select_startTimeBox").css("display","none");
			$(".select_endTimeBox").css("display","none");
			$(".select_endBox").css("display","none");
		});
		
		$(".date_seleteBox_close").on("click",function(){
			$(".date_selectBox").css("display","none");
		})
		
		/* 달력 */
			const init = {
				  monList: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				  dayList: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
				  today: new Date(),
				  monForChange: new Date().getMonth(),
				  //monForChange: 현재 월을 나타내는 정수입니다. Date 객체의 getMonth() 메서드를 사용하여 현재 월을 가져옵니다.
				  activeDate: new Date(),
				  //activeDate: 현재 활성화된 날짜를 나타내는 Date 객체입니다.
				  getFirstDay: (yy, mm) => new Date(yy, mm, 1),
				  //getFirstDay: 주어진 연도(yy)와 월(mm)의 첫째 날을 나타내는 Date 객체를 반환하는 화살표 함수입니다.
				  getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
				  //getLastDay: 주어진 연도(yy)와 월(mm)의 마지막 날을 나타내는 Date 객체를 반환하는 화살표 함수입니다. mm + 1을 사용하여 다음 월을 가져온 후, 0일을 설정하여 현재 월의 마지막 날을 얻습니다.
				  nextMonth: function () {
				    let d = new Date();
				    d.setDate(1);
				    d.setMonth(++this.monForChange);
				    this.activeDate = d;
				    return d;
				  },
				  //nextMonth: 다음 월로 이동하는 메서드입니다. 현재 날짜 객체를 생성하고, 그 날짜의 일을 1로 설정한 후, 월 을 증가시키고 activeDate를 업데이트합니다. 업데이트된 날짜를 반환합니다.
				  prevMonth: function () {
				    let d = new Date();
				    d.setDate(1);
				    d.setMonth(--this.monForChange);
				    this.activeDate = d;
				    return d;
				  },
				  //prevMonth: 이전 월로 이동하는 메서드입니다. nextMonth와 유사하게 작동하지만,월 을 감소시킵니다.
				  addZero: (num) => (num < 10) ? '0' + num : num,
				  //addZero: 주어진 숫자(num)가 10보다 작으면 앞에 0을 추가하여 두 자릿수 문자열로 반환합니다. 그렇지 않으면 숫자를 그대로 반환합니다.
				  activeDTag: null,
				  getIndex: function (node) {
				    let index = 0;
				    while (node = node.previousElementSibling) {
				      index++;
				    }
				    return index;
				  }//getIndex: 주어진 HTML 요소(node)의 형제 요소 중에서 몇 번째인지 인덱스를 계산하는 메서드입니다. 이전 형제 요소를 순회하며 인덱스를 증가시키고 최종 인덱스를 반환합니다.
				};
				
				const $calBody = document.querySelector('.cal-body');
			    //document.querySelector를 사용하여 클래스가 cal-body인 첫 번째 요소를 선택하고, 이를 $calBody 상수에 저장합니다. 이 요소는 달력의 본문을 나타냅니다
				const $btnNext = document.querySelector('.btn-cal.next');
				//클래스가 btn-cal next인 첫 번째 요소를 선택하고, 이를 $btnNext 상수에 저장합니다. 이 요소는 달력을 다음 달로 이동시키는 버튼을 나타냅니다.
				const $btnPrev = document.querySelector('.btn-cal.prev');
				//클래스가 btn-cal prev인 첫 번째 요소를 선택하고, 이를 $btnPrev 상수에 저장합니다. 이 요소는 달력을 이전 달로 이동시키는 버튼을 나타냅니다.
				/**
				 * @param {number} date
				 * @param {number} dayIn
				*/
				function loadDate (date, dayIn) {
				  document.querySelector('.cal-date').textContent = date;
				  document.querySelector('.cal-day').textContent = init.dayList[dayIn];
				}

				/**
				 * @param {date} fullDate
				 */
				 function loadYYMM(fullDate) {
					  let yy = fullDate.getFullYear();
					  let mm = fullDate.getMonth();
					  let firstDay = init.getFirstDay(yy, mm);
					  let lastDay = init.getLastDay(yy, mm);
					  let markToday;  // for marking today date
					  let todayDate = new Date();  // 현재 날짜 객체
					  todayDate.setHours(0, 0, 0, 0); 
					  if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
					    markToday = init.today.getDate();
					  }

					  document.querySelector('.cal-month').textContent = init.monList[mm];
					  document.querySelector('.cal-year').textContent = yy;

					  let trtd = '';
					  let startCount=0;
					  let countDay = 0;
					  for (let i = 0; i < 6; i++) {
					    trtd += '<tr>';
					    for (let j = 0; j < 7; j++) {
					      if (i === 0 && !startCount && j === firstDay.getDay()) {
					        startCount = 1;
					      }
					      if (!startCount) {
					        trtd += '<td>';
					      } else {
					        let currentDate = new Date(yy, mm, countDay + 1);
					        let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
					        trtd += '<td class="day';
					        if (currentDate < todayDate || currentDate > todayDate) {
					            trtd += ' disabled"';  // 현재 날짜 이전 이후 비활성화
					          } else {
					            trtd += (markToday && markToday === countDay + 1) ? ' today"' : '"';
					          }
					          trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
					        }
					        trtd += (startCount) ? ++countDay : '';
					        if (countDay === lastDay.getDate()) { 
					          startCount = 0; 
					        }
					        trtd += '</td>';
					      }
					      trtd += '</tr>';
					    }
					    $calBody.innerHTML = trtd;
					  }

				/**
				 * @param {string} val
				 */
					function createNewList (val) {
					  let id = new Date().getTime() + '';
					  let yy = init.activeDate.getFullYear();
					  let mm = init.activeDate.getMonth() + 1;
					  let dd = init.activeDate.getDate();
					  const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);
		
					  let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);
		
					  let eventData = {};
					  eventData['date'] = date;
					  eventData['memo'] = val;
					  eventData['complete'] = false;
					  eventData['id'] = id;
					  init.event.push(eventData);
					  $todoList.appendChild(createLi(id, val, date));
					}
		
					loadYYMM(init.today);
					loadDate(init.today.getDate(), init.today.getDay());
		
					$btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
					$btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));
		
					$calBody.addEventListener('click', (e) => {
					  if (e.target.classList.contains('day') && !e.target.classList.contains('disabled')){
					    if (init.activeDTag) {
					      init.activeDTag.classList.remove('day-active');
					    }
					    let day = Number(e.target.textContent);
					    loadDate(day, e.target.cellIndex);
					    e.target.classList.add('day-active');
					    init.activeDTag = e.target;
					    init.activeDate.setDate(day);
					    
		
					    let selectedMonth = $(".cal-month").text();
					    let selectedDay = $(".day-active").text();
					 	$(".select_day").text( selectedMonth + selectedDay + "일" );
					 	$(".date_selectBox").css("display","none");
					 	
					  }
					});
				
		
		
		
		
	
	
	/* 목적지 선택 */
	$(".select_people_div").on("click",function(){
		$(".select_endBox").css("display","block");
		$(".date_selectBox").css("display","none");
		$(".select_startBox").css("display","none");
		$(".select_startTimeBox").css("display","none");
		$(".select_endTimeBox").css("display","none");
		
	$(".select_endBox_close").on("click",function(){
		$(".select_endBox").css("display","none");
	})
	
	/* 동남아 태그 */
	$("#Southeast_Asia_tag").on("click",function(){
		$("#Southeast_Asia_tag").css("border","1px solid #4B73E1");
		$("#Southeast_Asia_tag").css("background","#f3f6fd");
		$("#Southeast_Asia_div").css("display","inline-block");
		
		$("#Middle_East_tag").css("border","0px");
		$("#Middle_East_tag").css("background","white");
		$("#Oceania_tag").css("border","0px");
		$("#Oceania_tag").css("background","white");
		$("#Americas_tag").css("border","0px");
		$("#Americas_tag").css("background","white");
		$("#europe_tag").css("border","0px");
		$("#europe_tag").css("background","white");
		$("#china_tag").css("border","0px");
		$("#china_tag").css("background","white");
		$("#japan_tag").css("border","0px");
		$("#japan_tag").css("background","white");
		$("#japan_div").css("display","none");
		$("#china_div").css("display","none");
		$("#europe_div").css("display","none");
		$("#Americas_div").css("display","none");
		$("#Oceania_div").css("display","none");
		$("#Middle_East_div").css("display","none");
		
	});
	   
	/* 일본태그 */
	$("#japan_tag").on("click",function(){
		$("#japan_tag").css("border","1px solid #4B73E1");
		$("#japan_tag").css("background","#f3f6fd");
		$("#japan_div").css("display","inline-block");
		
		$("#Middle_East_tag").css("border","0px");
		$("#Middle_East_tag").css("background","white");
		$("#Oceania_tag").css("border","0px");
		$("#Oceania_tag").css("background","white");
		$("#Americas_tag").css("border","0px");
		$("#Americas_tag").css("background","white");
		$("#europe_tag").css("border","0px");
		$("#europe_tag").css("background","white");
		$("#china_tag").css("border","0px");
		$("#china_tag").css("background","white");
		$("#Southeast_Asia_tag").css("border","0px");
		$("#Southeast_Asia_tag").css("background","white");
		$("#Southeast_Asia_div").css("display","none");
		$("#china_div").css("display","none");
		$("#europe_div").css("display","none");
		$("#Americas_div").css("display","none");
		$("#Oceania_div").css("display","none");
		$("#Middle_East_div").css("display","none");
	});
	
	/* 중국태그 */
	$("#china_tag").on("click",function(){
		$("#china_tag").css("border","1px solid #4B73E1");
		$("#china_tag").css("background","#f3f6fd");
		$("#china_div").css("display","inline-block");
		
		$("#Middle_East_tag").css("border","0px");
		$("#Middle_East_tag").css("background","white");
		$("#Oceania_tag").css("border","0px");
		$("#Oceania_tag").css("background","white");
		$("#Americas_tag").css("border","0px");
		$("#Americas_tag").css("background","white");
		$("#europe_tag").css("border","0px");
		$("#europe_tag").css("background","white");
		$("#japan_tag").css("border","0px");
		$("#japan_tag").css("background","white");
		$("#Southeast_Asia_tag").css("border","0px");
		$("#Southeast_Asia_tag").css("background","white");
		$("#japan_div").css("display","none");
		$("#Southeast_Asia_div").css("display","none");
		$("#europe_div").css("display","none");
		$("#Americas_div").css("display","none");
		$("#Oceania_div").css("display","none");
		$("#Middle_East_div").css("display","none");
	});
	
	/* 유럽태그 */
	$("#europe_tag").on("click",function(){
		$("#europe_tag").css("border","1px solid #4B73E1");
		$("#europe_tag").css("background","#f3f6fd");
		$("#europe_div").css("display","inline-block");
		
		$("#Middle_East_tag").css("border","0px");
		$("#Middle_East_tag").css("background","white");
		$("#Oceania_tag").css("border","0px");
		$("#Oceania_tag").css("background","white");
		$("#Americas_tag").css("border","0px");
		$("#Americas_tag").css("background","white");
		$("#china_tag").css("border","0px");
		$("#china_tag").css("background","white");
		$("#japan_tag").css("border","0px");
		$("#japan_tag").css("background","white");
		$("#Southeast_Asia_tag").css("border","0px");
		$("#Southeast_Asia_tag").css("background","white");
		$("#japan_div").css("display","none");
		$("#china_div").css("display","none");
		$("#Southeast_Asia_div").css("display","none");
		$("#Americas_div").css("display","none");
		$("#Oceania_div").css("display","none");
		$("#Middle_East_div").css("display","none");
	});
	
	/* 미주 */
	$("#Americas_tag").on("click",function(){
		$("#Americas_tag").css("border","1px solid #4B73E1");
		$("#Americas_tag").css("background","#f3f6fd");
		$("#Americas_div").css("display","inline-block");
		
		$("#Middle_East_tag").css("border","0px");
		$("#Middle_East_tag").css("background","white");
		$("#Oceania_tag").css("border","0px");
		$("#Oceania_tag").css("background","white");
		$("#europe_tag").css("border","0px");
		$("#europe_tag").css("background","white");
		$("#china_tag").css("border","0px");
		$("#china_tag").css("background","white");
		$("#japan_tag").css("border","0px");
		$("#japan_tag").css("background","white");
		$("#Southeast_Asia_tag").css("border","0px");
		$("#Southeast_Asia_tag").css("background","white");
		$("#japan_div").css("display","none");
		$("#china_div").css("display","none");
		$("#europe_div").css("display","none");
		$("#Southeast_Asia_div").css("display","none");
		$("#Oceania_div").css("display","none");
		$("#Middle_East_div").css("display","none");
	});
	
	/* 대양주 */
		$("#Oceania_tag").on("click",function(){
		$("#Oceania_tag").css("border","1px solid #4B73E1");
		$("#Oceania_tag").css("background","#f3f6fd");
		$("#Oceania_div").css("display","inline-block");      
		
		$("#Middle_East_tag").css("border","0px");
		$("#Middle_East_tag").css("background","white");
		$("#Americas_tag").css("border","0px");
		$("#Americas_tag").css("background","white");
		$("#europe_tag").css("border","0px");
		$("#europe_tag").css("background","white");
		$("#china_tag").css("border","0px");
		$("#china_tag").css("background","white");
		$("#japan_tag").css("border","0px");
		$("#japan_tag").css("background","white");
		$("#Southeast_Asia_tag").css("border","0px");
		$("#Southeast_Asia_tag").css("background","white");
		$("#japan_div").css("display","none");
		$("#china_div").css("display","none");
		$("#europe_div").css("display","none");
		$("#Americas_div").css("display","none");
		$("#Southeast_Asia_div").css("display","none");
		$("#Middle_East_div").css("display","none");
	});
	 
	/* 중동,아프리카 */
	$("#Middle_East_tag").on("click",function(){
		$("#Middle_East_tag").css("border","1px solid #4B73E1");
		$("#Middle_East_tag").css("background","#f3f6fd");
		$("#Middle_East_div").css("display","inline-block");
		
		$("#Oceania_tag").css("border","0px");
		$("#Oceania_tag").css("background","white");
		$("#Americas_tag").css("border","0px");
		$("#Americas_tag").css("background","white");
		$("#europe_tag").css("border","0px");
		$("#europe_tag").css("background","white");
		$("#china_tag").css("border","0px");
		$("#china_tag").css("background","white");
		$("#japan_tag").css("border","0px");
		$("#japan_tag").css("background","white");
		$("#Southeast_Asia_tag").css("border","0px");
		$("#Southeast_Asia_tag").css("background","white");
		$("#japan_div").css("display","none");
		$("#china_div").css("display","none");
		$("#europe_div").css("display","none");
		$("#Americas_div").css("display","none");
		$("#Oceania_div").css("display","none");
		$("#Southeast_Asia_div").css("display","none");
	});
	
	
	/* 목적지 클릭 시  */
	$("#citySelect_1").on("click",function(){
		$(".select_people").text($("#citySelect_1").text());
		$(".select_endBox").css("display","none");
	})
		$("#citySelect_1").on("click",function(){
		$(".select_people").text($("#citySelect_1").text());
		$(".select_endBox").css("display","none");
	})
	
	
	$("#citySelect_2").on("click",function(){
		$(".select_people").text($("#citySelect_2").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_3").on("click",function(){
		$(".select_people").text($("#citySelect_3").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_4").on("click",function(){
		$(".select_people").text($("#citySelect_4").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_5").on("click",function(){
		$(".select_people").text($("#citySelect_5").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_6").on("click",function(){
		$(".select_people").text($("#citySelect_6").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_7").on("click",function(){
		$(".select_people").text($("#citySelect_7").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_8").on("click",function(){
		$(".select_people").text($("#citySelect_8").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_9").on("click",function(){
		$(".select_people").text($("#citySelect_9").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_10").on("click",function(){
		$(".select_people").text($("#citySelect_10").text());
		$(".select_endBox").css("display","none");
	})
	
	
	
	
	$("#citySelect_11").on("click",function(){
		$(".select_people").text($("#citySelect_11").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_12").on("click",function(){
		$(".select_people").text($("#citySelect_12").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_13").on("click",function(){
		$(".select_people").text($("#citySelect_13").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_14").on("click",function(){
		$(".select_people").text($("#citySelect_14").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_15").on("click",function(){
		$(".select_people").text($("#citySelect_15").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_16").on("click",function(){
		$(".select_people").text($("#citySelect_16").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_17").on("click",function(){
		$(".select_people").text($("#citySelect_17").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_18").on("click",function(){
		$(".select_people").text($("#citySelect_18").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_19").on("click",function(){
		$(".select_people").text($("#citySelect_19").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_20").on("click",function(){
		$(".select_people").text($("#citySelect_20").text());
		$(".select_endBox").css("display","none");
	}) 
	
	
	$("#citySelect_21").on("click",function(){
		$(".select_people").text($("#citySelect_21").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_22").on("click",function(){
		$(".select_people").text($("#citySelect_22").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_23").on("click",function(){
		$(".select_people").text($("#citySelect_23").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_24").on("click",function(){
		$(".select_people").text($("#citySelect_24").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_25").on("click",function(){
		$(".select_people").text($("#citySelect_25").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_26").on("click",function(){
		$(".select_people").text($("#citySelect_26").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_27").on("click",function(){
		$(".select_people").text($("#citySelect_27").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_28").on("click",function(){
		$(".select_people").text($("#citySelect_28").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_29").on("click",function(){
		$(".select_people").text($("#citySelect_29").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_30").on("click",function(){
		$(".select_people").text($("#citySelect_30").text());
		$(".select_endBox").css("display","none");
	})
	
	
	
	$("#citySelect_31").on("click",function(){
		$(".select_people").text($("#citySelect_31").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_32").on("click",function(){
		$(".select_people").text($("#citySelect_32").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_33").on("click",function(){
		$(".select_people").text($("#citySelect_33").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_34").on("click",function(){
		$(".select_people").text($("#citySelect_34").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_35").on("click",function(){
		$(".select_people").text($("#citySelect_35").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_36").on("click",function(){
		$(".select_people").text($("#citySelect_36").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_37").on("click",function(){
		$(".select_people").text($("#citySelect_37").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_38").on("click",function(){
		$(".select_people").text($("#citySelect_38").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_39").on("click",function(){
		$(".select_people").text($("#citySelect_39").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_40").on("click",function(){
		$(".select_people").text($("#citySelect_40").text());
		$(".select_endBox").css("display","none");
	})
	
	
	
	$("#citySelect_41").on("click",function(){
		$(".select_people").text($("#citySelect_41").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_42").on("click",function(){
		$(".select_people").text($("#citySelect_42").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_43").on("click",function(){
		$(".select_people").text($("#citySelect_43").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_44").on("click",function(){
		$(".select_people").text($("#citySelect_44").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_45").on("click",function(){
		$(".select_people").text($("#citySelect_45").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_46").on("click",function(){
		$(".select_people").text($("#citySelect_46").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_47").on("click",function(){
		$(".select_people").text($("#citySelect_47").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_48").on("click",function(){
		$(".select_people").text($("#citySelect_48").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_49").on("click",function(){
		$(".select_people").text($("#citySelect_49").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_50").on("click",function(){
		$(".select_people").text($("#citySelect_50").text());
		$(".select_endBox").css("display","none");
	})
	
	
	
	$("#citySelect_51").on("click",function(){
		$(".select_people").text($("#citySelect_51").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_52").on("click",function(){
		$(".select_people").text($("#citySelect_52").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_53").on("click",function(){
		$(".select_people").text($("#citySelect_53").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_54").on("click",function(){
		$(".select_people").text($("#citySelect_54").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_55").on("click",function(){
		$(".select_people").text($("#citySelect_55").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_56").on("click",function(){
		$(".select_people").text($("#citySelect_56").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_57").on("click",function(){
		$(".select_people").text($("#citySelect_57").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_58").on("click",function(){
		$(".select_people").text($("#citySelect_58").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_59").on("click",function(){
		$(".select_people").text($("#citySelect_59").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_60").on("click",function(){
		$(".select_people").text($("#citySelect_60").text());
		$(".select_endBox").css("display","none");
	})
	
	
	
	$("#citySelect_61").on("click",function(){
		$(".select_people").text($("#citySelect_61").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_62").on("click",function(){
		$(".select_people").text($("#citySelect_62").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_63").on("click",function(){
		$(".select_people").text($("#citySelect_63").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_64").on("click",function(){
		$(".select_people").text($("#citySelect_64").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_65").on("click",function(){
		$(".select_people").text($("#citySelect_65").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_66").on("click",function(){
		$(".select_people").text($("#citySelect_66").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_67").on("click",function(){
		$(".select_people").text($("#citySelect_67").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_68").on("click",function(){
		$(".select_people").text($("#citySelect_68").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_69").on("click",function(){
		$(".select_people").text($("#citySelect_69").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_70").on("click",function(){
		$(".select_people").text($("#citySelect_70").text());
		$(".select_endBox").css("display","none");
	})
	

	
	$("#citySelect_71").on("click",function(){
		$(".select_people").text($("#citySelect_71").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_72").on("click",function(){
		$(".select_people").text($("#citySelect_72").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_73").on("click",function(){
		$(".select_people").text($("#citySelect_73").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_74").on("click",function(){
		$(".select_people").text($("#citySelect_74").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_75").on("click",function(){
		$(".select_people").text($("#citySelect_75").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_76").on("click",function(){
		$(".select_people").text($("#citySelect_76").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_77").on("click",function(){
		$(".select_people").text($("#citySelect_77").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_78").on("click",function(){
		$(".select_people").text($("#citySelect_78").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_79").on("click",function(){
		$(".select_people").text($("#citySelect_79").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_80").on("click",function(){
		$(".select_people").text($("#citySelect_80").text());
		$(".select_endBox").css("display","none");
	})
	
	
	
	$("#citySelect_81").on("click",function(){
		$(".select_people").text($("#citySelect_81").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_82").on("click",function(){
		$(".select_people").text($("#citySelect_82").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_83").on("click",function(){
		$(".select_people").text($("#citySelect_83").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_84").on("click",function(){
		$(".select_people").text($("#citySelect_84").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_85").on("click",function(){
		$(".select_people").text($("#citySelect_85").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_86").on("click",function(){
		$(".select_people").text($("#citySelect_86").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_87").on("click",function(){
		$(".select_people").text($("#citySelect_87").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_88").on("click",function(){
		$(".select_people").text($("#citySelect_88").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_89").on("click",function(){
		$(".select_people").text($("#citySelect_89").text());
		$(".select_endBox").css("display","none");
	})
	
	$("#citySelect_90").on("click",function(){
		$(".select_people").text($("#citySelect_90").text());
		$(".select_endBox").css("display","none");
	})
	
	});
});

	let busType = 'null';
	function clickTab(type) {
	    busType = type;
	}
	/* 
	$("#search_btn").click(function () {
	    if (busType == 'null') {
	        alert("타입을 먼저 선택해 주세요");
	        
	    } else {
	        
	        console.log("검색 실행");
	    }
	}); */
</script>
</body>
</html>