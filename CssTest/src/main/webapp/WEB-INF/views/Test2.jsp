<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/include/header.jsp" %>

<!-- css -->
<link rel="stylesheet" href="<c:url value='/resources/css/test2.css' />" rel="stylesheet">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- custom js -->
<script src="<c:url value='/resources/js/test2.js'/>"></script>

<!-- icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<%@ include file="/include/ChatBot.jsp" %>
<!-- 전체 div -->
<div class="reservation_div">
		
		
								<!---------------------------------- 태그 ---------------------------------->
	<div style="margin-bottom : 30px;">
		<div class="Schedule_div">
			운항 스케줄
		</div>
		<div class="Real_Time_div">
			<a href="<c:url value='/airport.do'/>" style="text-decoration: none;">실시간</a>
		</div>
		<c:if test="${not empty loggedInUser}">
			<c:if test="${userRole == 1}">
				<div style="margin-left: 20px;width: 500px; display: inline-block;">
					<button type="button" class="btn btn-light" onclick="flightSchUp()">운항 스케줄 업데이트</button>
				</div>
			</c:if>
		</c:if>
	</div>
	
<div style="display: flex; align-items: center; gap: 5px; flex-direction: column; width: fit-content; margin: auto;">
	<div class="select-container" style="position: relative;">
								<!---------------------------------- 출발지 선택 ---------------------------------->	
		<!-- 출발지 선택 div -->
		<div class="select_startDiv">
			
			<img src="<c:url value='/resources/img/airport/startAir.png'/>" class="start_img">
			<div class="start_result">출발지 선택</div>
			
		</div>
		
		<div class="select_startBox" style="display : none">
		
			<div style="font-size : 16px; margin-bottom : 40px;">출발지 선택</div>
			
			<div>
			
				<div>
					<!-- 나라 -->
					<div style="width: 170px; height: 450px; border-right: 1px solid #d0d0d0; display : inline-block;">
						<diV class="start_country" id="Korea_start" style="border : 1px solid #4B73E1; background : #f3f6fd;">대한민국</div>
						<diV class="start_country" id="Southeast_Asia_start">동남아</div>
						<diV class="start_country" id="Japan_start">일본</div>
						<diV class="start_country" id="China_start">중국/홍콩</div>
						<diV class="start_country" id="Europe_start">유럽</div>
						<diV class="start_country" id="Americas_start">미주</div>
						<diV class="start_country" id="Oceania_start">대양주</div>
						<diV class="start_country" id="Middle_East_start">중동/아프리카</div>
					</div>
					
					<!-- 대한민국 -->
					<div id="Korea" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -361px;">
					
						<div class="start_city" id="selectcity_1" data-departure="ICN">인천</div>
						<div class="start_city" id="selectcity_2" data-departure="GMP">김포</div>
						<div class="start_city" id="selectcity_3" data-departure="PUS">김해</div>
						
						<div class="start_city" id="selectcity_4" data-departure="CJU">제주</div>
					
					</div>
					
					<!-- 동남아 -->
					<div id="Southeast_Asia" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -19px; display:none;">
					
						<div class="start_city" id="selectcity_5" data-departure="TPE">대만(타이베이)</div>
						<div class="start_city" id="selectcity_6" data-departure="KHH">대만(까오슝)</div>
						<div class="start_city" id="selectcity_7" data-departure="BKK">방콕(수완나품)</div>
						
						<div class="start_city" id="selectcity_8" data-departure="CNX">방콕(치앙마이)</div>
						<div class="start_city" id="selectcity_9" data-departure="HKT">푸켓</div>
						<div class="start_city" id="selectcity_10" data-departure="HAN">하노이</div>
					
						<div class="start_city" id="selectcity_11" data-departure="SGN">호치민</div>
						<div class="start_city" id="selectcity_12" data-departure="DAD">다낭</div>
						<div class="start_city" id="selectcity_13" data-departure="CXR">나트랑</div>

						<div class="start_city" id="selectcity_14" data-departure="DLI">달랏</div>						
						<div class="start_city" id="selectcity_15" data-departure="MNL">마닐라</div>
						<div class="start_city" id="selectcity_16" data-departure="CEB">세부</div>
						
						<div class="start_city" id="selectcity_17" data-departure="KLO">칼리보</div>
						<div class="start_city" id="selectcity_18" data-departure="DPS">발리</div>
						<div class="start_city" id="selectcity_19" data-departure="SIN">싱카포르</div>
						
						<div class="start_city" id="selectcity_20" data-departure="VTE">비엔티엔</div>
						<div class="start_city" id="selectcity_21" data-departure="PNH">씨엠립</div>
						<div class="start_city" id="selectcity_22" data-departure="BKI">코타키나발루</div>
						
						<div class="start_city" id="selectcity_23" data-departure="KUL">쿠알라룸푸르</div>
						<div class="start_city" id="selectcity_24" data-departure="UBN">울란바토르</div>
						<div class="start_city" id="selectcity_25" data-departure="DEL">델리</div>
					
					</div>
					
					<!-- 일본 -->
					<div id="Japan" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -153px; display:none;">
					
						<div class="start_city" id="selectcity_26" data-departure="NRT">도쿄(나리타)</div>
						<div class="start_city" id="selectcity_27" data-departure="HND">도쿄(하네다)</div>
						<div class="start_city" id="selectcity_28" data-departure="KIX">오사카(간사이)</div>
						
						<div class="start_city" id="selectcity_29" data-departure="FUK">후쿠오카</div>
						<div class="start_city" id="selectcity_30" data-departure="OKA">오키나와</div>
						<div class="start_city" id="selectcity_31" data-departure="CTS">삿포로</div>
				
						<div class="start_city" id="selectcity_32" data-departure="NGO">나고야</div>
						<div class="start_city" id="selectcity_33" data-departure="KOJ">가고시마</div>
						<div class="start_city" id="selectcity_34" data-departure="KKJ">기타큐슈</div>
						
						<div class="start_city" id="selectcity_35" data-departure="KMJ">구마모토</div>
						<div class="start_city" id="selectcity_36" data-departure="KMI">미야자키</div>
						<div class="start_city" id="selectcity_37" data-departure="OIT">오이타</div>
						
						<div class="start_city" id="selectcity_38" data-departure="KIJ">니가타</div>
						<div class="start_city" id="selectcity_39" data-departure="TAK">다카마쓰</div>
					
					</div>
					
					<!-- 중국/홍콩 -->
					<div id="China" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -93px; display:none;">
					
						<div class="start_city" id="selectcity_40" data-departure="HKG">홍콩</div>
						<div class="start_city" id="selectcity_41" data-departure="MFM">마카오</div>
						<div class="start_city" id="selectcity_42" data-departure="PKX">북경(다싱)</div>
						
						<div class="start_city" id="selectcity_43" data-departure="PEK">북경(서우두)</div>
						<div class="start_city" id="selectcity_44" data-departure="PVG">상해(푸동)</div>
						<div class="start_city" id="selectcity_45" data-departure="SHA">상해(홍교)</div>
						
						<div class="start_city" id="selectcity_46" data-departure="CAN">광저우</div>
						<div class="start_city" id="selectcity_47" data-departure="TAO">청도</div>
						<div class="start_city" id="selectcity_48" data-departure="YNJ">연길</div>
						
						<div class="start_city" id="selectcity_49" data-departure="SHE">심양</div>
						<div class="start_city" id="selectcity_50" data-departure="DLC">대련</div>
						<div class="start_city" id="selectcity_51" data-departure="SZX">심천</div>
						
						<div class="start_city" id="selectcity_52" data-departure="YNT">연태</div>
						<div class="start_city" id="selectcity_53" data-departure="WEH">위해</div>
						<div class="start_city" id="selectcity_54" data-departure="TSN">톈진</div>
						
						<div class="start_city" id="selectcity_55" data-departure="NKG">난징</div>
						
					</div>
					
					<!-- 유럽 -->
					<div id="Europe" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -92px; display:none;">
					
						<div class="start_city" id="selectcity_56" data-departure="CDG">파리(샤를드골)</div>
						<div class="start_city" id="selectcity_57" data-departure="LHR">런던(히드로)</div>
						<div class="start_city" id="selectcity_58" data-departure="FCO">로마</div>
					
						<div class="start_city" id="selectcity_59" data-departure="MXP">밀라노</div>
						<div class="start_city" id="selectcity_60" data-departure="PRG">프라하</div>
						<div class="start_city" id="selectcity_61" data-departure="FRA">프랑크푸르트</div>
					
						<div class="start_city" id="selectcity_62" data-departure="BCN">바르셀로나</div>
						<div class="start_city" id="selectcity_63" data-departure="MAD">마드리드</div>
						<div class="start_city" id="selectcity_64" data-departure="BUD">부다페스트</div>
						
						<div class="start_city" id="selectcity_65" data-departure="AMS">암스테르담</div>
						<div class="start_city" id="selectcity_66" data-departure="ZRH">취리히</div>
						<div class="start_city" id="selectcity_67" data-departure="IST">이스탄불</div>
						
						<div class="start_city" id="selectcity_68" data-departure="HEL">헬싱키</div>
						<div class="start_city" id="selectcity_69" data-departure="SVO">모스크바</div>
						<div class="start_city" id="selectcity_70" data-departure="VVO">블라디보스톡</div>
					
						<div class="start_city" id="selectcity_71" data-departure="WAW">바르샤바</div>
						
					</div>
					
					<!-- 미주 -->
					<div id="Americas" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -152px; display:none;">
					
						<div class="start_city" id="selectcity_72" data-departure="LAX">로스앤젤레스</div>
						<div class="start_city" id="selectcity_73" data-departure="JFK">뉴욕(존 에프 케네디)</div>
						<div class="start_city" id="selectcity_74" data-departure="EWR">뉴욕(뉴어크)</div>
						
						<div class="start_city" id="selectcity_75" data-departure="LAS">라스베이거스</div>
						<div class="start_city" id="selectcity_76" data-departure="SFO">샌프란시스코</div>
						<div class="start_city" id="selectcity_77" data-departure="SEA">시애들</div>
						
						<div class="start_city" id="selectcity_78" data-departure="ORD">시카고(오헤어)</div>
						<div class="start_city" id="selectcity_79" data-departure="IAD">워싱턴</div>
						<div class="start_city" id="selectcity_80" data-departure="ATL">애틀랜타</div>
						
						<div class="start_city" id="selectcity_81" data-departure="HNL">호놀룰루</div>
						<div class="start_city" id="selectcity_82" data-departure="DTW">디트로이트</div>
						<div class="start_city" id="selectcity_83" data-departure="MSP">미네아폴리스</div>
						
						<div class="start_city" id="selectcity_84" data-departure="DFW">댈러스포트워스</div>
						<div class="start_city" id="selectcity_85" data-departure="YVR">밴쿠버</div>
						<div class="start_city" id="selectcity_86" data-departure="YYZ">토론토</div>
						
					</div>
					
					<!-- 대양주 -->
					<div id="Oceania" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -352px; display:none;">
					
						<div class="start_city" id="selectcity_87" data-departure="GUM">괌</div>
						<div class="start_city" id="selectcity_88" data-departure="SPN">사이판</div>
						<div class="start_city" id="selectcity_89" data-departure="SYD">시드니</div>
						
						<div class="start_city" id="selectcity_90" data-departure="MEL">멜버른</div>
						<div class="start_city" id="selectcity_91" data-departure="BNE">브리즈번</div>
						<div class="start_city" id="selectcity_92" data-departure="AKL">오클랜드</div>
						
					</div>
					
					<!-- 중동/아프리카 -->
					<div id="Middle_East" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -358px; display:none;">
					
						<div class="start_city" id="selectcity_93" data-departure="DXB">두바이</div>
						<div class="start_city" id="selectcity_94" data-departure="AUH">아부다비</div>
						<div class="start_city" id="selectcity_95" data-departure="DOH">도하</div>
						
						<div class="start_city" id="selectcity_96" data-departure="ADD">아디스아바바</div>	
						
					</div>
					
				</div>
			
			</div>
			
			<div class="startBox_close">
				취소
			</div>
				
		</div>
		
								<!---------------------------------- 목적지 선택 ---------------------------------->		


		<div class="select_people_div">
			
			<img src="<c:url value='/resources/img/airport/endAir.png'/>" class="end_img">
			<div class="select_people">목적지 선택</div>
			
		</div>
		<div class="select_endBox" style="display : none">
			
				<div style="font-size : 16px; margin-bottom : 40px;">목적지 선택</div>
				
				<div>
					<!-- 나라 -->
					<div style="width: 170px; height: 450px; border-right: 1px solid #d0d0d0; display : inline-block;">
						<diV class="country_tag" id="Korea_tag" style="border : 1px solid #4B73E1; background : #f3f6fd;">대한민국</div>
						<diV class="country_tag" id="Southeast_Asia_tag">동남아</div>
						<diV class="country_tag" id="japan_tag">일본</div>
						<diV class="country_tag" id="china_tag">중국/홍콩</div>
						<diV class="country_tag" id="europe_tag">유럽</div>
						<diV class="country_tag" id="Americas_tag">미주</div>
						<diV class="country_tag" id="Oceania_tag">대양주</div>
						<diV class="country_tag" id="Middle_East_tag">중동/아프리카</div>
					</div>
					
					<!-- 대한민국 -->
					<div id="Korea_div" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -361px;">
					
						<div class="city_tag" id="citySelect_1" data-arrival="ICN">인천</div>
						<div class="city_tag" id="citySelect_2" data-arrival="GMP">김포</div>
						<div class="city_tag" id="citySelect_3" data-arrival="PUS">김해</div>
						
						<div class="city_tag" id="citySelect_4" data-arrival="CJU">제주</div>
					
					</div>
					
					<!-- 동남아 -->
					<div id="Southeast_Asia_div" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -19px; display:none;">
					
						<div class="city_tag" id="citySelect_5" data-arrival="TPE">대만(타이베이)</div>
						<div class="city_tag" id="citySelect_6" data-arrival="KHH">대만(까오슝)</div>
						<div class="city_tag" id="citySelect_7" data-arrival="BKK">방콕(수완나품)</div>
					
						<div class="city_tag" id="citySelect_8" data-arrival="CNX">방콕(치앙마이)</div>
						<div class="city_tag" id="citySelect_9" data-arrival="HKT">푸켓</div>
						<div class="city_tag" id="citySelect_10" data-arrival="HAN">하노이</div>
					
						<div class="city_tag" id="citySelect_11" data-arrival="SGN">호치민</div>
						<div class="city_tag" id="citySelect_12" data-arrival="DAD">다낭</div>
						<div class="city_tag" id="citySelect_13" data-arrival="CXR">나트랑</div>
						
						<div class="city_tag" id="citySelect_14" data-arrival="DLI">달랏</div>
						<div class="city_tag" id="citySelect_15" data-arrival="MNL">마닐라</div>
						<div class="city_tag" id="citySelect_16" data-arrival="CEB">세부</div>
											
						<div class="city_tag" id="citySelect_17" data-arrival="KLO">칼리보</div>
						<div class="city_tag" id="citySelect_18" data-arrival="DPS">발리</div>
						<div class="city_tag" id="citySelect_19" data-arrival="SIN">싱카포르</div>
						
						<div class="city_tag" id="citySelect_20" data-arrival="VTE">비엔티엔</div>
						<div class="city_tag" id="citySelect_21" data-arrival="PNH">씨엠립</div>
						<div class="city_tag" id="citySelect_22" data-arrival="BKI">코타키나발루</div>
						
						<div class="city_tag" id="citySelect_23" data-arrival="KUL">쿠알라룸푸르</div>
						<div class="city_tag" id="citySelect_24" data-arrival="UBN">울란바토르</div>
						<div class="city_tag" id="citySelect_25" data-arrival="DEL">델리</div>
						
					</div>
					
					<!-- 일본 -->
					<div id="japan_div" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -153px; display:none;">
					
						<div class="city_tag" id="citySelect_26" data-arrival="NRT">도쿄(나리타)</div>
						<div class="city_tag" id="citySelect_27" data-arrival="HND">도쿄(하네다)</div>
						<div class="city_tag" id="citySelect_28" data-arrival="KIX">오사카(간사이)</div>
					
						<div class="city_tag" id="citySelect_29" data-arrival="FUK">후쿠오카</div>
						<div class="city_tag" id="citySelect_30" data-arrival="OKA">오키나와</div>
						<div class="city_tag" id="citySelect_31" data-arrival="CTS">삿포로</div>
					
						<div class="city_tag" id="citySelect_32" data-arrival="NGO">나고야</div>
						<div class="city_tag" id="citySelect_33" data-arrival="KOJ">가고시마</div>
						<div class="city_tag" id="citySelect_34" data-arrival="KKJ">기타큐슈</div>
						
						<div class="city_tag" id="citySelect_35" data-arrival="KMJ">구마모토</div>
						<div class="city_tag" id="citySelect_36" data-arrival="KMI">미야자키</div>
						<div class="city_tag" id="citySelect_37" data-arrival="OIT">오이타</div>
					
						<div class="city_tag" id="citySelect_38" data-arrival="KIJ">니가타</div>
						<div class="city_tag" id="citySelect_39" data-arrival="TAK">다카마쓰</div>
						
					</div>
					
					<!-- 중국/홍콩 -->
					<div id="china_div" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -93px; display:none;">
					
						<div class="city_tag" id="citySelect_40" data-arrival="HKG">홍콩</div>
						<div class="city_tag" id="citySelect_41" data-arrival="MFM">마카오</div>
						<div class="city_tag" id="citySelect_42" data-arrival="PKX">북경(다싱)</div>
						
						<div class="city_tag" id="citySelect_43" data-arrival="PEK">북경(서우두)</div>
						<div class="city_tag" id="citySelect_44" data-arrival="PVG">상해(푸동)</div>
						<div class="city_tag" id="citySelect_45" data-arrival="SHA">상해(홍교)</div>
						
						<div class="city_tag" id="citySelect_46" data-arrival="CAN">광저우</div>
						<div class="city_tag" id="citySelect_47" data-arrival="TAO">청도</div>
						<div class="city_tag" id="citySelect_48" data-arrival="YNJ">연길</div>
						
						<div class="city_tag" id="citySelect_49" data-arrival="SHE">심양</div>
						<div class="city_tag" id="citySelect_50" data-arrival="DLC">대련</div>
						<div class="city_tag" id="citySelect_51" data-arrival="SZX">심천</div>
						
						<div class="city_tag" id="citySelect_52" data-arrival="YNT">연태</div>
						<div class="city_tag" id="citySelect_53" data-arrival="WEH">위해</div>
						<div class="city_tag" id="citySelect_54" data-arrival="TSN">톈진</div>
						
						<div class="city_tag" id="citySelect_55" data-arrival="NKG">난징</div>
						
					</div>
					
					<!-- 유럽 -->
					<div id="europe_div" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -92px; display:none;">
					
						<div class="city_tag" id="citySelect_56" data-arrival="CDG">파리(샤를드골)</div>
						<div class="city_tag" id="citySelect_57" data-arrival="LHR">런던(히드로)</div>
						<div class="city_tag" id="citySelect_58" data-arrival="FCO">로마</div>
						
						<div class="city_tag" id="citySelect_59" data-arrival="MXP">밀라노</div>
						<div class="city_tag" id="citySelect_60" data-arrival="PRG">프라하</div>
						<div class="city_tag" id="citySelect_61" data-arrival="FRA">프랑크푸르트</div>
					
						<div class="city_tag" id="citySelect_62" data-arrival="BCN">바르셀로나</div>
						<div class="city_tag" id="citySelect_63" data-arrival="MAD">마드리드</div>
						<div class="city_tag" id="citySelect_64" data-arrival="BUD">부다페스트</div>
						
						<div class="city_tag" id="citySelect_65" data-arrival="AMS">암스테르담</div>
						<div class="city_tag" id="citySelect_66" data-arrival="ZRH">취리히</div>
						<div class="city_tag" id="citySelect_67" data-arrival="IST">이스탄불</div>
						
						<div class="city_tag" id="citySelect_68" data-arrival="HEL">헬싱키</div>
						<div class="city_tag" id="citySelect_69" data-arrival="SVO">모스크바</div>
						<div class="city_tag" id="citySelect_70" data-arrival="VVO">블라디보스톡</div>
						
						<div class="city_tag" id="citySelect_71" data-arrival="WAW">바르샤바</div>
						
					</div>
					
					<!-- 미주 -->
					<div id="Americas_div" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -152px; display:none;">
					
						<div class="city_tag" id="citySelect_72" data-arrival="LAX">로스앤젤레스</div>
						<div class="city_tag" id="citySelect_73" data-arrival="JFK">뉴욕(존 에프 케네디)</div>
						<div class="city_tag" id="citySelect_74" data-arrival="EWR">뉴욕(뉴어크)</div>
						
						<div class="city_tag" id="citySelect_75" data-arrival="LAS">라스베이거스</div>
						<div class="city_tag" id="citySelect_76" data-arrival="SFO">샌프란시스코</div>
						<div class="city_tag" id="citySelect_77" data-arrival="SEA">시애들</div>
						
						<div class="city_tag" id="citySelect_78" data-arrival="ORD">시카고(오헤어)</div>
						<div class="city_tag" id="citySelect_79" data-arrival="IAD">워싱턴</div>
						<div class="city_tag" id="citySelect_80" data-arrival="ATL">애틀랜타</div>
						
						<div class="city_tag" id="citySelect_81" data-arrival="HNL">호놀룰루</div>
						<div class="city_tag" id="citySelect_82" data-arrival="DTW">디트로이트</div>
						<div class="city_tag" id="citySelect_83" data-arrival="MSP">미네아폴리스</div>
						
						<div class="city_tag" id="citySelect_84" data-arrival="DFW">댈러스포트워스</div>
						<div class="city_tag" id="citySelect_85" data-arrival="YVR">밴쿠버</div>
						<div class="city_tag" id="citySelect_86" data-arrival="YYZ">토론토</div>
						
					</div>
					
					<!-- 대양주 -->
					<div id="Oceania_div" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -352px; display:none;">
					
						<div class="city_tag" id="citySelect_87" data-arrival="GUM">괌</div>
						<div class="city_tag" id="citySelect_88" data-arrival="SPN">사이판</div>
						<div class="city_tag" id="citySelect_89" data-arrival="SYD">시드니</div>
						
						<div class="city_tag" id="citySelect_90" data-arrival="MEL">멜버른</div>
						<div class="city_tag" id="citySelect_91" data-arrival="BNE">브리즈번</div>
						<div class="city_tag" id="citySelect_92" data-arrival="AKL">오클랜드</div>
						
					</div>
					
					<!-- 중동/아프리카 -->
					<div id="Middle_East_div" style="display : inline-block; width: 570px; margin-left: 40px; position: relative; top: -358px; display:none;">
					
						<div class="city_tag" id="citySelect_93" data-arrival="DXB">두바이</div>
						<div class="city_tag" id="citySelect_94" data-arrival="AUH">아부다비</div>
						<div class="city_tag" id="citySelect_95" data-arrival="DOH">도하</div>
						
						<div class="city_tag" id="citySelect_96" data-arrival="ADD">아디스아바바</div>
						
					</div>
					
				</div>
				
				<div class="select_endBox_close">취소</div>
				
			</div>
		
								<!---------------------------------- 날짜 선택 ---------------------------------->		
								
								
								
		<div class="select_day_div">
						
			<img src="<c:url value='/resources/img/airport/day.png'/>" class="day_img">
			<div class="select_day">
				날짜선택
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
								
		<div class="select_seat_div">
		
			<img src="<c:url value='/resources/img/airport/startTime.png'/>" class="startTime_img">
			<div class="select_seat">
				출발시간
			</div>
			
			
		</div>
		<div class="select_startTimeBox" style="display : none">
				<div style="font-size : 16px;">출발시간 선택</div>
				
				<div style="margin-top: 40px;">
				
					<c:forEach var="i" begin="0" end="23">
						<c:choose>
							<c:when test="${i <= 9}">
								<div class="startTime_tag" data-start="0${i}00">
									<div style="margin-top: 10px;" id="tagTime${i}"=>0${i} : 00</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="startTime_tag" data-start="${i}00">
									<div style="margin-top: 10px;" id="tagTime${i}">${i} : 00</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
				</div>
				<div class="startTimeBox_close">취소</div>
				
		</div>
			
								<!---------------------------------- 종료 시간 선택 ---------------------------------->			
			
			
		<div class="select_seat_div2">
			<img src="<c:url value='/resources/img/airport/endTime.png'/>" class="endTime_img">		
			<div class="select_endTime">
				도착시간
			</div>
		</div>
		
		<div class="select_endTimeBox" style=" display : none">
				<div style="font-size : 16px;">도착시간 선택</div>
				
				<div style="margin-top: 40px;">
					<c:forEach var="i" begin="0" end="23">
						<c:choose>
							<c:when test="${i <= 9}">
								<div class="endTime_tag" data-end="0${i}59">
									<div style="margin-top: 10px;" id="etagTime${i}">0${i} : 59</div>
								</div>	
							</c:when>
							<c:otherwise>
								<div class="endTime_tag" data-end="${i}59">
									<div style="margin-top: 10px;" id="etagTime${i}">${i} : 59</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<div class="endTimeBox_close">취소</div>
			</div>
		
		</div>
								<!---------------------------------- 검색 버튼 ---------------------------------->
										
		<!-- 검색버튼 -->
		<div class="search_div">
			<div class="search_btn">
				<input type="hidden" id="selected-date" name="selectedDate">
				<input type="hidden" id="selected-day" name="selectedDay">
				<input type="hidden" id="departure-city" name="departureCity">
				<input type="hidden" id="arrival-city" name="arrivalCity">
				<input type="hidden" id="selectedDepartureTime" name="departureTime">
    			<input type="hidden" id="selectedArrivalTime" name="arrivalTime">
			
				<input type="submit" value="검색하기" class="submit-btn">
			</div>
		</div>
			
	</div>
	
