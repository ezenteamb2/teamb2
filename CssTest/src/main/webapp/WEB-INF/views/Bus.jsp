<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 자바스크립트 -->
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.7.1.min.js"></script> 

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bus.css">


<%@ include file="/include/header.jsp" %>

<%@ include file="/include/ChatBot.jsp" %>
<!-- 전체 div -->
<div class="reservation_div">
		
		
								<!---------------------------------- 태그 ---------------------------------->

	
	<div class="reservation_sibling">
	

										<!---------------------------------- 출발지 선택 ---------------------------------->	
		<!-- 출발지 선택 div -->
		<div class="select_startDiv">

			<img src="<%=request.getContextPath() %>/resources/img/airport/map.png" class="start_img">
			<img src="<%=request.getContextPath() %>/resources/img/airport/search.png" class="start_search_img">
			
			<div class="airport">From airport</div>

			<div class="start_result" id="start_result">
				From airport
			</div>
			<input type="hidden" id="hiddenStartResult" name="hiddenStartResult">
		</div>
		<div class="select_startBox" style="display : none">
				<div style="font-size : 16px;">From airport</div>
				
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
		
										<!---------------------------------- 목적지 선택 ---------------------------------->		

		<div class="select_people_div">
			
			<img src="<%=request.getContextPath() %>/resources/img/airport/map.png" class="end_img">
			<img src="<%=request.getContextPath() %>/resources/img/airport/search.png" class="end_search_img">
			<div class="location">To city</div>
			<div class="select_people" id="select_people">
				To city
			</div>
			<input type="hidden" id="hiddenSelectPeople" name="hiddenSelectPeople">
		</div>
		
		<div class="select_endBox" style="display : none">
			
				<div style="font-size : 16px; margin-bottom : 20px;">To city</div>
				
				<div class="city_container">
					<!-- 나라 -->
					<div style="width: 170px; height: 410px; border-right: 1px solid #d0d0d0; display : inline-block;">
						<diV class="country_tag" id="Southeast_Asia_tag" style="border : 1px solid #4B73E1; background : #f3f6fd;">수도권</div>
						<diV class="country_tag" id="japan_tag">강원</div>
						<diV class="country_tag" id="china_tag">충청</div>
						<diV class="country_tag" id="europe_tag">경상</div>
						<diV class="country_tag" id="Americas_tag">전라</div>
						<diV class="country_tag" id="Oceania_tag">제주</div>
