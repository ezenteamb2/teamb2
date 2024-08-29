<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bus.css">

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
						<diV class="country_tag" id="Southeast_Asia_tag" style="border : 1px solid #4B73E1; background : #f3f6fd;">수도권</div>
						<diV class="country_tag" id="japan_tag">강원</div>
						<diV class="country_tag" id="china_tag">충청</div>
						<diV class="country_tag" id="europe_tag">경상</div>
						<diV class="country_tag" id="Americas_tag">전라</div>
<!-- 					<diV class="country_tag" id="Oceania_tag" style="visibility:hidden;">대양주</div>
						<diV class="country_tag" id="Middle_East_tag" style="visibility:hidden;">중동/아프리카</div> -->
					</div>
					
					<!-- 수도권 -->
					<div id="Southeast_Asia_div" style="display : inline-block; width: 570px; margin-left: 198px; position: relative; top: -436px;">
					
						<div class="city_tag" id="citySelect_1">수도권 통합(시내)</div>
						<div class="city_tag" id="citySelect_2">서울</div>
						<div class="city_tag" id="citySelect_3">경기</div>
						
						<div class="city_tag" id="citySelect_4">인천</div>
						<!-- <div class="city_tag" id="citySelect_5">푸켓</div>
						<div class="city_tag" id="citySelect_6">하노이</div>
					
						<div class="city_tag" id="citySelect_7">호치민</div>
						<div class="city_tag" id="citySelect_8">다낭</div>
						<div class="city_tag" id="citySelect_9">나트랑</div>
						
						<div class="city_tag" id="citySelect_10">마닐라</div>
						<div class="city_tag" id="citySelect_11">세부</div>
						<div class="city_tag" id="citySelect_12">보라카이</div>
						
						<div class="city_tag" id="citySelect_13">발리</div>
						<div class="city_tag" id="citySelect_14">싱카포르</div>
						<div class="city_tag" id="citySelect_15">비엔티엔</div>
						
						<div class="city_tag" id="citySelect_16">씨엠립</div>
						<div class="city_tag" id="citySelect_17">코타키나발루</div>
						<div class="city_tag" id="citySelect_18">쿠알라룸푸르</div>
						
						<div class="city_tag" id="citySelect_19">울란바타르</div>
						<div class="city_tag" id="citySelect_20">델리</div> 
					 -->
					</div>
					
					<!-- 강원 -->
					<div id="japan_div" style="display : inline-block; width: 570px; margin-left: 198px; position: relative; top: -436px; display:none;">
					
						<div class="city_tag" id="citySelect_21">강릉</div>
						<div class="city_tag" id="citySelect_22">삼척</div>
						<div class="city_tag" id="citySelect_23">원주</div>
						
						<div class="city_tag" id="citySelect_24">춘천(가평)</div>
						<div class="city_tag" id="citySelect_25">속초(양양)</div>
	<!-- 					<div class="city_tag" id="citySelect_26">삿포로</div>
					
						<div class="city_tag" id="citySelect_27">나고야</div>
						<div class="city_tag" id="citySelect_28">가고시마</div>
						<div class="city_tag" id="citySelect_29">기타큐슈</div>
						
						<div class="city_tag" id="citySelect_30">구마모토</div>
						<div class="city_tag" id="citySelect_31">미야자키</div>
						<div class="city_tag" id="citySelect_32">오이타</div>
						
						<div class="city_tag" id="citySelect_33">이바라키</div> -->
						
					</div>
					
					<!-- 충청 -->
					<div id="china_div" style="display : inline-block; width: 570px; margin-left: 198px; position: relative; top: -436px; display:none;">
					
						<div class="city_tag" id="citySelect_34">청주</div>
						<div class="city_tag" id="citySelect_35">천안</div>
						<div class="city_tag" id="citySelect_36">충주</div>
						
						<div class="city_tag" id="citySelect_37">태안</div>
						<div class="city_tag" id="citySelect_38">아산(온양)</div>
						<div class="city_tag" id="citySelect_39">대전</div>
						
						<div class="city_tag" id="citySelect_40">세종</div>
						<div class="city_tag" id="citySelect_41">보령</div>
						<div class="city_tag" id="citySelect_42">논산</div>
						
						<div class="city_tag" id="citySelect_43">증평</div>
						<div class="city_tag" id="citySelect_44">유성</div>
						<div class="city_tag" id="citySelect_45">계룡금암</div>
	
						
					</div>
					
					<!-- 경상 -->
					<div id="europe_div" style="display : inline-block; width: 570px; margin-left: 198px; position: relative; top: -436px; display:none;">
					
						<div class="city_tag" id="citySelect_48">안동</div>
						<div class="city_tag" id="citySelect_49">창원(마산경유)</div>
						<div class="city_tag" id="citySelect_50">포항</div>
						
						<div class="city_tag" id="citySelect_51">거제(고현)</div>
						<div class="city_tag" id="citySelect_52">대구</div>
						<div class="city_tag" id="citySelect_53">경산(구미경유)</div>
						
						<div class="city_tag" id="citySelect_54">울산</div>
						<div class="city_tag" id="citySelect_55">부산해운대</div>
						<div class="city_tag" id="citySelect_56">통영</div>


						<div class="city_tag" id="citySelect_57">경주</div>
						<div class="city_tag" id="citySelect_58">장유</div>
						<div class="city_tag" id="citySelect_59">진주</div>

						
						<div class="city_tag" id="citySelect_60">진해</div>