</div>

<div class="flight-list">
</div>

	<script type="text/javascript">
		/*비행기 운항 스케줄 업데이트*/
		function flightSchUp() {
		    $.ajax({
		        url: "<c:url value='/air/flightSchUp'/>",
		        method: "post",
		        success: function(data) {
		            if (data === "success") {
		                alert("업데이트에 성공했습니다.");
		            } else {
		                alert("업데이트에 실패했습니다.");
		            }
		        },
		        error: function(xhr, status, error) {
		            alert("서버 오류: " + error);
		        }
		    });
		}

	
	
		/*검색*/
		$(".submit-btn").on("click", function() {
			$(".select_startBox").css("display","none");
			$(".select_startTimeBox").css("display","none");
			$(".select_endTimeBox").css("display","none");
			$(".date_selectBox").css("display","none");
			$(".select_endBox").css("display","none");
					
			let selectedDate = $("input[name=selectedDate]");
			let selectedDay = $("input[name=selectedDay]");
			let departureCity = $("input[name=departureCity]");
			let arrivalCity = $("input[name=arrivalCity]");
			let departureTime = $("input[name=departureTime]");
			let arrivalTime = $("input[name=arrivalTime]");
			
			if(selectedDate.val().trim() == "" && selectedDay.val().trim() == "") {
				alert("날짜를 선택하세요");
				selectedDate.focus();
				return;
			}
			if(departureCity.val().trim() == "") {
				alert("출발지를 선택하세요");
				departureCity.focus;
				return;
			}
			if(arrivalCity.val().trim() == "") {
				alert("목적지를 선택하세요");
				arrivalCity.focus;
				return;
			}
			if(departureTime.val().trim() == "") {
				alert("출발 시간을 선택하세요");
				departureTime.focus;
				return;
			}
			if(arrivalTime.val().trim() == "") {
				alert("도착 시간을 선택하세요");
				arrivalTime.focus;
				return;
			}
			
			$.ajax({
				url: "<c:url value='/air/flight-schedule'/>",
				method: "POST",
				data: {
					"selectedDate": selectedDate.val().trim(),
					"selectedDay": selectedDay.val().trim(),
					"departureCity": departureCity.val().trim(),
					"arrivalCity": arrivalCity.val().trim(),
					"departureTime": departureTime.val().trim(),
					"arrivalTime": arrivalTime.val().trim()
				},
				success: function(data) {
					if(data.result == "success"){
						console.log("결과 출력");
						let element = "";
						let list = data.data;
						let icnList = data.data;
						let context ="<%=request.getContextPath()%>";
						
						if(data.type == "icn"){
							for(let i = 0; i < icnList.length; i++){
								if(icnList[i]['io'] == "OUT"){
									//출발
									element += "<div class='departure-list-row'>";
									element += "<div class='flight-name'>";
									element += "<img onerror='this.onerror=null; this.src="+context+"/resources/logo/logo_flight.png;' src='"+context+"/resources/logo/logo_"+ icnList[i]["airline"] +".png'> <br>";
									element += icnList[i]['airline'] + "<br>" + icnList[i]['flightId'] + "</div>";
									element += "<div class='flight-route'>"; 
									element += "<div class='route'>";
									element += "<div class='route-departure'>" + icnList[i]['departureAirport'] +" <br> " + icnList[i]['departureAirportCode'] + "</div>";
									element += "<div class='line'></div>";
									element += "<div class='route-arrival'>"+ icnList[i]['arrivalAirport'] + " <br> " + icnList[i]['arrivalAirportCode'] + "</div>";
									element += "</div>";
									element += "<div class='flight-time'><span>출발 " + icnList[i]['edt'].slice(8, 10) + ":" + icnList[i]['edt'].slice(10) + "</span><span></span>	</div>";
									element += "</div>";
									element += "<div class='flight-info'>터미널 <span>" + icnList[i]['terminal'] + "</span><br>체크인 <span>" + icnList[i]['chkinRange'] + "</span> <br>게이트 <span>" + icnList[i]['gate'] + "</span> <br></div>";							
									element += "</div>";
									element += "</div>";
								}
								else if(icnList[i]['io'] == "IN"){
									//도착
									element += "<div class='arrival-list-row'>";
									element += "<div class='flight-name'>";
									element += "<img onerror='this.onerror=null; this.src="+context+"/resources/logo/logo_flight.png;' src='"+context+"/resources/logo/logo_"+ icnList[i]["airline"] +".png'> <br>";
									element += icnList[i]['airline'] + "<br>" + icnList[i]['flightId'] + "</div>";
									element += "<div class='flight-route'>"; 
									element += "<div class='route'>";
									element += "<div class='route-departure'>" + icnList[i]['departureAirport'] +" <br> " + icnList[i]['departureAirportCode'] + "</div>";
									element += "<div class='line'></div>";
									element += "<div class='route-arrival'>"+ icnList[i]['arrivalAirport'] + " <br> " + icnList[i]['arrivalAirportCode'] + "</div>";
									element += "</div>";
									element += "<div class='flight-time'><span></span><span>도착 " + icnList[i]['edt'].slice(8, 10) + ":" + icnList[i]['edt'].slice(10) + "</span>	</div>";
									element += "</div>";
									element += "<div class='flight-info'>터미널 <span>" + icnList[i]['terminal'] + "</span><br>수하물 <span>" + icnList[i]['carousel'] + "</span> <br>입국장 <span>" + icnList[i]['exitNum'] + "</span> <br></div>";							
									element += "</div>";
									element += "</div>";
								}
								
							}
						}
						else {
							for(let i = 0; i < list.length; i++){
								element += "<div class='flight-list-row'>";
								element += "<div class='flight-name'>";
								element += "<img onerror='this.onerror=null; this.src="+context+"/resources/logo/logo_flight.png;' src='"+context+"/resources/logo/logo_"+ list[i]["airlineKor"] +".png'> <br>";
								element += list[i]['airlineKor'] + "<br>" + list[i]['flightNum'] + "</div>";
								element += "<div class='flight-route'>"; 
								element += "<div class='route'>";
								console.log(list[i]);
								if(list[i]['domestic'] == 1){
									//국내선
									element += "<div class='route-departure'>" + list[i]['startCity'] +" <br> " + list[i]['startCityCode'] + "</div>";
									element += "<div class='line'></div>";
									element += "<div class='route-arrival'>"+ list[i]['arrivalCity'] + " <br> " + list[i]['arrivalCityCode'] + "</div>";
									element += "</div>";
									element += "<div class='flight-time'><span>출발 " + list[i]['startTime'].slice(0, 2) + ":" + list[i]['startTime'].slice(2) + "</span><span>도착 " + list[i]['arrivalTime'].slice(0, 2) + ":" + list[i]['arrivalTime'].slice(2) + "</span>	</div>";
								}
								else{
									//국제선
									if(list[i]['ioType'] == "IN"){
										//입국
										element += "<div class='route-departure'>" + list[i]['city'] +" <br> " + list[i]['cityCode'] + "</div>";
										element += "<div class='line'></div>";
										element += "<div class='route-arrival'>"+ list[i]['airport'] + " <br> " + list[i]['airportCode'] + "</div>";
										element += "</div>";
										element += "<div class='flight-time'><span></span><span>도착 " + list[i]['schTime'].slice(0, 2) + ":" + list[i]['schTime'].slice(2) + "</span>	</div>";
									}
									else{
										//출국
										element += "<div class='route-departure'>" + list[i]['airport'] +" <br> " + list[i]['airportCode'] + "</div>";
										element += "<div class='line'></div>";
										element += "<div class='route-arrival'>"+ list[i]['city'] + " <br> " + list[i]['cityCode'] + "</div>";
										element += "</div>";
										element += "<div class='flight-time'><span>출발 " + list[i]['schTime'].slice(0, 2) + ":" + list[i]['schTime'].slice(2) + "</span><span></span>	</div>";
									}
								}
								element += "</div>";
								element += "<div class='flight-info'></div>";							
								element += "</div>";
								element += "</div>";
							}
						}
						
						$(".flight-list").html(element);
					} else {
						$(".flight-list").html("<div style='font-size:22px; width:70%; padding:0px 10px; margin:auto;'>항공편 정보를 찾을 수 없습니다. <i class='fa-regular fa-face-sad-cry'></i></div>");
		            }
				}
			});
		});
	</script>

</body>


</html>