<!-- 					<diV class="country_tag" id="Middle_East_tag" style="visibility:hidden;">중동/아프리카</div> -->
					</div>
					
					<!-- 수도권 -->
					<div id="Southeast_Asia_div" style="display : inline-block; width: 570px; margin-left: 198px; position: relative; top: -436px;">
					
						<div class="city_tag" id="citySelect_1">서울</div>
						<div class="city_tag" id="citySelect_2">경기</div>
						<div class="city_tag" id="citySelect_3">인천</div>

					</div>
					
					<!-- 강원 -->
					<div id="japan_div" style="display : inline-block; width: 570px; margin-left: 198px; position: relative; top: -436px; display:none;">
					
						<div class="city_tag" id="citySelect_21">가평</div>
						<div class="city_tag" id="citySelect_22">강릉</div>
						<div class="city_tag" id="citySelect_23">동해</div>
						
						<div class="city_tag" id="citySelect_24">문막</div>
						<div class="city_tag" id="citySelect_25">삼척</div>
						<div class="city_tag" id="citySelect_26">속초</div>
					
						<div class="city_tag" id="citySelect_27">원주</div>
						<div class="city_tag" id="citySelect_28">양양</div>
						<div class="city_tag" id="citySelect_29">청평</div>
						
						<div class="city_tag" id="citySelect_30">춘천</div>
						
						
					</div>
					
					<!-- 충청 -->
					<div id="china_div" style="display : inline-block; width: 570px; margin-left: 198px; position: relative; top: -436px; display:none;">
					
						<div class="city_tag" id="citySelect_34">계룡</div>
						<div class="city_tag" id="citySelect_35">공주</div>
						<div class="city_tag" id="citySelect_36">기지시</div>
						
						<div class="city_tag" id="citySelect_37">남선</div>
						<div class="city_tag" id="citySelect_38">내포시</div>
						<div class="city_tag" id="citySelect_39">논산</div>
						
						<div class="city_tag" id="citySelect_40">당진</div>
						<div class="city_tag" id="citySelect_41">대전</div>
						<div class="city_tag" id="citySelect_42">보령</div>
						
						<div class="city_tag" id="citySelect_43">서산</div>
						<div class="city_tag" id="citySelect_44">세종</div>
						<div class="city_tag" id="citySelect_45">아산 </div>
	
						<div class="city_tag" id="citySelect_48">엄사</div>
						<div class="city_tag" id="citySelect_49">온양</div>
						<div class="city_tag" id="citySelect_50">유성</div>
						
						<div class="city_tag" id="citySelect_51">증평</div>
						<div class="city_tag" id="citySelect_52">천안</div>
						<div class="city_tag" id="citySelect_53">청주</div>
						
						<div class="city_tag" id="citySelect_54">충주</div>
						<div class="city_tag" id="citySelect_55">태안</div>
						<div class="city_tag" id="citySelect_56">홍성</div>
						
					</div>
					
					<!-- 경상 -->
					<div id="europe_div" style="display : inline-block; width: 570px; margin-left: 198px; position: relative; top: -436px; display:none;">
					
						<div class="city_tag" id="citySelect_57">고현</div>
						<div class="city_tag" id="citySelect_58">거제</div>
						<div class="city_tag" id="citySelect_59">경북도청</div>
						
						<div class="city_tag" id="citySelect_60">경산</div>
						<div class="city_tag" id="citySelect_61">경주</div>
						<div class="city_tag" id="citySelect_62">구미</div>
						
						<div class="city_tag" id="citySelect_63">대구</div>
						<div class="city_tag" id="citySelect_64">마산</div>
						<div class="city_tag" id="citySelect_65">부산</div>
						
						<div class="city_tag" id="citySelect_66">상주</div>
						<div class="city_tag" id="citySelect_67">신복</div>
						<div class="city_tag" id="citySelect_68">안동</div>
						
						<div class="city_tag" id="citySelect_69">영주</div>
						<div class="city_tag" id="citySelect_70">예천</div>
						<div class="city_tag" id="citySelect_71">울산</div>
						
						<div class="city_tag" id="citySelect_72">장유</div>
						<div class="city_tag" id="citySelect_73">진주</div>
						<div class="city_tag" id="citySelect_74">진해</div>
					    
					    <div class="city_tag" id="citySelect_75">창원</div>
						<div class="city_tag" id="citySelect_76">통영</div>
						<div class="city_tag" id="citySelect_77">포항</div>
						

						
					</div>
					
					<!-- 전라 -->
					<div id="Americas_div" style="display : inline-block; width: 570px; margin-left: 198px; position: relative; top: -436px; display:none;">
					
						<div class="city_tag" id="citySelect_78">광양</div>
						<div class="city_tag" id="citySelect_79">광주</div>
						<div class="city_tag" id="citySelect_80">군산</div>
					
						<div class="city_tag" id="citySelect_81">김제</div>
						<div class="city_tag" id="citySelect_82">대야</div>
						<div class="city_tag" id="citySelect_83">목포</div>
						
						<div class="city_tag" id="citySelect_84">순천</div>
						<div class="city_tag" id="citySelect_85">여수</div>
						<div class="city_tag" id="citySelect_86">영광</div>
						
						<div class="city_tag" id="citySelect_87">익산</div>
						<div class="city_tag" id="citySelect_88">임실</div>
						<div class="city_tag" id="citySelect_89">정읍</div>
						
						<div class="city_tag" id="citySelect_90">전주</div>
		
						
					</div>
					
					<!-- 제주 -->
					<div id="Oceania_div" style="display : inline-block; width: 570px; margin-left: 198px; position: relative; top: -436px; display:none;">
					
						<div class="city_tag" id="citySelect_91">제주</div>
						
					</div> 
	
				</div>  <!-- div class="city_container" -->
				
				<div class="select_endBox_close" 
					 style="text-align: right; margin-right: 10px;">취소</div>
				
			</div>
		

		<!---------------------------------- 검색 버튼 ---------------------------------->
										
		<!-- 검색버튼 -->
		<div class="search_div">
			<div class="search_btn" id="search_btn">
				Search
			</div>
		</div>

	</div>
	
</div>

	<!-------------------------------- category 시작---------------------------- -->
  
  
	<div class="category">
	
		<div class="tab-content" id="myTabContent">
			<!---------------------공항버스 ------------------>
      
        <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
            
            <div class="table_container">
	            <table class="table caption-top" style="width:75%;">
	                <caption>
	                	
	                </caption>
	                <thead>
	                  <tr>	                   
	                    <th scope="col" class="small-cell">출발지(공항)</th>
	                    <th scope="col" class="middle-cell">도착지/버스번호</th>
	                    <th scope="col" class="small-cell">버스등급</th>
	                    <th scope="col" class="large-cell">노선정보</th>
	                    <th scope="col" class="large-cell">공항발 시간표</th>
	                    <th scope="col" class="small-cell">버스요금</th>  
	                    <th scope="col" class="middle-cell">운수사</th> 
	                  </tr>
	                </thead>
	                <tbody class="tbody">
	                	<!-- ajax 영역  -->
					</tbody>
	             </table>
	             <div id="scrollDetector" style="height:20px;"></div>
             </div><!-- <div class="table_container"> -->         
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