<!-- 					<div class="city_tag" id="citySelect_61">모스크바</div>
						<div class="city_tag" id="citySelect_62">블라디보스톡</div>
						
						<div class="city_tag">바르샤바</div>-->
						
					</div>
					
					<!-- 전라 -->
					<div id="Americas_div" style="display : inline-block; width: 570px; margin-left: 198px; position: relative; top: -436px; display:none;">
					
						<div class="city_tag" id="citySelect_63">전주</div>
						<div class="city_tag" id="citySelect_64">임실(전주경유)</div>
						<div class="city_tag" id="citySelect_65">여수(순천경유)</div>
						
						<div class="city_tag" id="citySelect_66">익산(군산경유)</div>
						<div class="city_tag" id="citySelect_67">목포</div>
						<div class="city_tag" id="citySelect_68">광주</div>
						
						<div class="city_tag" id="citySelect_69">동광양(순천경유)</div>
						<!-- 
						<div class="city_tag" id="citySelect_70"></div>
						<div class="city_tag" id="citySelect_71"></div>
						
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
				
				<div style="margin-top: 40px;">
				
					<div class="start_tag1">
						<div style="margin-top: 10px;">인천</div>
						<div>ICN</div>
					</div>
					<div class="start_tag2">
						<div style="margin-top: 10px;">김포</div>
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
          <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">공항버스</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">고속버스</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">시외버스</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="question-tab" data-bs-toggle="tab" data-bs-target="#question-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">시내버스</button>
        </li>
      </ul>

		<div class="tab-content" id="myTabContent">
			<!---------------------공항버스 ------------------>
      
        <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
            
            <div class="table_container">
	            <table class="table caption-top">
	                <caption>
	                	
	                </caption>
	                <thead>
	                  <tr>
	                   
	                    <th scope="col">출발지</th>
	                    <th scope="col">도착지</th>
	                    <th scope="col">첫차시간</th>
	                    <th scope="col">막차시간</th>
	                    <th scope="col">노선정보</th>
	                    <th scope="col">운행간격</th>  
	                    <th scope="col">유형</th> 
	                  </tr>
	                </thead>
	                <tbody class="tbody">

	                	
	                	<!--
							<tr>
								<td>전주</td>
								<td>인천공항</td>
								<td>00:30</td>
								<td>14:00</td>
								<td><a href="#" title="노선정보" data-bs-toggle="popover"
									data-bs-placement="bottom" data-bs-content="전주->인천">상세보기</a></td>
								<td>1시간</td>
								<td>리무진</td>
							</tr>
							 <tr>
								<td>전주</td>
								<td>인천공항</td>
								<td>00:30</td>
								<td>14:00</td>
								<td><a href="#" title="노선정보" data-bs-toggle="popover"
									data-bs-placement="bottom" data-bs-content="전주->인천">상세보기</a></td>
								<td>1시간</td>
								<td>리무진</td>
							</tr>
							<tr>
								<td>전주</td>
								<td>인천공항</td>
								<td>00:30</td>
								<td>14:00</td>
								<td><a href="#" title="노선정보" data-bs-toggle="popover"
									data-bs-placement="bottom" data-bs-content="전주->인천">상세보기</a></td>
								<td>1시간</td>
								<td>리무진</td>
							</tr>
							
							<tr>
								<td>전주</td>
								<td>인천공항</td>
								<td>00:30</td>
								<td>14:00</td>
								<td><a href="#" title="노선정보" data-bs-toggle="popover"
									data-bs-placement="bottom" data-bs-content="전주->인천">상세보기</a></td>
								<td>1시간</td>
								<td>리무진</td>
							</tr>
							
							<tr>
								<td>전주</td>
								<td>인천공항</td>
								<td>00:30</td>
								<td>14:00</td>
								<td><a href="#" title="노선정보" data-bs-toggle="popover"
									data-bs-placement="bottom" data-bs-content="전주->인천">상세보기</a></td>
								<td>1시간</td>
								<td>리무진</td>
							</tr>
							
							<tr>
								<td>전주</td>
								<td>인천공항</td>
								<td>00:30</td>
								<td>14:00</td>
								<td><a href="#" title="노선정보" data-bs-toggle="popover"
									data-bs-placement="bottom" data-bs-content="전주->인천">상세보기</a></td>
								<td>1시간</td>
								<td>리무진</td>
							</tr>
							
							<tr>
								<td>전주</td>
								<td>인천공항</td>
								<td>00:30</td>
								<td>14:00</td>
								<td><a href="#" title="노선정보" data-bs-toggle="popover"
									data-bs-placement="bottom" data-bs-content="전주->인천">상세보기</a></td>
								<td>1시간</td>
								<td>리무진</td>
							</tr>
							
							<tr>
								<td>전주</td>
								<td>인천공항</td>
								<td>00:30</td>
								<td>14:00</td>
								<td><a href="#" title="노선정보" data-bs-toggle="popover"
									data-bs-placement="bottom" data-bs-content="전주->인천">상세보기</a></td>
								<td>1시간</td>
								<td>리무진</td>
							</tr>
							
							<tr>
								<td>전주</td>
								<td>인천공항</td>
								<td>00:30</td>
								<td>14:00</td>
								<td><a href="#" title="노선정보" data-bs-toggle="popover"
									data-bs-placement="bottom" data-bs-content="전주->인천">상세보기</a></td>
								<td>1시간</td>
								<td>리무진</td>
							</tr>
							
							<tr>
								<td>전주</td>
								<td>인천공항</td>
								<td>00:30</td>
								<td>14:00</td>
								<td><a href="#" title="노선정보" data-bs-toggle="popover"
									data-bs-placement="bottom" data-bs-content="전주->인천">상세보기</a></td>
								<td>1시간</td>
								<td>리무진</td>
							</tr> -->
						</tbody>
	              </table>
              </div><!-- <div class="table_container"> -->
              
              <nav aria-label="Page navigation example">
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
        </div>
        
        
        <!---------------------고속버스 ------------------>
        
        <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
	       	<div class="table_container">
	          <table class="table caption-top">
	            <caption>List of boards</caption>
	            <thead>
	              <tr>
	                <th scope="col">출발일</th>
	                <th scope="col">출발지</th>
	                <th scope="col">도착지</th>
	                <th scope="col">출발시간</th>
	                <th scope="col">도착시간</th>
	                <th scope="col">노선정보</th>
	                <th scope="col">버스등급</th>   
	              </tr>
	            </thead>
	            <tbody>
	              <tr>
	                <td>선택하신 출발일에는 예매 가능한 버스가 없습니다.</td>
	              </tr>
	            </tbody>
	          	</table> 
	          </div> <!--<div class="table_container"> -->
	          
	               
	          <nav aria-label="Page navigation example">
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
	          
	        </div>
	        
	        
	        <!---------------------시외버스 ------------------>
	       
		<div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
	    	<div class="table_container">
	          <table class="table caption-top">
	            <caption>List of boards</caption>
	            <thead>
	              <tr>
	                <th scope="col">출발일</th>
	                <th scope="col">출발지</th>
	                <th scope="col">도착지</th>
	                <th scope="col">출발시간</th>
	                <th scope="col">도착시간</th>
	                <th scope="col">노선정보</th>
	                <th scope="col">버스등급</th>  
	              </tr>
	            </thead>
	            <tbody>
	              <tr>
	                <td>20240802</td>
	                <td>전주</td>
	                <td>인천공항</td>
	                <td>00:00</td>
	                <td>03:00</td>
	                <td> <a href="#" title="노선정보" data-bs-toggle="popover" data-bs-placement="bottom" data-bs-content="전주->인천">상세보기</a></td>
	                <td>우등</td>
	              </tr>
	            </tbody>
	          </table> 
          </div> <!-- <div class="table_container"> -->
          <nav aria-label="Page navigation example">
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

        </div>
       <!--  <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">...</div> -->
  
      
      <!---------------------시내버스 ------------------>
      <div class="tab-pane fade" id="question-tab-pane" role="tabpanel" aria-labelledby="question-tab" tabindex="0">
        <div class="table_container">
	        <table class="table caption-top">
	          <caption>시내버스 list</caption>
	          <thead>
	            <tr>
	                <th scope="col">기점</th>
	                <th scope="col">종점</th>
	                <th scope="col">첫차시간</th>
	                <th scope="col">막차시간</th>
	                <th scope="col">노선정보</th>
	            </tr>
	          </thead>
	          <tbody>
	            <tr>
	                <td>송천</td>
	                <td>평화</td>
	                <td>06:00</td>
	                <td>11:00</td>
	                <td> <a href="#" title="노선정보" data-bs-toggle="popover" data-bs-placement="bottom" data-bs-content="전주->인천">상세보기</a></td>
	              </tr>
	          </tbody>
	        </table>   
		</div>   <!-- <div class="table_container"> -->
		
        <nav aria-label="Page navigation example">
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
      </div>