let count = 0; // 페이지 번호 초기값
let loading = false; // 데이터 요청 중복 방지를 위한 변수

// 검색 버튼 클릭 이벤트 리스너
document.getElementById('search_btn').addEventListener('click', function(){
    count = 0; // 검색할 때마다 페이지 번호 초기화
    loading = false; // 검색할 때마다 로딩 상태 초기화
    document.querySelector('.tbody').innerHTML = ''; // 기존 데이터 초기화
    fetchMoreData(); // 첫 번째 데이터 요청
});

// Intersection Observer를 사용하여 감지할 대상 설정
const observer = new IntersectionObserver((entries) => {
    // entries는 관찰 대상에 대한 배열을 포함합니다.
    entries.forEach(entry => {
        if (entry.isIntersecting && !loading && count > 0) {
            // 감지 요소가 뷰포트에 들어오고 있고, 데이터 로딩 중이 아닐 때
            loading = true; // 데이터 로딩 중으로 설정
            fetchMoreData(); // 추가 데이터 요청
        }
    });
}, /* {
root: null, // 뷰포트를 루트로 설정
rootMargin: '0px',
threshold: 1.0 // 대상 요소가 100% 보여질 때 콜백 호출
} */);

var contextPath = '<%= request.getContextPath() %>';

// 감지할 <div> 태그를 지정하여 Observer 시작
observer.observe(document.getElementById('scrollDetector'));

function fetchMoreData() {
	
	console.log("Current page count (before AJAX request):", count);
	
    var FromCity = document.getElementById('select_people').innerText; 
    var ToAirport = document.getElementById('start_result').innerText;
	//alert(count);
    $.ajax({
        url: "<c:url value='/airbus/bus.do'/>",
        method: "POST",
        data: {
            "city": FromCity,
            "airport": ToAirport,
            "pageno": count
        },
        success: function(data) {
            if (data.result == "success") {
                let element = "";
                data.data.forEach(function(item) {
                    element += '<tr>';
                    element += '<td class="small-cell">' + item.airportName + '</td>';
                    element += '<td class="small-cell">' + item.busNum + '</td>';
                    element += '<td class="middle-cell"><div class="large" style="overflow: auto; height: 70px;">' + item.busclass + '</div></td>';
                    element += '<td class="large-cell"><div class="large" style="overflow: auto; height: 70px;">' + item.routeinfo + '</div></td>';
                    element += '<td class="large-cell"><div class="large" style="overflow: auto; height: 70px;">' + item.t1wdayt + '</div></td>';
                    element += '<td class="small-cell"><div class="large" style="overflow: auto; height: 70px;">' + item.fare + '</div></td>';
                    element += '<td class="middle-cell"><div class="large" style="overflow: auto; height: 70px;">' + item.cpname + '</div></td>';
                    element += '</tr>';
                });

                // 데이터를 테이블에 추가
                if(count != 0){
                    document.querySelector('.tbody').insertAdjacentHTML('beforeend', element);
                }else{
                    document.querySelector('.tbody').innerHTML= element;
                }
                
                console.log("데이터 추가 성공");
                count++; // 다음 페이지 요청을 위해 페이지 번호 증가
            
            } else {
                console.log("더 이상 데이터를 불러올 수 없습니다.");
                if(count > 0){
                	console.log("데이터가 조회가 끝났어요");
                }else{
                	console.log("데이터가 하나도 없어요"); 
                	let noDataVideo = '<tr><td colspan="7" style="text-align:center; width: 100%;"><video src="' + contextPath + '/resources/video/sorry.mp4" autoplay muted loop></video></td></tr>';
                    document.querySelector('.tbody').innerHTML = noDataVideo;
                }
            }
            loading = false; // 데이터 로딩 완료
        },
        error: function() {
            console.log("데이터 요청 실패");
            loading = false; // 데이터 로딩 완료
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
	
	$("#citySelect_91").on("click",function(){
		$(".select_people").text($("#citySelect_91").text());
		$(".select_endBox").css("display","none");
	})
	});
});
	
</script>
</body>
</html>