</div>
</div><!--class="category"  -->
<script>
var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
	console.log(popoverTriggerEl)
	return new bootstrap.Popover(popoverTriggerEl,{
		trigger: 'focus'
	})
	
})

document.getElementById('search_btn').addEventListener('click', function(){
	var FromCity = document.getElementById('select_people').innerText; 
/* 	document.getElementById('hiddenSelectPeople').value = value; */
	console.log(FromCity); 
	var ToAirport = document.getElementById('start_result').innerText; 
/* 	document.getElementById('hiddenStartResult').value = value2;  */
	console.log(ToAirport); 

 	$.ajax({
		url:"<c:url value='/airbus/bus.do'/>", 
		method: "POST", 
		data: {
			"city":FromCity,
			"airport":ToAirport
		},
		success: function(data){
			console.log(data);
			if(data.result == "success"){
				if(data.type == "icn"){
					console.log(data.data[0].busnumber);
				}
				 let element = "";
				element += '<table class="table caption-top">';
				element += ''; 
				console.log("성공");
			}
			else {
				console.log("실패");
			}
		}

	});  


});


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
					$(".start_result").text("인천( ICN )");
					$(".select_startBox").css("display","none");
			});
			
			$(".start_tag2").on("click",function(){
					$(".start_result").text("김포( GMP )");
					$(".select_startBox").css("display","none");
			});
			
			$(".start_tag3").on("click",function(){
					$(".start_result").text("김해( PUS )");
					$(".select_startBox").css("display","none");
			});
			
			$(".start_tag4").on("click",function(){
					$(".start_result").text("제주( CJU )");
					$(".select_startBox").css("display","none");
			});
			
			$(".startBox_close").on("click", function(){
				$(".select_startBox").css("display","none");
			});
			
		});
	
	
		
	
		
		/* 출발시간 선택 */
		$(".select_seat_div").on("click",function(){
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
			
			
		});
		
		
	
		
	
	
		/* 종료시간 선택 */
		$(".select_seat_div2").on("click",function(){
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
			
		});
		
		
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
				  activeDate: new Date(),
				  getFirstDay: (yy, mm) => new Date(yy, mm, 1),
				  getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
				  nextMonth: function () {
				    let d = new Date();
				    d.setDate(1);
				    d.setMonth(++this.monForChange);
				    this.activeDate = d;
				    return d;
				  },
				  prevMonth: function () {
				    let d = new Date();
				    d.setDate(1);
				    d.setMonth(--this.monForChange);
				    this.activeDate = d;
				    return d;
				  },
				  addZero: (num) => (num < 10) ? '0' + num : num,
				  activeDTag: null,
				  getIndex: function (node) {
				    let index = 0;
				    while (node = node.previousElementSibling) {
				      index++;
				    }
				    return index;
				  }
				};

				const $calBody = document.querySelector('.cal-body');
				const $btnNext = document.querySelector('.btn-cal.next');
				const $btnPrev = document.querySelector('.btn-cal.prev');

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
				function loadYYMM (fullDate) {
				  let yy = fullDate.getFullYear();
				  let mm = fullDate.getMonth();
				  let firstDay = init.getFirstDay(yy, mm);
				  let lastDay = init.getLastDay(yy, mm);
				  let markToday;  // for marking today date
				  
				  if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
				    markToday = init.today.getDate();
				  }

				  document.querySelector('.cal-month').textContent = init.monList[mm];
				  document.querySelector('.cal-year').textContent = yy;

				  let trtd = '';
				  let startCount;
				  let countDay = 0;
				  for (let i = 0; i < 6; i++) {
				    trtd += '<tr>';
				    for (let j = 0; j < 7; j++) {
				      if (i === 0 && !startCount && j === firstDay.getDay()) {
				        startCount = 1;
				      }
				      if (!startCount) {
				        trtd += '<td>'
				      } else {
				        let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
				        trtd += '<td class="day';
				        trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
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
				  if (e.target.classList.contains('day')) {
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
	
</script>
</body>
</html>