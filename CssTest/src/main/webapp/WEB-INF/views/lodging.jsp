<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/include/header.jsp" %>

<!-- 자바스크립트 -->
<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>

<link rel="stylesheet" href="<c:url value='/resources/css/lodging.css'/>"> <!-- css --> 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script>

	$(function(){
		
		$("#lodging_tag1").on("click",function(){
			
			$("#lodging_tag1").css({"z-index":"2","background":"#65728a","color":"white"});
			
			$("#lodging_tag2").css({"z-index":"1","background":"white","color":"black"});
			$("#lodging_tag3").css({"z-index":"1","background":"white","color":"black"});
			$("#lodging_tag4").css({"z-index":"1","background":"white","color":"black"});
			
		})
		
		
		$("#lodging_tag2").on("click",function(){
			
			$("#lodging_tag2").css({"z-index":"2","background":"#65728a","color":"white"});
			
			$("#lodging_tag1").css({"z-index":"1","background":"white","color":"black"});
			$("#lodging_tag3").css({"z-index":"1","background":"white","color":"black"});
			$("#lodging_tag4").css({"z-index":"1","background":"white","color":"black"});
			
		})
		
		
		$("#lodging_tag3").on("click",function(){
			
			$("#lodging_tag3").css({"z-index":"2","background":"#65728a","color":"white"});
			
			$("#lodging_tag1").css({"z-index":"1","background":"white","color":"black"});
			$("#lodging_tag2").css({"z-index":"1","background":"white","color":"black"});
			$("#lodging_tag4").css({"z-index":"1","background":"white","color":"black"});
			
		})
		
		
		$("#lodging_tag4").on("click",function(){
			
			$("#lodging_tag4").css({"z-index":"2","background":"#65728a","color":"white"});
			
			$("#lodging_tag1").css({"z-index":"1","background":"white","color":"black"});
			$("#lodging_tag2").css({"z-index":"1","background":"white","color":"black"});
			$("#lodging_tag3").css({"z-index":"1","background":"white","color":"black"});
			
		})
		
	})

</script>

<body>
<%@ include file="/include/ChatBot.jsp" %>
	<div class="lodging_div">
		
		<div style="font-size: 25px;">
			공항근처 숙소찾기
		</div>
		
		<div style="margin-top: 80px; margin-bottom: -4px; position: relative; right: 290px; display: inline-block;">
			<div class="airport_tag" id="lodging_tag1" style="z-index: 2; background: #65728a; color:white;">
				인천
			</div>
		
			<div class="airport_tag" id="lodging_tag2">
				김해
			</div>
		
			<div class="airport_tag" id="lodging_tag3">
				김포
			</div>
		
			<div class="airport_tag" id="lodging_tag4">
				제주
			</div>
		</div>
		
		<div class="map_border">
		
		</div>
		
		<div class="lodging_MapDiv">
			
			<div id="map" style="width: 1090px; height: 1200px; object-fit : cover;"></div>
			
			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<div>
						<form onsubmit="searchPlaces(); return false;" style="font-size: 15px; height: 50px;">
							키워드 : <input type="text" value="인천국제공항" id="keyword" size="15" style="border-radius: 4px; font-family: 'TheJamsil5Bold';">
							<button type="submit" style="position: relative; top: 5px; margin-top: 10px;">
								<img class="search_img" src="<c:url value='/resources/img/lodging_img/search.png'/>"> 
							</button>
						</form>
					</div>
				</div>
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b25d5ee8ce07ea0a73a615ee53a63dbd&libraries=services"></script>
				
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			  	mapOption = {
			       	center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 6 // 지도의 확대 레벨
			    };  
					
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
					
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				var mapTypeControl = new kakao.maps.MapTypeControl();

				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
				
				
				var imageSrc = '<c:url value="/resources/img/lodging_img/sleep.png"/>', // 마커이미지의 주소입니다 
			    imageSize = new kakao.maps.Size(50, 50), // 마커이미지의 크기입니다
			    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			      
				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
			    
			    /*  지도 검색/목록   */
				
			    var markers = [];
				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places();  

				// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({zIndex:1});

				// 키워드로 장소를 검색합니다
				searchPlaces();

				// 키워드 검색을 요청하는 함수입니다
				function searchPlaces() {

				    var keyword = document.getElementById('keyword').value;

				    if (!keyword.replace(/^\s+|\s+$/g, '')) {
				        alert('키워드를 입력해주세요!');
				        return false;
				    }

				    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
				    ps.keywordSearch( keyword, placesSearchCB); 
				}

				// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
				function placesSearchCB(data, status, pagination) {
				    if (status === kakao.maps.services.Status.OK) {

				        // 정상적으로 검색이 완료됐으면
				        // 검색 목록과 마커를 표출합니다
				        displayPlaces(data);

				        // 페이지 번호를 표출합니다
				        displayPagination(pagination);

				    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				        alert('검색 결과가 존재하지 않습니다.');
				        return;

				    } else if (status === kakao.maps.services.Status.ERROR) {

				        alert('검색 결과 중 오류가 발생했습니다.');
				        return;

				    }
				}

				// 검색 결과 목록과 마커를 표출하는 함수입니다
				function displayPlaces(places) {

				    var listEl = document.getElementById('placesList'), 
				    menuEl = document.getElementById('menu_wrap'),
				    fragment = document.createDocumentFragment(), 
				    bounds = new kakao.maps.LatLngBounds(), 
				    listStr = '';
				    
				    // 검색 결과 목록에 추가된 항목들을 제거합니다
				    removeAllChildNods(listEl);

				    // 지도에 표시되고 있는 마커를 제거합니다
				    removeMarker();
				    
				    for ( var i=0; i<places.length; i++ ) {

				        // 마커를 생성하고 지도에 표시합니다
				        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
				            marker = addMarker(placePosition, i), 
				            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				        // LatLngBounds 객체에 좌표를 추가합니다
				        bounds.extend(placePosition);

				        // 마커와 검색결과 항목에 mouseover 했을때
				        // 해당 장소에 인포윈도우에 장소명을 표시합니다
				        // mouseout 했을 때는 인포윈도우를 닫습니다
				        (function(marker, title) {
				            kakao.maps.event.addListener(marker, 'mouseover', function() {
				                displayInfowindow(marker, title);
				            });

				            kakao.maps.event.addListener(marker, 'mouseout', function() {
				                infowindow.close();
				            });

				            itemEl.onmouseover =  function () {
				                displayInfowindow(marker, title);
				            };

				            itemEl.onmouseout =  function () {
				                infowindow.close();
				            };
				        })(marker, places[i].place_name);

				        fragment.appendChild(itemEl);
				    }

				    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
				    listEl.appendChild(fragment);
				    menuEl.scrollTop = 0;

				    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				    map.setBounds(bounds);
				}

				// 검색결과 항목을 Element로 반환하는 함수입니다
				function getListItem(index, places) {

				    var el = document.createElement('li'),
				    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
				                '<div class="info">' +
				                '   <h5>' + places.place_name + '</h5>';

				    if (places.road_address_name) {
				        itemStr += '    <span>' + places.road_address_name + '</span>' +
				                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
				    } else {
				        itemStr += '    <span>' +  places.address_name  + '</span>'; 
				    }
				                 
				      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
				                '</div>';           

				    el.innerHTML = itemStr;
				    el.className = 'item';

				    return el;
				}

				// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
				function addMarker(position, idx, title) {
				    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
				        imgOptions =  {
				            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
				        },
				        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
				            marker = new kakao.maps.Marker({
				            position: position, // 마커의 위치
				            image: markerImage 
				        });

				    marker.setMap(map); // 지도 위에 마커를 표출합니다
				    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

				    return marker;
				}

				// 지도 위에 표시되고 있는 마커를 모두 제거합니다
				function removeMarker() {
				    for ( var i = 0; i < markers.length; i++ ) {
				        markers[i].setMap(null);
				    }   
				    markers = [];
				}

				// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
				function displayPagination(pagination) {
				    var paginationEl = document.getElementById('pagination'),
				        fragment = document.createDocumentFragment(),
				        i; 

				    // 기존에 추가된 페이지번호를 삭제합니다
				    while (paginationEl.hasChildNodes()) {
				        paginationEl.removeChild (paginationEl.lastChild);
				    }

				    for (i=1; i<=pagination.last; i++) {
				        var el = document.createElement('a');
				        el.href = "#";
				        el.innerHTML = i;

				        if (i===pagination.current) {
				            el.className = 'on';
				        } else {
				            el.onclick = (function(i) {
				                return function() {
				                    pagination.gotoPage(i);
				                }
				            })(i);
				        }

				        fragment.appendChild(el);
				    }
				    paginationEl.appendChild(fragment);
				}

				// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
				// 인포윈도우에 장소명을 표시합니다
				function displayInfowindow(marker, title) {
				    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

				    infowindow.setContent(content);
				    infowindow.open(map, marker);
				}

				 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
				function removeAllChildNods(el) {   
				    while (el.hasChildNodes()) {
				        el.removeChild (el.lastChild);
				    }
				}
			    
			    
				
			    
			    
				/* --------------------------------------- 기본 마커 띄우기  ------------------------------------------ */
				
				var positions = [
    				{ title: '워커힐 인천공항 환승호텔', latlng: new kakao.maps.LatLng(37.469466, 126.433009) },
   					{ title: '이비스 스타일 앰배서더 인천 에어포트', latlng: new kakao.maps.LatLng(37.481049, 126.420169) },
    				{ title: '호텔 오라', latlng: new kakao.maps.LatLng(37.454018, 126.417971) },
    				{ title: '환승호텔(T1 동편)', latlng: new kakao.maps.LatLng(37.450875, 126.454125) },
    				{ title: '그랜드 하얏트 인천', latlng: new kakao.maps.LatLng(37.440444, 126.457451) },
    				{ title: '아트 파라디소 호텔', latlng: new kakao.maps.LatLng(37.436877, 126.457838) },
    				{ title: '베스트 웨스턴 프리미어', latlng: new kakao.maps.LatLng(37.438616, 126.459600) },
    				{ title: '스카이게스텔1', latlng: new kakao.maps.LatLng(37.438880, 126.461038) },
    				{ title: '디 에어텔', latlng: new kakao.maps.LatLng(37.438874, 126.462985) },
    				{ title: '네스트 호텔', latlng: new kakao.maps.LatLng(37.424929, 126.428074) },
    				
    				{ title: '호텔 파크우드', latlng: new kakao.maps.LatLng(37.426144, 126.421800) },
    				{ title: '오션사이드호텔', latlng: new kakao.maps.LatLng(37.426475, 126.421201) },
    				{ title: '호텔 휴 로프트', latlng: new kakao.maps.LatLng(37.425911, 126.420623) },
    				{ title: '인스파이어 엔터테인먼트 리조트', latlng: new kakao.maps.LatLng(37.466410, 126.386531) },
    				{ title: '어느멋진날에2', latlng: new kakao.maps.LatLng(37.450331, 126.401025) },
    				{ title: '제이에스하우스', latlng: new kakao.maps.LatLng(37.450008, 126.393087) },
    				{ title: '인천프린스호텔', latlng: new kakao.maps.LatLng(37.449738, 126.389310) },
    				{ title: '인천 을왕리 바다&별 하우스 펜션', latlng: new kakao.maps.LatLng(37.458590, 126.377798) },
    				{ title: '자니노니펜션', latlng: new kakao.maps.LatLng(37.457979, 126.373047) },
    				{ title: '킹스테이', latlng: new kakao.maps.LatLng(37.456975, 126.368617) },
    				
    				{ title: '브라운도트호텔 인천을왕리점', latlng: new kakao.maps.LatLng(37.461179, 126.372324) },
    				{ title: '별빛바다펜션', latlng: new kakao.maps.LatLng(37.462552, 126.372954) },
    				{ title: '씨월드관광호텔', latlng: new kakao.maps.LatLng(37.464411, 126.369169) },
    				{ title: '왕산예림펜션', latlng: new kakao.maps.LatLng(37.462213, 126.369377) },
    				{ title: '위너스관광호텔', latlng: new kakao.maps.LatLng(37.461218, 126.368664) },
    				{ title: '당나귀펜션', latlng: new kakao.maps.LatLng(37.462156, 126.368465) },
    				{ title: '화이트팬션', latlng: new kakao.maps.LatLng(37.462482, 126.367927) },
    				{ title: '저맨팬션', latlng: new kakao.maps.LatLng(37.461862, 126.367413) },
    				{ title: '스윗트리펜션', latlng: new kakao.maps.LatLng(37.463287, 126.366871) },
    				{ title: '해처럼펜션', latlng: new kakao.maps.LatLng(37.463242, 126.366614) },
    				
    				{ title: '푸른솔펜션', latlng: new kakao.maps.LatLng(37.462582, 126.366110) },
    				{ title: '에버뷰펜션', latlng: new kakao.maps.LatLng(37.449817, 126.375023) },
    				{ title: '비치힐뷰펜션', latlng: new kakao.maps.LatLng(37.449451, 126.374674) },
    				{ title: '을왕리 스위스파크', latlng: new kakao.maps.LatLng(37.449155, 126.372501) },
    				{ title: '더프린스호텔', latlng: new kakao.maps.LatLng(37.449470, 126.371491) },
    				{ title: '관광호텔레이', latlng: new kakao.maps.LatLng(37.449518, 126.371837) },
    				{ title: '블루프로그 호텔', latlng: new kakao.maps.LatLng(37.449545, 126.372050) },
    				{ title: '발리모텔', latlng: new kakao.maps.LatLng(37.449654, 126.372312) },
    				{ title: '더 위크앤 리조트', latlng: new kakao.maps.LatLng(37.450364, 126.370942) },
    				{ title: '인천비치관광호텔', latlng: new kakao.maps.LatLng(37.450988, 126.371826) },
    				
    				{ title: '델로스 호텔', latlng: new kakao.maps.LatLng(37.450615, 126.372354) },
    				{ title: '하루가달고나', latlng: new kakao.maps.LatLng(37.447655, 126.376296) },
    				{ title: '마린캠프펜션', latlng: new kakao.maps.LatLng(37.446706, 126.376856) },
    				{ title: '연화문', latlng: new kakao.maps.LatLng(37.446315, 126.376338) },
    				{ title: '제이든29 펜션', latlng: new kakao.maps.LatLng(37.446298, 126.376966) },
    				{ title: '롱비치하우스', latlng: new kakao.maps.LatLng(37.446136, 126.377261) },
    				{ title: '바이드302펜션', latlng: new kakao.maps.LatLng(37.445914, 126.376714) },
    				{ title: '아소프로아 펜션', latlng: new kakao.maps.LatLng(37.445968, 126.377514) },
    				{ title: '대명펜션', latlng: new kakao.maps.LatLng(37.445781, 126.377501) },
    				{ title: '엔소이펜션', latlng: new kakao.maps.LatLng(37.446046, 126.377892) },
    				
    				{ title: '더 레스트 관광호텔', latlng: new kakao.maps.LatLng(37.443966, 126.377257) },
    				{ title: '제이앤파크 호텔', latlng: new kakao.maps.LatLng(37.444785, 126.378819) },
    				{ title: '제이앤파크 호텔', latlng: new kakao.maps.LatLng(37.444930, 126.379517) },
    				{ title: '인천을왕리휴', latlng: new kakao.maps.LatLng(37.443370, 126.378478) },
    				{ title: '허브 게스트하우스', latlng: new kakao.maps.LatLng(37.501389, 126.488305) },
    				{ title: '레인부츠게스트하우스', latlng: new kakao.maps.LatLng(37.494922, 126.497145) },
    				{ title: '인천공항 코인게스트하우스', latlng: new kakao.maps.LatLng(37.496740, 126.501259) },
    				{ title: '영종샤인호텔', latlng: new kakao.maps.LatLng(37.491363, 126.500761) },
    				{ title: '영종샤인호텔', latlng: new kakao.maps.LatLng(37.491080, 126.500643) },
    				{ title: '지엘시티호텔', latlng: new kakao.maps.LatLng(37.490655, 126.499464) },
    				
    				{ title: '미스터김 게스트하우스', latlng: new kakao.maps.LatLng(37.489293, 126.495435) },
    				{ title: '트리하우스 운서', latlng: new kakao.maps.LatLng(37.489404, 126.493176) },
    				{ title: '인천공항 게스트하우스 킹', latlng: new kakao.maps.LatLng(37.489116, 126.493036) },
    				{ title: '인천공항 게스트하우스 해피플레이스', latlng: new kakao.maps.LatLng(37.496428, 126.489915) },
    				{ title: '인천공항호텔', latlng: new kakao.maps.LatLng(37.494443, 126.489104) },
    				{ title: '에어릴렉스호텔', latlng: new kakao.maps.LatLng(37.494550, 126.489448) },
    				{ title: '인천공항 호텔 에어스테이', latlng: new kakao.maps.LatLng(37.494570, 126.489687) },
    				{ title: '영종호텔', latlng: new kakao.maps.LatLng(37.494991, 126.491725) },
    				{ title: '호텔시애틀/모로미 운서점', latlng: new kakao.maps.LatLng(37.494576, 126.491468) },
    				{ title: '호텔퀸', latlng: new kakao.maps.LatLng(37.494597, 126.491733) },
    				
    				{ title: 'DK INCHEON AIRPORT HOTEL', latlng: new kakao.maps.LatLng(37.494086, 126.492185) },
    				{ title: '제우메스호텔', latlng: new kakao.maps.LatLng(37.494493, 126.492868) },
    				{ title: '데이즈 호텔 앤 스위트 인천공항', latlng: new kakao.maps.LatLng(37.493426, 126.491490) },
    				{ title: '하워드 존슨 호텔 인천 에어포트', latlng: new kakao.maps.LatLng(37.493373, 126.491560) },
    				{ title: '호텔투어 인천공항 호텔&스위트', latlng: new kakao.maps.LatLng(37.492177, 126.492439) },
    				{ title: '골든 튤립 인천공항 호텔&스위트', latlng: new kakao.maps.LatLng(37.492269, 126.492432) }
    				
				];
				var i = 0;
				
				/* 오버레이 이미지 */
				var Map_imgSrc = [
					"<c:url value='/resources/img/Incheon_lodging/Incheon1.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon2.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon3.png'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon4.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon5.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon6.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon7.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon8.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon9.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon10.jpg'/>",
					
					"<c:url value='/resources/img/Incheon_lodging/Incheon11.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon12.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon13.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon14.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon15.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon16.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon17.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon18.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon19.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon20.jpg'/>",
					
					"<c:url value='/resources/img/Incheon_lodging/Incheon21.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon22.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon23.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon24.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon25.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon26.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon27.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon28.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon29.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon30.jpg'/>",
					
					"<c:url value='/resources/img/Incheon_lodging/Incheon31.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon32.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon33.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon34.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon35.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon36.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon37.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon38.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon39.jpg'/>",
					"<c:url value='/resources/img/Incheon_lodging/Incheon40.jpg'/>",
					
					"resources/img/Incheon_lodging/Incheon41.jpg",
					"resources/img/Incheon_lodging/Incheon42.jpg",
					"resources/img/Incheon_lodging/Incheon43.jpg",
					"resources/img/Incheon_lodging/Incheon44.jpg",
					"resources/img/Incheon_lodging/Incheon45.jpg",
					"resources/img/Incheon_lodging/Incheon46.jpg",
					"resources/img/Incheon_lodging/Incheon47.jpg",
					"resources/img/Incheon_lodging/Incheon48.jpg",
					"resources/img/Incheon_lodging/Incheon49.jpg",
					"resources/img/Incheon_lodging/Incheon50.jpg",
					
					"resources/img/Incheon_lodging/Incheon51.jpg",
					"resources/img/Incheon_lodging/Incheon52.jpg",
					"resources/img/Incheon_lodging/Incheon53.jpg",
					"resources/img/Incheon_lodging/Incheon54.jpg",
					"resources/img/Incheon_lodging/Incheon55.jpg",
					"resources/img/Incheon_lodging/Incheon56.jpg",
					"resources/img/Incheon_lodging/Incheon57.jpg",
					"resources/img/Incheon_lodging/Incheon58.jpg",
					"resources/img/Incheon_lodging/Incheon59.jpg",
					"resources/img/Incheon_lodging/Incheon60.jpg",
					
					"resources/img/Incheon_lodging/Incheon61.jpg",
					"resources/img/Incheon_lodging/Incheon62.jpg",
					"resources/img/Incheon_lodging/Incheon63.jpg",
					"resources/img/Incheon_lodging/Incheon64.jpg",
					"resources/img/Incheon_lodging/Incheon65.jpg",
					"resources/img/Incheon_lodging/Incheon66.jpg",
					"resources/img/Incheon_lodging/Incheon67.jpg",
					"resources/img/Incheon_lodging/Incheon68.jpg",
					"resources/img/Incheon_lodging/Incheon69.jpg",
					"resources/img/Incheon_lodging/Incheon70.jpg",
					
					"resources/img/Incheon_lodging/Incheon71.jpg",
					"resources/img/Incheon_lodging/Incheon72.jpg",
					"resources/img/Incheon_lodging/Incheon73.jpg",
					"resources/img/Incheon_lodging/Incheon74.jpg",
					"resources/img/Incheon_lodging/Incheon75.jpg",
					"resources/img/Incheon_lodging/Incheon76.jpg",
				];
				
				
				positions.forEach(function(pos) {
					
					 
					
					  /* 커스텀 오버레이 */
					  var customOverlay = new daum.maps.CustomOverlay({
					    position: pos.latlng
					  });
					  
					  /* 오버레이 배경 */
					  var content = document.createElement('div');
					  content.classList.add('Map_Div');
						
					  /* 오버레이 제목 */
					  var info = document.createElement('div');
					  info.appendChild(document.createTextNode(pos.title));
					  info.classList.add('Map_DivTitle');
					  content.appendChild(info);
					  
					  /* 좌표로 주소찾기 */
					  let coord = pos.latlng;
					    let callback = function(result, status) {
					        if (status === kakao.maps.services.Status.OK) {
					          //  console.log(result[0].address.address_name); --- 지번
					          
					           /* 주소 div */
							   var address1 = document.createElement('div');
					  		   address1.classList.add('address_Div');
					  		   address1.appendChild(document.createTextNode(result[0].address.address_name));
					  		   content.appendChild(address1);
					  
					          
					          //  console.log(result[0].road_address.address_name); --- 도로번호
					          
					          /* 도로명 div */
					  		   var road_address1 = document.createElement('div');
					  		   road_address1.classList.add('road_address_Div');
					  		   road_address1.appendChild(document.createTextNode(result[0].road_address.address_name));
					  		   content.appendChild(road_address1);
					          
					        }
					    }
					   geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
					   
					   /* 길 찾기 */
						  var Directions = document.createElement('div');
						  var Dt = document.createElement('a');
						  var latlng1 = pos.latlng
						  var latlng2 = latlng1.toString()
						  var latlng3 = latlng2.replace(/[&\/\#+()$~%:@^*?<>{}]/g, '');
						  var latlng4 = latlng3.trim();
						  
						  Dt.target = '_blank';
						  Dt.href = 'https://map.kakao.com/link/to/'+pos.title+","+latlng4;
						  Dt.innerText = '길찾기';
						  Directions.classList.add('Directions');
						  Directions.appendChild(Dt);
						  content.appendChild(Directions);
					  
					 
					  
					  /* 오버레이 사진 테두리 */
					  var Map_Imgbox = document.createElement('div');
					  Map_Imgbox.classList.add('Map_Imgbox');
					  content.appendChild(Map_Imgbox);
					  
					  /* 오버레이 사진 */
					  var Map_DivImg = document.createElement('img');
					  Map_DivImg.classList.add('Map_DivImg');
					  Map_DivImg.src = Map_imgSrc[i++];
					  Map_DivImg.width = 100;
					  Map_DivImg.height = 100;
					  Map_Imgbox.appendChild(Map_DivImg);

					  /* 오버레이 닫기 버튼 */
					  var closeBtn_img = document.createElement('img');
					  closeBtn_img.classList.add('closeBtn_img')
					  closeBtn_img.src = "resources/img/lodging_img/MapClose.png";
					  closeBtn_img.onclick = function() { customOverlay.setMap(null); };
					  info.appendChild(closeBtn_img);

					  customOverlay.setContent(content);
					  customOverlay.setMap(null);
					  
					  
					  var marker = new kakao.maps.Marker({
						   map: map, // 마커를 표시할 지도
						   position: pos.latlng, // 마커를 표시할 위치
						   title : pos.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						   image : markerImage, // 마커 이미지 
					       clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
					  });
					  
					  /* 다른태그 클릭시 마거삭제 */
					  $(document).on("click", "#lodging_tag2", function(){
							positions.forEach(function(pos) {
								marker.setMap(null)
							});
					  });
					  $(document).on("click", "#lodging_tag3", function(){
							positions.forEach(function(pos) {
								marker.setMap(null)
							});
					  });
					  $(document).on("click", "#lodging_tag4", function(){
							positions.forEach(function(pos) {
								marker.setMap(null)
							});
					  });
					  
					  
					  /* 커스텀 오버레이 띄우기 */
					  kakao.maps.event.addListener(marker, 'click', function() {
						  customOverlay.setMap(map);
					  });
					  
					});
				

				
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(
								'인천 중구 운서동 2840',
								function(result, status) {

									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) {

										var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new kakao.maps.Marker({
											map : map,
											position : coords
										});
										
										
										// 인포윈도우로 장소에 대한 설명을 표시합니다
										var infowindow = new kakao.maps.InfoWindow(
												{
													content : '<div style="width:150px;text-align:center;padding:6px 0;">인천국제공항</div>'
												});
										infowindow.open(map, marker);
										
										
										
										$(document).on("click", "#lodging_tag1", function(){
											positions.forEach(function(pos) {
												marker.setMap(null)
												infowindow.close();
											});
									  	});
									  	$(document).on("click", "#lodging_tag2", function(){
											positions.forEach(function(pos) {
												marker.setMap(null)
												infowindow.close();
											});
									 	});
									  	$(document).on("click", "#lodging_tag4", function(){
											positions.forEach(function(pos) {
												marker.setMap(null)
												infowindow.close();
											});
									  	});
									  	
									  	
									  	

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									}
								});
				
				

				/* ------------------------------------  인천   --------------------------------------------*/
				
				$(document).on("click", "#lodging_tag1", function(){
					
					$("#menu_wrap").css("display","block");
					
					$("#keyword").val("인천국제공항");
					searchPlaces();
					
				var positions = [
    				{ title: '워커힐 인천공항 환승호텔', latlng: new kakao.maps.LatLng(37.469466, 126.433009) },
   					{ title: '이비스 스타일 앰배서더 인천 에어포트', latlng: new kakao.maps.LatLng(37.481049, 126.420169) },
    				{ title: '호텔 오라', latlng: new kakao.maps.LatLng(37.454018, 126.417971) },
    				{ title: '환승호텔(T1 동편)', latlng: new kakao.maps.LatLng(37.450875, 126.454125) },
    				{ title: '그랜드 하얏트 인천', latlng: new kakao.maps.LatLng(37.440444, 126.457451) },
    				{ title: '아트 파라디소 호텔', latlng: new kakao.maps.LatLng(37.436877, 126.457838) },
    				{ title: '베스트 웨스턴 프리미어', latlng: new kakao.maps.LatLng(37.438616, 126.459600) },
    				{ title: '스카이게스텔1', latlng: new kakao.maps.LatLng(37.438880, 126.461038) },
    				{ title: '디 에어텔', latlng: new kakao.maps.LatLng(37.438874, 126.462985) },
    				{ title: '네스트 호텔', latlng: new kakao.maps.LatLng(37.424929, 126.428074) },
    				
    				{ title: '호텔 파크우드', latlng: new kakao.maps.LatLng(37.426144, 126.421800) },
    				{ title: '오션사이드호텔', latlng: new kakao.maps.LatLng(37.426475, 126.421201) },
    				{ title: '호텔 휴 로프트', latlng: new kakao.maps.LatLng(37.425911, 126.420623) },
    				{ title: '인스파이어 엔터테인먼트 리조트', latlng: new kakao.maps.LatLng(37.466410, 126.386531) },
    				{ title: '어느멋진날에2', latlng: new kakao.maps.LatLng(37.450331, 126.401025) },
    				{ title: '제이에스하우스', latlng: new kakao.maps.LatLng(37.450008, 126.393087) },
    				{ title: '인천프린스호텔', latlng: new kakao.maps.LatLng(37.449738, 126.389310) },
    				{ title: '인천 을왕리 바다&별 하우스 펜션', latlng: new kakao.maps.LatLng(37.458590, 126.377798) },
    				{ title: '자니노니펜션', latlng: new kakao.maps.LatLng(37.457979, 126.373047) },
    				{ title: '킹스테이', latlng: new kakao.maps.LatLng(37.456975, 126.368617) },
    				
    				{ title: '브라운도트호텔 인천을왕리점', latlng: new kakao.maps.LatLng(37.461179, 126.372324) },
    				{ title: '별빛바다펜션', latlng: new kakao.maps.LatLng(37.462552, 126.372954) },
    				{ title: '씨월드관광호텔', latlng: new kakao.maps.LatLng(37.464411, 126.369169) },
    				{ title: '왕산예림펜션', latlng: new kakao.maps.LatLng(37.462213, 126.369377) },
    				{ title: '위너스관광호텔', latlng: new kakao.maps.LatLng(37.461218, 126.368664) },
    				{ title: '당나귀펜션', latlng: new kakao.maps.LatLng(37.462156, 126.368465) },
    				{ title: '화이트팬션', latlng: new kakao.maps.LatLng(37.462482, 126.367927) },
    				{ title: '저맨팬션', latlng: new kakao.maps.LatLng(37.461862, 126.367413) },
    				{ title: '스윗트리펜션', latlng: new kakao.maps.LatLng(37.463287, 126.366871) },
    				{ title: '해처럼펜션', latlng: new kakao.maps.LatLng(37.463242, 126.366614) },
    				
    				{ title: '푸른솔펜션', latlng: new kakao.maps.LatLng(37.462582, 126.366110) },
    				{ title: '에버뷰펜션', latlng: new kakao.maps.LatLng(37.449817, 126.375023) },
    				{ title: '비치힐뷰펜션', latlng: new kakao.maps.LatLng(37.449451, 126.374674) },
    				{ title: '을왕리 스위스파크', latlng: new kakao.maps.LatLng(37.449155, 126.372501) },
    				{ title: '더프린스호텔', latlng: new kakao.maps.LatLng(37.449470, 126.371491) },
    				{ title: '관광호텔레이', latlng: new kakao.maps.LatLng(37.449518, 126.371837) },
    				{ title: '블루프로그 호텔', latlng: new kakao.maps.LatLng(37.449545, 126.372050) },
    				{ title: '발리모텔', latlng: new kakao.maps.LatLng(37.449654, 126.372312) },
    				{ title: '더 위크앤 리조트', latlng: new kakao.maps.LatLng(37.450364, 126.370942) },
    				{ title: '인천비치관광호텔', latlng: new kakao.maps.LatLng(37.450988, 126.371826) },
    				
    				{ title: '델로스 호텔', latlng: new kakao.maps.LatLng(37.450615, 126.372354) },
    				{ title: '하루가달고나', latlng: new kakao.maps.LatLng(37.447655, 126.376296) },
    				{ title: '마린캠프펜션', latlng: new kakao.maps.LatLng(37.446706, 126.376856) },
    				{ title: '연화문', latlng: new kakao.maps.LatLng(37.446315, 126.376338) },
    				{ title: '제이든29 펜션', latlng: new kakao.maps.LatLng(37.446298, 126.376966) },
    				{ title: '롱비치하우스', latlng: new kakao.maps.LatLng(37.446136, 126.377261) },
    				{ title: '바이드302펜션', latlng: new kakao.maps.LatLng(37.445914, 126.376714) },
    				{ title: '아소프로아 펜션', latlng: new kakao.maps.LatLng(37.445968, 126.377514) },
    				{ title: '대명펜션', latlng: new kakao.maps.LatLng(37.445781, 126.377501) },
    				{ title: '엔소이펜션', latlng: new kakao.maps.LatLng(37.446046, 126.377892) },
    				
    				{ title: '더 레스트 관광호텔', latlng: new kakao.maps.LatLng(37.443966, 126.377257) },
    				{ title: '제이앤파크 호텔', latlng: new kakao.maps.LatLng(37.444785, 126.378819) },
    				{ title: '제이앤파크 호텔', latlng: new kakao.maps.LatLng(37.444930, 126.379517) },
    				{ title: '인천을왕리휴', latlng: new kakao.maps.LatLng(37.443370, 126.378478) },
    				{ title: '허브 게스트하우스', latlng: new kakao.maps.LatLng(37.501389, 126.488305) },
    				{ title: '레인부츠게스트하우스', latlng: new kakao.maps.LatLng(37.494922, 126.497145) },
    				{ title: '인천공항 코인게스트하우스', latlng: new kakao.maps.LatLng(37.496740, 126.501259) },
    				{ title: '영종샤인호텔', latlng: new kakao.maps.LatLng(37.491363, 126.500761) },
    				{ title: '영종샤인호텔', latlng: new kakao.maps.LatLng(37.491080, 126.500643) },
    				{ title: '지엘시티호텔', latlng: new kakao.maps.LatLng(37.490655, 126.499464) },
    				
    				{ title: '미스터김 게스트하우스', latlng: new kakao.maps.LatLng(37.489293, 126.495435) },
    				{ title: '트리하우스 운서', latlng: new kakao.maps.LatLng(37.489404, 126.493176) },
    				{ title: '인천공항 게스트하우스 킹', latlng: new kakao.maps.LatLng(37.489116, 126.493036) },
    				{ title: '인천공항 게스트하우스 해피플레이스', latlng: new kakao.maps.LatLng(37.496428, 126.489915) },
    				{ title: '인천공항호텔', latlng: new kakao.maps.LatLng(37.494443, 126.489104) },
    				{ title: '에어릴렉스호텔', latlng: new kakao.maps.LatLng(37.494550, 126.489448) },
    				{ title: '인천공항 호텔 에어스테이', latlng: new kakao.maps.LatLng(37.494570, 126.489687) },
    				{ title: '영종호텔', latlng: new kakao.maps.LatLng(37.494991, 126.491725) },
    				{ title: '호텔시애틀/모로미 운서점', latlng: new kakao.maps.LatLng(37.494576, 126.491468) },
    				{ title: '호텔퀸', latlng: new kakao.maps.LatLng(37.494597, 126.491733) },
    				
    				{ title: 'DK INCHEON AIRPORT HOTEL', latlng: new kakao.maps.LatLng(37.494086, 126.492185) },
    				{ title: '제우메스호텔', latlng: new kakao.maps.LatLng(37.494493, 126.492868) },
    				{ title: '데이즈 호텔 앤 스위트 인천공항', latlng: new kakao.maps.LatLng(37.493426, 126.491490) },
    				{ title: '하워드 존슨 호텔 인천 에어포트', latlng: new kakao.maps.LatLng(37.493373, 126.491560) },
    				{ title: '호텔투어 인천공항 호텔&스위트', latlng: new kakao.maps.LatLng(37.492177, 126.492439) },
    				{ title: '골든 튤립 인천공항 호텔&스위트', latlng: new kakao.maps.LatLng(37.492269, 126.492432) }
    				
				];
				var i = 0;
				
				/* 오버레이 이미지 */
				var Map_imgSrc = [
					"resources/img/Incheon_lodging/Incheon1.jpg",
					"resources/img/Incheon_lodging/Incheon2.jpg",
					"resources/img/Incheon_lodging/incheon3.png",
					"resources/img/Incheon_lodging/Incheon4.jpg",
					"resources/img/Incheon_lodging/Incheon5.jpg",
					"resources/img/Incheon_lodging/Incheon6.jpg",
					"resources/img/Incheon_lodging/Incheon7.jpg",
					"resources/img/Incheon_lodging/Incheon8.jpg",
					"resources/img/Incheon_lodging/Incheon9.jpg",
					"resources/img/Incheon_lodging/Incheon10.jpg",
					
					"resources/img/Incheon_lodging/Incheon11.jpg",
					"resources/img/Incheon_lodging/Incheon12.jpg",
					"resources/img/Incheon_lodging/Incheon13.jpg",
					"resources/img/Incheon_lodging/Incheon14.jpg",
					"resources/img/Incheon_lodging/Incheon15.jpg",
					"resources/img/Incheon_lodging/Incheon16.jpg",
					"resources/img/Incheon_lodging/Incheon17.jpg",
					"resources/img/Incheon_lodging/Incheon18.jpg",
					"resources/img/Incheon_lodging/Incheon19.jpg",
					"resources/img/Incheon_lodging/Incheon20.jpg",
					
					"resources/img/Incheon_lodging/Incheon21.jpg",
					"resources/img/Incheon_lodging/Incheon22.jpg",
					"resources/img/Incheon_lodging/Incheon23.jpg",
					"resources/img/Incheon_lodging/Incheon24.jpg",
					"resources/img/Incheon_lodging/Incheon25.jpg",
					"resources/img/Incheon_lodging/Incheon26.jpg",
					"resources/img/Incheon_lodging/Incheon27.jpg",
					"resources/img/Incheon_lodging/Incheon28.jpg",
					"resources/img/Incheon_lodging/Incheon29.jpg",
					"resources/img/Incheon_lodging/Incheon30.jpg",
					
					"resources/img/Incheon_lodging/Incheon31.jpg",
					"resources/img/Incheon_lodging/Incheon32.jpg",
					"resources/img/Incheon_lodging/Incheon33.jpg",
					"resources/img/Incheon_lodging/Incheon34.jpg",
					"resources/img/Incheon_lodging/Incheon35.jpg",
					"resources/img/Incheon_lodging/Incheon36.jpg",
					"resources/img/Incheon_lodging/Incheon37.jpg",
					"resources/img/Incheon_lodging/Incheon38.jpg",
					"resources/img/Incheon_lodging/Incheon39.jpg",
					"resources/img/Incheon_lodging/Incheon40.jpg",
					
					"resources/img/Incheon_lodging/Incheon41.jpg",
					"resources/img/Incheon_lodging/Incheon42.jpg",
					"resources/img/Incheon_lodging/Incheon43.jpg",
					"resources/img/Incheon_lodging/Incheon44.jpg",
					"resources/img/Incheon_lodging/Incheon45.jpg",
					"resources/img/Incheon_lodging/Incheon46.jpg",
					"resources/img/Incheon_lodging/Incheon47.jpg",
					"resources/img/Incheon_lodging/Incheon48.jpg",
					"resources/img/Incheon_lodging/Incheon49.jpg",
					"resources/img/Incheon_lodging/Incheon50.jpg",
					
					"resources/img/Incheon_lodging/Incheon51.jpg",
					"resources/img/Incheon_lodging/Incheon52.jpg",
					"resources/img/Incheon_lodging/Incheon53.jpg",
					"resources/img/Incheon_lodging/Incheon54.jpg",
					"resources/img/Incheon_lodging/Incheon55.jpg",
					"resources/img/Incheon_lodging/Incheon56.jpg",
					"resources/img/Incheon_lodging/Incheon57.jpg",
					"resources/img/Incheon_lodging/Incheon58.jpg",
					"resources/img/Incheon_lodging/Incheon59.jpg",
					"resources/img/Incheon_lodging/Incheon60.jpg",
					
					"resources/img/Incheon_lodging/Incheon61.jpg",
					"resources/img/Incheon_lodging/Incheon62.jpg",
					"resources/img/Incheon_lodging/Incheon63.jpg",
					"resources/img/Incheon_lodging/Incheon64.jpg",
					"resources/img/Incheon_lodging/Incheon65.jpg",
					"resources/img/Incheon_lodging/Incheon66.jpg",
					"resources/img/Incheon_lodging/Incheon67.jpg",
					"resources/img/Incheon_lodging/Incheon68.jpg",
					"resources/img/Incheon_lodging/Incheon69.jpg",
					"resources/img/Incheon_lodging/Incheon70.jpg",
					
					"resources/img/Incheon_lodging/Incheon71.jpg",
					"resources/img/Incheon_lodging/Incheon72.jpg",
					"resources/img/Incheon_lodging/Incheon73.jpg",
					"resources/img/Incheon_lodging/Incheon74.jpg",
					"resources/img/Incheon_lodging/Incheon75.jpg",
					"resources/img/Incheon_lodging/Incheon76.jpg",
				];
				
				
				positions.forEach(function(pos) {
					
					 
					
					  /* 커스텀 오버레이 */
					  var customOverlay = new daum.maps.CustomOverlay({
					    position: pos.latlng
					  });
					  
					  /* 오버레이 배경 */
					  var content = document.createElement('div');
					  content.classList.add('Map_Div');
						
					  /* 오버레이 제목 */
					  var info = document.createElement('div');
					  info.appendChild(document.createTextNode(pos.title));
					  info.classList.add('Map_DivTitle');
					  content.appendChild(info);
					  
					  /* 좌표로 주소찾기 */
					  let coord = pos.latlng;
					    let callback = function(result, status) {
					        if (status === kakao.maps.services.Status.OK) {
					          //  console.log(result[0].address.address_name); --- 지번
					          
					           /* 주소 div */
							   var address1 = document.createElement('div');
					  		   address1.classList.add('address_Div');
					  		   address1.appendChild(document.createTextNode(result[0].address.address_name));
					  		   content.appendChild(address1);
					  
					          
					          //  console.log(result[0].road_address.address_name); --- 도로번호
					          
					          /* 도로명 div */
					  		   var road_address1 = document.createElement('div');
					  		   road_address1.classList.add('road_address_Div');
					  		   road_address1.appendChild(document.createTextNode(result[0].road_address.address_name));
					  		   content.appendChild(road_address1);
					          
					        }
					    }
					   geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
					   
					   /* 길 찾기 */
						  var Directions = document.createElement('div');
						  var Dt = document.createElement('a');
						  var latlng1 = pos.latlng
						  var latlng2 = latlng1.toString()
						  var latlng3 = latlng2.replace(/[&\/\#+()$~%:@^*?<>{}]/g, '');
						  var latlng4 = latlng3.trim();
						  
						  Dt.target = '_blank';
						  Dt.href = 'https://map.kakao.com/link/to/'+pos.title+","+latlng4;
						  Dt.innerText = '길찾기';
						  Directions.classList.add('Directions');
						  Directions.appendChild(Dt);
						  content.appendChild(Directions);
					  
					 
					  
					  /* 오버레이 사진 테두리 */
					  var Map_Imgbox = document.createElement('div');
					  Map_Imgbox.classList.add('Map_Imgbox');
					  content.appendChild(Map_Imgbox);
					  
					  /* 오버레이 사진 */
					  var Map_DivImg = document.createElement('img');
					  Map_DivImg.classList.add('Map_DivImg');
					  Map_DivImg.src = Map_imgSrc[i++];
					  Map_DivImg.width = 100;
					  Map_DivImg.height = 100;
					  Map_Imgbox.appendChild(Map_DivImg);

					  /* 오버레이 닫기 버튼 */
					  var closeBtn_img = document.createElement('img');
					  closeBtn_img.classList.add('closeBtn_img')
					  closeBtn_img.src = "resources/img/lodging_img/MapClose.png";
					  closeBtn_img.onclick = function() { customOverlay.setMap(null); };
					  info.appendChild(closeBtn_img);

					  customOverlay.setContent(content);
					  customOverlay.setMap(null);
					  
					  
					  var marker = new kakao.maps.Marker({
						   map: map, // 마커를 표시할 지도
						   position: pos.latlng, // 마커를 표시할 위치
						   title : pos.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						   image : markerImage, // 마커 이미지 
					       clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
					  });
					  
					  /* 다른태그 클릭시 마거삭제 */
					  $(document).on("click", "#lodging_tag2", function(){
							positions.forEach(function(pos) {
								marker.setMap(null)
							});
					  });
					  $(document).on("click", "#lodging_tag3", function(){
							positions.forEach(function(pos) {
								marker.setMap(null)
							});
					  });
					  $(document).on("click", "#lodging_tag4", function(){
							positions.forEach(function(pos) {
								marker.setMap(null)
							});
					  });
					  
					  
					  
					  /* 커스텀 오버레이 띄우기 */
					  kakao.maps.event.addListener(marker, 'click', function() {
						  customOverlay.setMap(map);
					  });
					  
					});
				

				
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(
								'인천 중구 운서동 2840',
								function(result, status) {

									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) {

										var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new kakao.maps.Marker({
											map : map,
											position : coords
										});
										
										
										// 인포윈도우로 장소에 대한 설명을 표시합니다
										var infowindow = new kakao.maps.InfoWindow(
												{
													content : '<div style="width:150px;text-align:center;padding:6px 0;">인천국제공항</div>'
												});
										infowindow.open(map, marker);
										
										
										
										$(document).on("click", "#lodging_tag1", function(){
											positions.forEach(function(pos) {
												marker.setMap(null)
												infowindow.close();
											});
									  	});
									  	$(document).on("click", "#lodging_tag2", function(){
											positions.forEach(function(pos) {
												marker.setMap(null)
												infowindow.close();
											});
									 	});
									  	$(document).on("click", "#lodging_tag4", function(){
											positions.forEach(function(pos) {
												marker.setMap(null)
												infowindow.close();
											});
									  	});
									  	
									  	
									  	

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									}
								});
				
				
				});
			    
			    
			    
			    
			    
				/* ----------------------------------------------------------- 김해 ----------------------------------------------------------- */
				
				$(document).on("click", "#lodging_tag2", function(){
					
					$("#menu_wrap").css("display","block");

					$("#keyword").val("김해국제공항");
					searchPlaces();
					
				var positions = [
    				{ title: '에어스카이관광호텔', latlng: new kakao.maps.LatLng(35.166896, 128.954376) },
    				{ title: '에어포트호텔', latlng: new kakao.maps.LatLng(35.165642, 128.954591) },
    				{ title: '베스티 호텔', latlng: new kakao.maps.LatLng(35.212074, 128.980605) },
    				{ title: '마틴모텔', latlng: new kakao.maps.LatLng(35.101091, 128.928714) },
    				{ title: '명지 W', latlng: new kakao.maps.LatLng(35.100761, 128.928952) },
    				{ title: '헤리티지디자인호텔', latlng: new kakao.maps.LatLng(35.100353, 128.928685) },
    				{ title: '명지 JK', latlng: new kakao.maps.LatLng(35.100168, 128.928500) },
    				{ title: '명지 브라운도트', latlng: new kakao.maps.LatLng(35.099227, 128.928279) },
    				{ title: '부산 명지 BM Hotel', latlng: new kakao.maps.LatLng(35.098888, 128.928242) },
    				{ title: '신라스테이 서부산', latlng: new kakao.maps.LatLng(35.096838, 128.904936) },
    				
    				{ title: 'No25 Hotel', latlng: new kakao.maps.LatLng(35.094008, 128.908225) },
    				{ title: '더포인트호텔 서부지청점', latlng: new kakao.maps.LatLng(35.093506, 128.908117) },
    				{ title: '오이아호텔', latlng: new kakao.maps.LatLng(35.093867, 128.900126) },
    				{ title: '호텔오유', latlng: new kakao.maps.LatLng(35.092014, 128.901692) },
    				{ title: '부산 명지 씨엘오션호텔', latlng: new kakao.maps.LatLng(35.090645, 128.902100) },
    				{ title: '호텔프렌치코드', latlng: new kakao.maps.LatLng(35.083516, 128.904262) },
    				{ title: '오션시티호텔', latlng: new kakao.maps.LatLng(35.080839, 128.903075) },
    				{ title: '덕천코코호텔', latlng: new kakao.maps.LatLng(35.211901, 129.009559) },
    				{ title: '힐링모텔', latlng: new kakao.maps.LatLng(35.211043, 129.005970) },
    				{ title: '브라운도트호텔 덕천점', latlng: new kakao.maps.LatLng(35.210793, 129.006302) },
    				
    				{ title: '투헤븐모텔', latlng: new kakao.maps.LatLng(35.210115, 129.003623) },
    				{ title: 'AU호텔', latlng: new kakao.maps.LatLng(35.210360, 129.003112) },
    				{ title: '본호텔', latlng: new kakao.maps.LatLng(35.208947, 129.000041) },
    				{ title: '브라운도트호텔 구포점', latlng: new kakao.maps.LatLng(35.208316, 129.001221) },
    				{ title: '이데아호텔', latlng: new kakao.maps.LatLng(35.207444, 128.999433) },
    				{ title: '모텔MU', latlng: new kakao.maps.LatLng(35.206372, 128.999365) },
    				{ title: '모텔 캣츠', latlng: new kakao.maps.LatLng(35.206739, 128.997624) },
    				{ title: '호텔티티 구포', latlng: new kakao.maps.LatLng(35.205023, 128.995834) },
    				{ title: '아몬드호텔', latlng: new kakao.maps.LatLng(35.204852, 128.995775) },
    				{ title: '더메이', latlng: new kakao.maps.LatLng(35.195166, 128.986165) },
    				
    				{ title: 'Busan Mora Healing', latlng: new kakao.maps.LatLng(35.188266, 128.988634) },
    				{ title: '이레호텔', latlng: new kakao.maps.LatLng(35.182397, 128.984139) },
    				{ title: '젬모텔', latlng: new kakao.maps.LatLng(35.181293, 128.983318) },
    				{ title: '미스터브릭호텔', latlng: new kakao.maps.LatLng(35.179305, 128.976440) },
    				{ title: 'ND.1226호텔', latlng: new kakao.maps.LatLng(35.169327, 128.977167) },
    				{ title: '일루아', latlng: new kakao.maps.LatLng(35.165593, 128.983412) },
    				{ title: '호텔야자 사상터미널점', latlng: new kakao.maps.LatLng(35.165549, 128.984125) },
    				{ title: '호텔더반', latlng: new kakao.maps.LatLng(35.165053, 128.983982) },
    				{ title: '소르젠떼비지니스호텔', latlng: new kakao.maps.LatLng(35.164851, 128.983982) },
    				{ title: '9월호텔', latlng: new kakao.maps.LatLng(35.164052, 128.982992) },
    				
    				{ title: '루이스 호텔', latlng: new kakao.maps.LatLng(35.164190, 128.982906) },
    				{ title: '썸호텔', latlng: new kakao.maps.LatLng(35.164062, 128.982683) },
    				{ title: '나무늘보호텔', latlng: new kakao.maps.LatLng(35.163928, 128.982271) },
    				{ title: 'MU모텔', latlng: new kakao.maps.LatLng(35.164096, 128.981192) },
    				{ title: '투헤븐호텔', latlng: new kakao.maps.LatLng(35.164180, 128.980895) },
    				{ title: '콤마호텔', latlng: new kakao.maps.LatLng(35.164227, 128.980560) },
    				{ title: '사상 맥스', latlng: new kakao.maps.LatLng(35.164180, 128.980277) },
    				{ title: '호텔앤레스트', latlng: new kakao.maps.LatLng(35.161458, 128.985996) },
    				{ title: '하이디자인호텔', latlng: new kakao.maps.LatLng(35.161334, 128.983644) },
    				{ title: '프리미엄아바호텔', latlng: new kakao.maps.LatLng(35.161482, 128.982840) },
    				
    				{ title: '르이데아호텔', latlng: new kakao.maps.LatLng(35.161529, 128.982079) },
    				{ title: '잠101호텔', latlng: new kakao.maps.LatLng(35.161503, 128.981859) },
    				{ title: '브라운도트호텔 사상르네시떼점', latlng: new kakao.maps.LatLng(35.161503, 128.979610) },
    				{ title: '하운드호텔 사상점', latlng: new kakao.maps.LatLng(35.161757, 128.977669) },
    				{ title: '캄 레스트 호텔 사상', latlng: new kakao.maps.LatLng(35.152401, 128.989478) },
    				{ title: '호텔 프리마', latlng: new kakao.maps.LatLng(35.151896, 128.986497) },
    				{ title: '사상제이모텔', latlng: new kakao.maps.LatLng(35.153837, 128.986527) },
    				{ title: '호텔 오 해피', latlng: new kakao.maps.LatLng(35.153667, 128.986432) },
    				{ title: '브라운도트호텔 사상낙동대로점', latlng: new kakao.maps.LatLng(35.153261, 128.974003) },
    				{ title: '1954호텔', latlng: new kakao.maps.LatLng(35.153025, 128.975401) },
    				
    				{ title: '사상구 학장동 369모텔', latlng: new kakao.maps.LatLng(35.142863, 128.988381) },
    				{ title: '호텔프렌치코드', latlng: new kakao.maps.LatLng(35.128696, 128.968610) },
    				{ title: '브라운도트 엄궁점', latlng: new kakao.maps.LatLng(35.128640, 128.968830) },
    				{ title: '사상 디자인호텔 JJAK', latlng: new kakao.maps.LatLng(35.125973, 128.967746) },
    				{ title: '호텔모먼트 하단점', latlng: new kakao.maps.LatLng(35.108672, 128.966176) },
    				{ title: '브라운도트호텔 하단점', latlng: new kakao.maps.LatLng(35.108299, 128.965859) },
    				{ title: '머물다호텔', latlng: new kakao.maps.LatLng(35.108212, 128.965645) },
    				{ title: '넘버25호텔 하단점', latlng: new kakao.maps.LatLng(35.108185, 128.965135) },
    				{ title: '하운드호텔 하단', latlng: new kakao.maps.LatLng(35.107224, 128.965081) },
    				{ title: '레이어스호텔', latlng: new kakao.maps.LatLng(35.106606, 128.964357) },
    				
    				{ title: '레전드 호텔', latlng: new kakao.maps.LatLng(35.159433, 128.863960) },
    				{ title: '베스트루이스해밀턴호텔', latlng: new kakao.maps.LatLng(35.146666, 128.878812) },
    				{ title: '서부산관광호텔', latlng: new kakao.maps.LatLng(35.111579, 128.882513) },
    				{ title: '강서 하운드호텔', latlng: new kakao.maps.LatLng(35.110762, 128.879607) },
    				{ title: '브라운도트호텔 신호점', latlng: new kakao.maps.LatLng(35.083271, 128.870766) },
    				{ title: '호텔더원', latlng: new kakao.maps.LatLng(35.082830, 128.870943) },
    				{ title: 'THE BRAIN HOTEL', latlng: new kakao.maps.LatLng(35.081759, 128.872232) },
    				{ title: '호텔 에그', latlng: new kakao.maps.LatLng(35.086588, 128.878730) },
    				{ title: 'Hotel The May', latlng: new kakao.maps.LatLng(35.086577, 128.879309) },
    				{ title: '이그니스 호텔', latlng: new kakao.maps.LatLng(35.086368, 128.879331) },
    				
    				{ title: 'Blanc Business Hotel', latlng: new kakao.maps.LatLng(35.086942, 128.881303) },
    				{ title: '아이스퀘어호텔', latlng: new kakao.maps.LatLng(35.225941, 128.885075) },
    				{ title: '포레스트701호텔', latlng: new kakao.maps.LatLng(35.228273, 128.883360) },
    				{ title: '아세라빌라드아쿠아호텔', latlng: new kakao.maps.LatLng(35.228833, 128.884190) },
    				{ title: '호텔그란트베이', latlng: new kakao.maps.LatLng(35.229312, 128.883125) },
    				{ title: '더블유모텔', latlng: new kakao.maps.LatLng(35.229242, 128.881628) },
    				{ title: '캄레스트호텔 김해', latlng: new kakao.maps.LatLng(35.232073, 128.883162) },
    				{ title: '넘버25호텔 김해내외점', latlng: new kakao.maps.LatLng(35.236338, 128.866217) },
    				{ title: '브라운도트호텔 김해', latlng: new kakao.maps.LatLng(35.234670, 128.904248) },
    				{ title: 'V 호텔 김해', latlng: new kakao.maps.LatLng(35.235015, 128.903117) },
    				
    				{ title: '호텔 그라나다', latlng: new kakao.maps.LatLng(35.234699, 128.903085) },
    				{ title: '아모르호텔', latlng: new kakao.maps.LatLng(35.235841, 128.903707) },
    				{ title: 'VVIP모텔', latlng: new kakao.maps.LatLng(35.242864, 128.906156) },
    				{ title: '아몬드키즈풀빌라호텔', latlng: new kakao.maps.LatLng(35.243269, 128.906182) },
    				{ title: '까르페호텔', latlng: new kakao.maps.LatLng(35.243473, 128.906151) },
    				{ title: '호텔스테이247', latlng: new kakao.maps.LatLng(35.243465, 128.905704) },
    				{ title: '아리에티A호텔', latlng: new kakao.maps.LatLng(35.243755, 128.905805) },
    				{ title: '다온호텔 김해인제대', latlng: new kakao.maps.LatLng(35.244214, 128.904921) },
    				{ title: '스위트호텔', latlng: new kakao.maps.LatLng(35.244597, 128.905868) },
    				{ title: '더젠틀호텔', latlng: new kakao.maps.LatLng(35.245705, 128.906882) }
    				
   					
    				
				];
				var i = 0;
				
				/* 오버레이 이미지 */
				var Map_imgSrc = [
					"resources/img/Gimhae_lodging/Gimhae1.jpg",
					"resources/img/Gimhae_lodging/Gimhae2.jpg",
					"resources/img/Gimhae_lodging/Gimhae3.jpg",
					"resources/img/Gimhae_lodging/Gimhae4.jpg",
					"resources/img/Gimhae_lodging/Gimhae5.jpg",
					"resources/img/Gimhae_lodging/Gimhae6.jpg",
					"resources/img/Gimhae_lodging/Gimhae7.jpg",
					"resources/img/Gimhae_lodging/Gimhae8.jpg",
					"resources/img/Gimhae_lodging/Gimhae9.jpg",
					"resources/img/Gimhae_lodging/Gimhae10.jpg",
					
					"resources/img/Gimhae_lodging/Gimhae11.jpg",
					"resources/img/Gimhae_lodging/Gimhae12.jpg",
					"resources/img/Gimhae_lodging/Gimhae13.jpg",
					"resources/img/Gimhae_lodging/Gimhae14.jpg",
					"resources/img/Gimhae_lodging/Gimhae15.jpg",
					"resources/img/Gimhae_lodging/Gimhae16.jpg",
					"resources/img/Gimhae_lodging/Gimhae17.jpg",
					"resources/img/Gimhae_lodging/Gimhae18.jpg",
					"resources/img/Gimhae_lodging/Gimhae19.jpg",
					"resources/img/Gimhae_lodging/Gimhae20.jpg",
					
					"resources/img/Gimhae_lodging/Gimhae21.jpg",
					"resources/img/Gimhae_lodging/Gimhae22.jpg",
					"resources/img/Gimhae_lodging/Gimhae23.jpg",
					"resources/img/Gimhae_lodging/Gimhae24.jpg",
					"resources/img/Gimhae_lodging/Gimhae25.jpg",
					"resources/img/Gimhae_lodging/Gimhae26.jpg",
					"resources/img/Gimhae_lodging/Gimhae27.jpg",
					"resources/img/Gimhae_lodging/Gimhae28.jpg",
					"resources/img/Gimhae_lodging/Gimhae29.jpg",
					"resources/img/Gimhae_lodging/Gimhae30.jpg",
					
					"resources/img/Gimhae_lodging/Gimhae31.jpg",
					"resources/img/Gimhae_lodging/Gimhae32.jpg",
					"resources/img/Gimhae_lodging/Gimhae33.jpg",
					"resources/img/Gimhae_lodging/Gimhae34.jpg",
					"resources/img/Gimhae_lodging/Gimhae35.jpg",
					"resources/img/Gimhae_lodging/Gimhae36.jpg",
					"resources/img/Gimhae_lodging/Gimhae37.jpg",
					"resources/img/Gimhae_lodging/Gimhae38.jpg",
					"resources/img/Gimhae_lodging/Gimhae39.jpg",
					"resources/img/Gimhae_lodging/Gimhae40.jpg",
					
					"resources/img/Gimhae_lodging/Gimhae41.jpg",
					"resources/img/Gimhae_lodging/Gimhae42.jpg",
					"resources/img/Gimhae_lodging/Gimhae43.jpg",
					"resources/img/Gimhae_lodging/Gimhae44.jpg",
					"resources/img/Gimhae_lodging/Gimhae45.jpg",
					"resources/img/Gimhae_lodging/Gimhae46.jpg",
					"resources/img/Gimhae_lodging/Gimhae47.jpg",
					"resources/img/Gimhae_lodging/Gimhae48.jpg",
					"resources/img/Gimhae_lodging/Gimhae49.jpg",
					"resources/img/Gimhae_lodging/Gimhae50.jpg",
					
					"resources/img/Gimhae_lodging/Gimhae51.jpg",
					"resources/img/Gimhae_lodging/Gimhae52.jpg",
					"resources/img/Gimhae_lodging/Gimhae53.jpg",
					"resources/img/Gimhae_lodging/Gimhae54.jpg",
					"resources/img/Gimhae_lodging/Gimhae55.jpg",
					"resources/img/Gimhae_lodging/Gimhae56.jpg",
					"resources/img/Gimhae_lodging/Gimhae57.jpg",
					"resources/img/Gimhae_lodging/Gimhae58.jpg",
					"resources/img/Gimhae_lodging/Gimhae59.jpg",
					"resources/img/Gimhae_lodging/Gimhae60.jpg",
					
					"resources/img/Gimhae_lodging/Gimhae61.jpg",
					"resources/img/Gimhae_lodging/Gimhae62.jpg",
					"resources/img/Gimhae_lodging/Gimhae63.jpg",
					"resources/img/Gimhae_lodging/Gimhae64.jpg",
					"resources/img/Gimhae_lodging/Gimhae65.jpg",
					"resources/img/Gimhae_lodging/Gimhae66.jpg",
					"resources/img/Gimhae_lodging/Gimhae67.jpg",
					"resources/img/Gimhae_lodging/Gimhae68.jpg",
					"resources/img/Gimhae_lodging/Gimhae69.jpg",
					"resources/img/Gimhae_lodging/Gimhae70.jpg",
					
					"resources/img/Gimhae_lodging/Gimhae71.jpg",
					"resources/img/Gimhae_lodging/Gimhae72.jpg",
					"resources/img/Gimhae_lodging/Gimhae73.jpg",
					"resources/img/Gimhae_lodging/Gimhae74.jpg",
					"resources/img/Gimhae_lodging/Gimhae75.jpg",
					"resources/img/Gimhae_lodging/Gimhae76.jpg",
					"resources/img/Gimhae_lodging/Gimhae77.jpg",
					"resources/img/Gimhae_lodging/Gimhae78.jpg",
					"resources/img/Gimhae_lodging/Gimhae79.jpg",
					"resources/img/Gimhae_lodging/Gimhae80.jpg",
					
					"resources/img/Gimhae_lodging/Gimhae81.jpg",
					"resources/img/Gimhae_lodging/Gimhae82.jpg",
					"resources/img/Gimhae_lodging/Gimhae83.jpg",
					"resources/img/Gimhae_lodging/Gimhae84.jpg",
					"resources/img/Gimhae_lodging/Gimhae85.jpg",
					"resources/img/Gimhae_lodging/Gimhae86.jpg",
					"resources/img/Gimhae_lodging/Gimhae87.jpg",
					"resources/img/Gimhae_lodging/Gimhae88.jpg",
					"resources/img/Gimhae_lodging/Gimhae89.jpg",
					"resources/img/Gimhae_lodging/Gimhae90.jpg",
					
					"resources/img/Gimhae_lodging/Gimhae91.jpg",
					"resources/img/Gimhae_lodging/Gimhae92.jpg",
					"resources/img/Gimhae_lodging/Gimhae93.jpg",
					"resources/img/Gimhae_lodging/Gimhae94.jpg",
					"resources/img/Gimhae_lodging/Gimhae95.jpg",
					"resources/img/Gimhae_lodging/Gimhae96.jpg",
					"resources/img/Gimhae_lodging/Gimhae97.jpg",
					"resources/img/Gimhae_lodging/Gimhae98.jpg",
					"resources/img/Gimhae_lodging/Gimhae99.jpg",
					"resources/img/Gimhae_lodging/Gimhae100.jpg",
					
				];
				
				
				
				positions.forEach(function(pos) {
					
					  /* 커스텀 오버레이 */
					  var customOverlay = new daum.maps.CustomOverlay({
					    position: pos.latlng
					  });
					  
					  /* 오버레이 배경 */
					  var content = document.createElement('div');
					  content.classList.add('Map_Div');
						
					  /* 오버레이 제목 */
					  var info = document.createElement('div');
					  info.appendChild(document.createTextNode(pos.title));
					  info.classList.add('Map_DivTitle');
					  content.appendChild(info);
					  
					  /* 좌표로 주소찾기 */
					  let coord = pos.latlng;
					    let callback = function(result, status) {
					        if (status === kakao.maps.services.Status.OK) {
					          //  console.log(result[0].address.address_name); --- 지번
					          
					           /* 주소 div */
							   var address1 = document.createElement('div');
					  		   address1.classList.add('address_Div');
					  		   address1.appendChild(document.createTextNode(result[0].address.address_name));
					  		   content.appendChild(address1);
					  
					          
					          //  console.log(result[0].road_address.address_name); --- 도로번호
					          
					          /* 도로명 div */
					  		   var road_address1 = document.createElement('div');
					  		   road_address1.classList.add('road_address_Div');
					  		   road_address1.appendChild(document.createTextNode(result[0].road_address.address_name));
					  		   content.appendChild(road_address1);
					          
					        }
					    }
					   geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
					   
					   /* 길 찾기 */
						  var Directions = document.createElement('div');
						  var Dt = document.createElement('a');
						  var latlng1 = pos.latlng
						  var latlng2 = latlng1.toString()
						  var latlng3 = latlng2.replace(/[&\/\#+()$~%:@^*?<>{}]/g, '');
						  var latlng4 = latlng3.trim();
						  
						  Dt.target = '_blank';
						  Dt.href = 'https://map.kakao.com/link/to/'+pos.title+","+latlng4;
						  Dt.innerText = '길찾기';
						  Directions.classList.add('Directions');
						  Directions.appendChild(Dt);
						  content.appendChild(Directions);
					  
					 
					  
					  /* 오버레이 사진 테두리 */
					  var Map_Imgbox = document.createElement('div');
					  Map_Imgbox.classList.add('Map_Imgbox');
					  content.appendChild(Map_Imgbox);
					  
					  /* 오버레이 사진 */
					  var Map_DivImg = document.createElement('img');
					  Map_DivImg.classList.add('Map_DivImg');
					  Map_DivImg.src = Map_imgSrc[i++];
					  Map_DivImg.width = 100;
					  Map_DivImg.height = 100;
					  Map_Imgbox.appendChild(Map_DivImg);

					  /* 오버레이 닫기 버튼 */
					  var closeBtn_img = document.createElement('img');
					  closeBtn_img.classList.add('closeBtn_img')
					  closeBtn_img.src = "resources/img/lodging_img/MapClose.png";
					  closeBtn_img.onclick = function() { customOverlay.setMap(null); };
					  info.appendChild(closeBtn_img);

					  customOverlay.setContent(content);
					  customOverlay.setMap(null);
					  
					  var marker = new kakao.maps.Marker({
						   map: map, // 마커를 표시할 지도
						   position: pos.latlng, // 마커를 표시할 위치
						   title : pos.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						   image : markerImage, // 마커 이미지 
					       clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
					    });
					  
					  
					  $(document).on("click", "#lodging_tag1", function(){
							positions.forEach(function(pos) {
								marker.setMap(null)
							});
					  });
					  $(document).on("click", "#lodging_tag3", function(){
							positions.forEach(function(pos) {
								marker.setMap(null)
							});
					  });
					  $(document).on("click", "#lodging_tag4", function(){
							positions.forEach(function(pos) {
								marker.setMap(null)
							});
					  });
					  
					  
					  
					  kakao.maps.event.addListener(marker, 'click', function() {
						  customOverlay.setMap(map);
					  });
					  
					});
				

				
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(
								'부산 강서구 대저2동 2350',
								function(result, status) {

									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) {

										var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new kakao.maps.Marker({
											map : map,
											position : coords
										});
										
										// 인포윈도우로 장소에 대한 설명을 표시합니다
										var infowindow = new kakao.maps.InfoWindow(
												{
													content : '<div style="width:150px;text-align:center;padding:6px 0;">김해국제공항</div>'
												});
										infowindow.open(map, marker);
										
										
										
										$(document).on("click", "#lodging_tag1", function(){
											positions.forEach(function(pos) {
												marker.setMap(null);
												infowindow.close(); 
											});
									  	});
									  	$(document).on("click", "#lodging_tag3", function(){
											positions.forEach(function(pos) {
												marker.setMap(null);
												infowindow.close(); 
											});
									  	});
									  	$(document).on("click", "#lodging_tag4", function(){
											positions.forEach(function(pos) {
												marker.setMap(null);
												infowindow.close(); 
											});
									  	});
									  	

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									}
								});
				
				});
			    
				
/* ----------------------------------------------------------- 김포 ----------------------------------------------------------- */
				
				$(document).on("click", "#lodging_tag3", function(){

					$("#menu_wrap").css("display","block");
					
					$("#keyword").val("김포국제공항");
					searchPlaces();
					
				var positions = [
					
    				{ title: '롯데시티호텔 김포공항', latlng: new kakao.maps.LatLng(37.563706, 126.802506) },
    				{ title: '뱅크모텔', latlng: new kakao.maps.LatLng(37.563323, 126.808022) },
    				{ title: '심플스테이 강서 김포공항', latlng: new kakao.maps.LatLng(37.563595, 126.810007) },
    				{ title: '로얄스퀘어 호텔', latlng: new kakao.maps.LatLng(37.560706, 126.810404) },
    				{ title: '티파니', latlng: new kakao.maps.LatLng(37.560034, 126.809808) },
    				{ title: '퍼시픽 호텔 김포공항점', latlng: new kakao.maps.LatLng(37.548525, 126.819709) },
    				{ title: '호텔디아망', latlng: new kakao.maps.LatLng(37.548386, 126.819308) },
    				{ title: 'Hotel TJ', latlng: new kakao.maps.LatLng(37.547931, 126.819973) },
    				{ title: '메이필드 호텔', latlng: new kakao.maps.LatLng(37.547472, 126.818778) },
    				{ title: '코트야드 바이 메리어트', latlng: new kakao.maps.LatLng(37.566861, 126.829372) },
    				
    				{ title: 'SR호텔', latlng: new kakao.maps.LatLng(37.561049, 126.839341) },
    				{ title: '골든호텔', latlng: new kakao.maps.LatLng(37.560117, 126.837228) },
    				{ title: '호텔엠펠리체', latlng: new kakao.maps.LatLng(37.559776, 126.835237) },
    				{ title: '인터시티서울호텔', latlng: new kakao.maps.LatLng(37.559654, 126.835755) },
    				{ title: '더퍼스트스테이 호텔', latlng: new kakao.maps.LatLng(37.559616, 126.836198) },
    				{ title: '화곡 스타 호텔', latlng: new kakao.maps.LatLng(37.552938, 126.850044) },
    				{ title: '샤르망모텔', latlng: new kakao.maps.LatLng(37.549751, 126.848361) },
    				{ title: '브라운도트 강서구청점', latlng: new kakao.maps.LatLng(37.549566, 126.848268) },
    				{ title: '야자호텔 강서구청점', latlng: new kakao.maps.LatLng(37.547147, 126.846381) },
    				{ title: '화곡 랑부띠끄', latlng: new kakao.maps.LatLng(37.546874, 126.846106) },
    				
    				{ title: '화곡 HOTEL A', latlng: new kakao.maps.LatLng(37.545715, 126.847939) },
    				{ title: '화곡 어거스트', latlng: new kakao.maps.LatLng(37.546287, 126.848360) },
    				{ title: 'JK블라썸 호텔', latlng: new kakao.maps.LatLng(37.556739, 126.867688) },
    				{ title: '나이아가라호텔', latlng: new kakao.maps.LatLng(37.549102, 126.878658) },
    				{ title: '골든서울호텔', latlng: new kakao.maps.LatLng(37.547716, 126.878123) },
    				{ title: '양천 스테이25', latlng: new kakao.maps.LatLng(37.519665, 126.844982) },
    				{ title: '드어반호텔', latlng: new kakao.maps.LatLng(37.529019, 126.847435) },
    				{ title: 'Hotel N', latlng: new kakao.maps.LatLng(37.528951, 126.847082) },
    				{ title: '화곡 테르모 호텔', latlng: new kakao.maps.LatLng(37.528940, 126.846936) },
    				{ title: '라이프스타일 S호텔', latlng: new kakao.maps.LatLng(37.530217, 126.844684) },
    				
    				{ title: '해담채스테이', latlng: new kakao.maps.LatLng(37.529955, 126.840580) },
    				{ title: '리얼부티크호텔', latlng: new kakao.maps.LatLng(37.529820, 126.840623) },
    				{ title: '앨리스넥스트도어', latlng: new kakao.maps.LatLng(37.528964, 126.840757) },
    				{ title: 'Bucheon A Hotel', latlng: new kakao.maps.LatLng(37.522844, 126.808654) },
    				{ title: '부천 원스테이 호텔', latlng: new kakao.maps.LatLng(37.524371, 126.807493) },
    				{ title: '마리호텔', latlng: new kakao.maps.LatLng(37.525150, 126.807626) },
    				{ title: '알브호텔', latlng: new kakao.maps.LatLng(37.525135, 126.808422) },
    				{ title: '원종 돈키호텔', latlng: new kakao.maps.LatLng(37.524858, 126.807049) },
    				{ title: '포스타호텔', latlng: new kakao.maps.LatLng(37.532194, 126.763515) },
    				{ title: '반도관광호텔', latlng: new kakao.maps.LatLng(37.532480, 126.735337) },
    				
    				{ title: '아마레관광호텔', latlng: new kakao.maps.LatLng(37.532699, 126.735554) },
    				{ title: 'Incheon RG', latlng: new kakao.maps.LatLng(37.533272, 126.735853) },
    				{ title: '호텔 소울하다 계양구청점', latlng: new kakao.maps.LatLng(37.535721, 126.736825) },
    				{ title: '보우(VOW)관광호텔', latlng: new kakao.maps.LatLng(37.535980, 126.735518) },
    				{ title: '호텔카리스', latlng: new kakao.maps.LatLng(37.526253, 126.723018) },
    				{ title: '3S 호텔 검단점', latlng: new kakao.maps.LatLng(37.593069, 126.698505) },
    				{ title: '호텔라르', latlng: new kakao.maps.LatLng(37.602623, 126.769180) },
    				{ title: '럭스호텔', latlng: new kakao.maps.LatLng(37.599576, 126.771331) },
    				{ title: '라마다앙코르 바이윈덤 김포한강호텔', latlng: new kakao.maps.LatLng(37.601093, 126.785900) },
    				{ title: '호텔 마리나베이 서울 아라', latlng: new kakao.maps.LatLng(37.600301, 126.792691) },
    				
    				{ title: '웨인스코트호텔', latlng: new kakao.maps.LatLng(37.664961, 126.726836) },
    				{ title: '소노캄 고양', latlng: new kakao.maps.LatLng(37.662573, 126.750974) },
    				{ title: '킨텍스 바이 케이트리 호텔', latlng: new kakao.maps.LatLng(37.668235, 126.748410) },
    				{ title: '아마다 모텔', latlng: new kakao.maps.LatLng(37.675951, 126.746739) },
    				{ title: '신트라호텔', latlng: new kakao.maps.LatLng(37.675219, 126.747871) },
    				{ title: 'Hotel KLAUM', latlng: new kakao.maps.LatLng(37.675033, 126.748023) },
    				{ title: '밀레니엄 호텔', latlng: new kakao.maps.LatLng(37.674901, 126.748301) },
    				{ title: '호텔마블', latlng: new kakao.maps.LatLng(37.676474, 126.748538) },
    				{ title: '호텔보보', latlng: new kakao.maps.LatLng(37.676395, 126.748729) },   /*------------ -- */
    				{ title: '리치호텔', latlng: new kakao.maps.LatLng(37.676143, 126.749153) },
    				
    				{ title: 'Ilsan Juyeop Grand', latlng: new kakao.maps.LatLng(37.671701, 126.759427) },
    				{ title: '일산 YELLOW 8', latlng: new kakao.maps.LatLng(37.670480, 126.762206) },
    				{ title: '저스트플레이호스텔 라페스타점', latlng: new kakao.maps.LatLng(37.663570, 126.765706) },
    				{ title: '부티크호텔k 일산점', latlng: new kakao.maps.LatLng(37.663031, 126.767434) },
    				{ title: '리미트에잇 호스텔', latlng: new kakao.maps.LatLng(37.663209, 126.768238) },
    				{ title: '스테이25', latlng: new kakao.maps.LatLng(37.658040, 126.772734) },
    				{ title: 'Ilsan Lake Bay', latlng: new kakao.maps.LatLng(37.656351, 126.770615) },
    				{ title: '블랑 호텔', latlng: new kakao.maps.LatLng(37.653403, 126.777252) },
    				{ title: '일산 발렌타인', latlng: new kakao.maps.LatLng(37.644588, 126.787196) },
    				{ title: '호텔앙띠브', latlng: new kakao.maps.LatLng(37.644219, 126.786948) },
    				
    				{ title: '미라벨호텔', latlng: new kakao.maps.LatLng(37.644051, 126.787095) },
    				{ title: '일산 필그린 호텔', latlng: new kakao.maps.LatLng(37.641727, 126.788207) },
    				{ title: '볼 모텔', latlng: new kakao.maps.LatLng(37.635596, 126.831803) },
    				{ title: 'Ilsan Victoria', latlng: new kakao.maps.LatLng(37.632055, 126.833089) },
    				{ title: '화정호텔', latlng: new kakao.maps.LatLng(37.631686, 126.832872) },
    				{ title: '고양 호텔 유지', latlng: new kakao.maps.LatLng(37.614916, 126.833872) },
    				{ title: '스탠포드 호텔 서울', latlng: new kakao.maps.LatLng(37.582112, 126.886734) },
    				{ title: '스위스 그랜드 호텔 서울', latlng: new kakao.maps.LatLng(37.589006, 126.934314) }
    				
				];
				
				var i = 0;
				
				/* 오버레이 이미지 */
				var Map_imgSrc = [
					
					"resources/img/Gimpo_lodging/Gimpo1.jpg",
					"resources/img/Gimpo_lodging/Gimpo2.jpg",
					"resources/img/Gimpo_lodging/Gimpo3.jpg",
					"resources/img/Gimpo_lodging/Gimpo4.jpg",
					"resources/img/Gimpo_lodging/Gimpo5.jpg",
					"resources/img/Gimpo_lodging/Gimpo6.jpg",
					"resources/img/Gimpo_lodging/Gimpo7.jpg",
					"resources/img/Gimpo_lodging/Gimpo8.jpg",
					"resources/img/Gimpo_lodging/Gimpo9.jpg",
					"resources/img/Gimpo_lodging/Gimpo10.jpg",
					
					"resources/img/Gimpo_lodging/Gimpo11.jpg",
					"resources/img/Gimpo_lodging/Gimpo12.jpg",
					"resources/img/Gimpo_lodging/Gimpo13.jpg",
					"resources/img/Gimpo_lodging/Gimpo14.jpg",
					"resources/img/Gimpo_lodging/Gimpo15.jpg",
					"resources/img/Gimpo_lodging/Gimpo16.jpg",
					"resources/img/Gimpo_lodging/Gimpo17.jpg",
					"resources/img/Gimpo_lodging/Gimpo18.jpg",
					"resources/img/Gimpo_lodging/Gimpo19.jpg",
					"resources/img/Gimpo_lodging/Gimpo20.jpg",
					
					"resources/img/Gimpo_lodging/Gimpo21.jpg",
					"resources/img/Gimpo_lodging/Gimpo22.jpg",
					"resources/img/Gimpo_lodging/Gimpo23.jpg",
					"resources/img/Gimpo_lodging/Gimpo24.jpg",
					"resources/img/Gimpo_lodging/Gimpo25.jpg",
					"resources/img/Gimpo_lodging/Gimpo26.jpg",
					"resources/img/Gimpo_lodging/Gimpo27.jpg",
					"resources/img/Gimpo_lodging/Gimpo28.jpg",
					"resources/img/Gimpo_lodging/Gimpo29.jpg",
					"resources/img/Gimpo_lodging/Gimpo30.jpg",
					
					"resources/img/Gimpo_lodging/Gimpo31.jpg",
					"resources/img/Gimpo_lodging/Gimpo32.jpg",
					"resources/img/Gimpo_lodging/Gimpo33.jpg",
					"resources/img/Gimpo_lodging/Gimpo34.jpg",
					"resources/img/Gimpo_lodging/Gimpo35.jpg",
					"resources/img/Gimpo_lodging/Gimpo36.jpg",
					"resources/img/Gimpo_lodging/Gimpo37.jpg",
					"resources/img/Gimpo_lodging/Gimpo38.jpg",
					"resources/img/Gimpo_lodging/Gimpo39.jpg",
					"resources/img/Gimpo_lodging/Gimpo40.jpg",
					
					"resources/img/Gimpo_lodging/Gimpo41.jpg",
					"resources/img/Gimpo_lodging/Gimpo42.jpg",
					"resources/img/Gimpo_lodging/Gimpo43.jpg",
					"resources/img/Gimpo_lodging/Gimpo44.jpg",
					"resources/img/Gimpo_lodging/Gimpo45.jpg",
					"resources/img/Gimpo_lodging/Gimpo46.jpg",
					"resources/img/Gimpo_lodging/Gimpo47.jpg",
					"resources/img/Gimpo_lodging/Gimpo48.jpg",
					"resources/img/Gimpo_lodging/Gimpo49.jpg",
					"resources/img/Gimpo_lodging/Gimpo50.jpg",
					
					"resources/img/Gimpo_lodging/Gimpo51.jpg",
					"resources/img/Gimpo_lodging/Gimpo52.jpg",
					"resources/img/Gimpo_lodging/Gimpo53.jpg",
					"resources/img/Gimpo_lodging/Gimpo54.jpg",
					"resources/img/Gimpo_lodging/Gimpo55.jpg",
					"resources/img/Gimpo_lodging/Gimpo56.jpg",
					"resources/img/Gimpo_lodging/Gimpo57.jpg",
					"resources/img/Gimpo_lodging/Gimpo58.jpg",
					"resources/img/Gimpo_lodging/Gimpo59.jpg",
					"resources/img/Gimpo_lodging/Gimpo60.jpg",
					
					"resources/img/Gimpo_lodging/Gimpo61.jpg",
					"resources/img/Gimpo_lodging/Gimpo62.jpg",
					"resources/img/Gimpo_lodging/Gimpo63.jpg",
					"resources/img/Gimpo_lodging/Gimpo64.jpg",
					"resources/img/Gimpo_lodging/Gimpo65.jpg",
					"resources/img/Gimpo_lodging/Gimpo66.jpg",
					"resources/img/Gimpo_lodging/Gimpo67.jpg",
					"resources/img/Gimpo_lodging/Gimpo68.jpg",
					"resources/img/Gimpo_lodging/Gimpo69.jpg",
					"resources/img/Gimpo_lodging/Gimpo70.jpg",
					
					"resources/img/Gimpo_lodging/Gimpo71.jpg",
					"resources/img/Gimpo_lodging/Gimpo72.jpg",
					"resources/img/Gimpo_lodging/Gimpo73.jpg",
					"resources/img/Gimpo_lodging/Gimpo74.jpg",
					"resources/img/Gimpo_lodging/Gimpo75.jpg",
					"resources/img/Gimpo_lodging/Gimpo76.jpg",
					"resources/img/Gimpo_lodging/Gimpo77.jpg",
					"resources/img/Gimpo_lodging/Gimpo78.jpg"
					
				];
				
				
				
				positions.forEach(function(pos) {
					
					  /* 커스텀 오버레이 */
					  var customOverlay = new daum.maps.CustomOverlay({
					    position: pos.latlng
					  });
					  
					  /* 오버레이 배경 */
					  var content = document.createElement('div');
					  content.classList.add('Map_Div');
						
					  /* 오버레이 제목 */
					  var info = document.createElement('div');
					  info.appendChild(document.createTextNode(pos.title));
					  info.classList.add('Map_DivTitle');
					  content.appendChild(info);
					  
					  /* 좌표로 주소찾기 */
					  let coord = pos.latlng;
					    let callback = function(result, status) {
					        if (status === kakao.maps.services.Status.OK) {
					          //  console.log(result[0].address.address_name); --- 지번
					          
					           /* 주소 div */
							   var address1 = document.createElement('div');
					  		   address1.classList.add('address_Div');
					  		   address1.appendChild(document.createTextNode(result[0].address.address_name));
					  		   content.appendChild(address1);
					  
					          
					          //  console.log(result[0].road_address.address_name); --- 도로번호
					          
					          /* 도로명 div */
					  		   var road_address1 = document.createElement('div');
					  		   road_address1.classList.add('road_address_Div');
					  		   road_address1.appendChild(document.createTextNode(result[0].road_address.address_name));
					  		   content.appendChild(road_address1);
					          
					        }
					    }
					   geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
					   
					   /* 길 찾기 */
						  var Directions = document.createElement('div');
						  var Dt = document.createElement('a');
						  var latlng1 = pos.latlng
						  var latlng2 = latlng1.toString()
						  var latlng3 = latlng2.replace(/[&\/\#+()$~%:@^*?<>{}]/g, '');
						  var latlng4 = latlng3.trim();
						  
						  Dt.target = '_blank';
						  Dt.href = 'https://map.kakao.com/link/to/'+pos.title+","+latlng4;
						  Dt.innerText = '길찾기';
						  Directions.classList.add('Directions');
						  Directions.appendChild(Dt);
						  content.appendChild(Directions);
					  
					 
					  
					  /* 오버레이 사진 테두리 */
					  var Map_Imgbox = document.createElement('div');
					  Map_Imgbox.classList.add('Map_Imgbox');
					  content.appendChild(Map_Imgbox);
					  
					  /* 오버레이 사진 */
					  var Map_DivImg = document.createElement('img');
					  Map_DivImg.classList.add('Map_DivImg');
					  Map_DivImg.src = Map_imgSrc[i++];
					  Map_DivImg.width = 100;
					  Map_DivImg.height = 100;
					  Map_Imgbox.appendChild(Map_DivImg);

					  /* 오버레이 닫기 버튼 */
					  var closeBtn_img = document.createElement('img');
					  closeBtn_img.classList.add('closeBtn_img')
					  closeBtn_img.src = "resources/img/lodging_img/MapClose.png";
					  closeBtn_img.onclick = function() { customOverlay.setMap(null); };
					  info.appendChild(closeBtn_img);

					  customOverlay.setContent(content);
					  customOverlay.setMap(null);
					  
					  var marker = new kakao.maps.Marker({
						   map: map, // 마커를 표시할 지도
						   position: pos.latlng, // 마커를 표시할 위치
						   title : pos.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						   image : markerImage, // 마커 이미지 
					       clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
					    });
					  
					  
					  $(document).on("click", "#lodging_tag1", function(){
							positions.forEach(function(pos) {
								marker.setMap(null)
							});
					  });
					  $(document).on("click", "#lodging_tag2", function(){
							positions.forEach(function(pos) {
								marker.setMap(null)
							});
					  });
					  $(document).on("click", "#lodging_tag4", function(){
							positions.forEach(function(pos) {
								marker.setMap(null)
							});
					  });
					  
					  
					  
					  kakao.maps.event.addListener(marker, 'click', function() {
						  customOverlay.setMap(map);
					  });
					  
					});
				

				
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(
								'서울 강서구 하늘길 112',
								function(result, status) {

									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) {

										var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new kakao.maps.Marker({
											map : map,
											position : coords
										});
										
										// 인포윈도우로 장소에 대한 설명을 표시합니다
										var infowindow = new kakao.maps.InfoWindow(
												{
													content : '<div style="width:150px;text-align:center;padding:6px 0;">김포국제공항</div>'
												});
										infowindow.open(map, marker);
										
										
										
										$(document).on("click", "#lodging_tag1", function(){
											positions.forEach(function(pos) {
												marker.setMap(null)
												infowindow.close();
											});
									  	});
									  	$(document).on("click", "#lodging_tag2", function(){
											positions.forEach(function(pos) {
												marker.setMap(null)
												infowindow.close();
											});
									  	});
									  	$(document).on("click", "#lodging_tag4", function(){
											positions.forEach(function(pos) {
												marker.setMap(null)
												infowindow.close();
											});
									  	});
									  	
									  	

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									}
								});
				
				});
			    
			    
/* ----------------------------------------------------------- 제주 ----------------------------------------------------------- */
				
				$(document).on("click", "#lodging_tag4", function(){
					
					$("#menu_wrap").css("display","block");

					$("#keyword").val("제주국제공항");
					searchPlaces();
					
				var positions = [
					
    				{ title: '심스호텔', latlng: new kakao.maps.LatLng(33.517647, 126.539629) },
    				{ title: '하버호텔', latlng: new kakao.maps.LatLng(33.517576, 126.538384) },
    				{ title: 'Maro Hostel & Lounge', latlng: new kakao.maps.LatLng(33.509614, 126.542311) },
    				{ title: '하나호텔', latlng: new kakao.maps.LatLng(33.508988, 126.539479) },
    				{ title: '제주영성모텔', latlng: new kakao.maps.LatLng(33.512764, 126.531518) },
    				{ title: '라마다프라자 제주호텔', latlng: new kakao.maps.LatLng(33.518766, 126.518032) },
    				{ title: '제주오리엔탈호텔', latlng: new kakao.maps.LatLng(33.517165, 126.519953) },
    				{ title: '오션스위츠 제주호텔', latlng: new kakao.maps.LatLng(33.518140, 126.523150) },
    				{ title: '제주팔레스호텔', latlng: new kakao.maps.LatLng(33.516832, 126.523762) },
    				{ title: '호텔 리젠트마린 제주', latlng: new kakao.maps.LatLng(33.517579, 126.526787) },
    				
    				{ title: '휘슬락 바이 베스트웨스턴 시그니처 컬렉션', latlng: new kakao.maps.LatLng(33.517301, 126.527816) },
    				{ title: '비전하우스', latlng: new kakao.maps.LatLng(33.515600, 126.525199) },
    				{ title: '호텔W 제주탑동점', latlng: new kakao.maps.LatLng(33.516266, 126.527299) },
    				{ title: '제주 체크인 호텔', latlng: new kakao.maps.LatLng(33.516382, 126.527832) },
    				{ title: '임프레스호텔', latlng: new kakao.maps.LatLng(33.516286, 126.527794) },
    				{ title: '아일랜드스테이', latlng: new kakao.maps.LatLng(33.516421, 126.528827) },
    				{ title: '베드라디오 동문', latlng: new kakao.maps.LatLng(33.516257, 126.529294) },
    				{ title: 'BOBOS', latlng: new kakao.maps.LatLng(33.515835, 126.527895) },
    				{ title: '탑CF모텔', latlng: new kakao.maps.LatLng(33.515193, 126.527085) },
    				{ title: '더 제이드 호텔', latlng: new kakao.maps.LatLng(33.513871, 126.526710) },
    				
    				{ title: '대동호텔', latlng: new kakao.maps.LatLng(33.513742, 126.527073) },
    				{ title: '농땡이 연구소', latlng: new kakao.maps.LatLng(33.513800, 126.524898) },
    				{ title: '제주스테이호텔', latlng: new kakao.maps.LatLng(33.514469, 126.520622) },
    				{ title: '스타즈호텔 제주로베로', latlng: new kakao.maps.LatLng(33.512673, 126.521927) },
    				{ title: '비지터 게스트하우스', latlng: new kakao.maps.LatLng(33.512319, 126.525265) },
    				{ title: '호텔 스테이현', latlng: new kakao.maps.LatLng(33.512243, 126.524324) },
    				{ title: '고요산책', latlng: new kakao.maps.LatLng(33.511805, 126.523836) },
    				{ title: '에메랄드호텔', latlng: new kakao.maps.LatLng(33.511931, 126.521014) },
    				{ title: '제주호텔조이', latlng: new kakao.maps.LatLng(33.511245, 126.521145) },
    				{ title: 'R&T 호텔', latlng: new kakao.maps.LatLng(33.511122, 126.521217) },
    				
    				{ title: '서문레지던스호텔', latlng: new kakao.maps.LatLng(33.510438, 126.517532) },
    				{ title: '제주퍼시픽호텔', latlng: new kakao.maps.LatLng(33.510514, 126.519303) },
    				{ title: '아라팰리스 호텔', latlng: new kakao.maps.LatLng(33.507079, 126.523793) },
    				{ title: '하니크라운호텔', latlng: new kakao.maps.LatLng(33.504904, 126.527640) },
    				{ title: '레인보우인제주', latlng: new kakao.maps.LatLng(33.504151, 126.527478) },
    				{ title: '라마다 제주 시티 호텔', latlng: new kakao.maps.LatLng(33.493334, 126.534299) },
    				{ title: '애플관광호텔', latlng: new kakao.maps.LatLng(33.502957, 126.533653) },
    				{ title: '라인호텔', latlng: new kakao.maps.LatLng(33.502159, 126.533283) },
    				{ title: '호텔샬롬제주', latlng: new kakao.maps.LatLng(33.501888, 126.532690) },
    				{ title: '관광호텔더레드', latlng: new kakao.maps.LatLng(33.501042, 126.531895) },
    				
    				{ title: '시티홀호텔제주', latlng: new kakao.maps.LatLng(33.500719, 126.532062) },
    				{ title: 'Jeju O', latlng: new kakao.maps.LatLng(33.499568, 126.531189) },
    				{ title: '헤르츠 호텔', latlng: new kakao.maps.LatLng(33.497506, 126.531227) },
    				{ title: '오렌지모텔', latlng: new kakao.maps.LatLng(33.500798, 126.527725) },
    				{ title: '모텔프라임', latlng: new kakao.maps.LatLng(33.500857, 126.527393) },
    				{ title: '슬림호텔', latlng: new kakao.maps.LatLng(33.500163, 126.527658) },
    				{ title: '올레관광호텔', latlng: new kakao.maps.LatLng(33.499539, 126.524655) },
    				{ title: '사하라 호텔', latlng: new kakao.maps.LatLng(33.500281, 126.524786) },
    				{ title: '라임모텔', latlng: new kakao.maps.LatLng(33.500520, 126.524553) },
    				{ title: 'Hue motel', latlng: new kakao.maps.LatLng(33.500611, 126.524212) },
    				
    				{ title: '녹원', latlng: new kakao.maps.LatLng(33.500446, 126.524232) },
    				{ title: '호텔 알리바', latlng: new kakao.maps.LatLng(33.499946, 126.523404) },
    				{ title: '아스타호텔', latlng: new kakao.maps.LatLng(33.500770, 126.520059) },
    				{ title: '예하게스트하우스', latlng: new kakao.maps.LatLng(33.499363, 126.517500) },
    				{ title: '제주R호텔', latlng: new kakao.maps.LatLng(33.499401, 126.517970) },
    				{ title: '제주갤럭시호텔', latlng: new kakao.maps.LatLng(33.503055, 126.512640) },
    				{ title: 'Orasung motel', latlng: new kakao.maps.LatLng(33.498615, 126.513093) },
    				{ title: '한나스테이', latlng: new kakao.maps.LatLng(33.504128, 126.527521) },
    				{ title: '미르 게스트하우스', latlng: new kakao.maps.LatLng(33.512732, 126.510597) },
    				{ title: '그림리조트', latlng: new kakao.maps.LatLng(33.516145, 126.503615) },
    				
    				{ title: '하얀등대펜션', latlng: new kakao.maps.LatLng(33.517429, 126.499002) },
    				{ title: '사랑터울', latlng: new kakao.maps.LatLng(33.518508, 126.495887) },
    				{ title: '바다드림펜션', latlng: new kakao.maps.LatLng(33.517937, 126.494922) },
    				{ title: '더비치호스텔', latlng: new kakao.maps.LatLng(33.518700, 126.491008) },
    				{ title: '골든비치', latlng: new kakao.maps.LatLng(33.518607, 126.491234) },
    				{ title: 'Jeju Stay Dalggum Pension', latlng: new kakao.maps.LatLng(33.518484, 126.489437) },
    				{ title: '제주펜션오다', latlng: new kakao.maps.LatLng(33.517666, 126.487714) },
    				{ title: '오슬로관광호텔', latlng: new kakao.maps.LatLng(33.517242, 126.488048) },
    				{ title: '로긴리조트', latlng: new kakao.maps.LatLng(33.517014, 126.488594) },
    				{ title: '몽듀호텔', latlng: new kakao.maps.LatLng(33.512695, 126.484643) },
    				
    				{ title: 'Hotel White House', latlng: new kakao.maps.LatLng(33.512410, 126.484287) },
    				{ title: '팜파스 호텔 제주', latlng: new kakao.maps.LatLng(33.511536, 126.484766) },
    				{ title: '메르블루', latlng: new kakao.maps.LatLng(33.511250, 126.484163) },
    				{ title: '빅터펜션', latlng: new kakao.maps.LatLng(33.510068, 126.481423) },
    				{ title: '퓨어스테이', latlng: new kakao.maps.LatLng(33.509581, 126.481998) },
    				{ title: '더포힐스호텔', latlng: new kakao.maps.LatLng(33.509301, 126.473046) },
    				{ title: '마니주펜션', latlng: new kakao.maps.LatLng(33.508925, 126.472316) },
    				{ title: '도두다펜션', latlng: new kakao.maps.LatLng(33.507921, 126.472480) },
    				{ title: '베드라디오 도두봉', latlng: new kakao.maps.LatLng(33.506540, 126.469895) },
    				{ title: 'Jeju Story House Pension', latlng: new kakao.maps.LatLng(33.502123, 126.462690) },
    				
    				{ title: '선비치리조트', latlng: new kakao.maps.LatLng(33.502432, 126.461507) },
    				{ title: '스완지', latlng: new kakao.maps.LatLng(33.503031, 126.458027) },
    				{ title: 'At Corner', latlng: new kakao.maps.LatLng(33.502642, 126.458726) },
    				{ title: '플로라펜션', latlng: new kakao.maps.LatLng(33.499436, 126.460162) },
    				{ title: '쥬디스펜션', latlng: new kakao.maps.LatLng(33.496498, 126.450752) },
    				{ title: '이호MH호텔', latlng: new kakao.maps.LatLng(33.496917, 126.448768) },
    				{ title: '오로라호텔', latlng: new kakao.maps.LatLng(33.489230, 126.442076) },
    				{ title: '제주올레로', latlng: new kakao.maps.LatLng(33.493393, 126.430734) },
    				{ title: '신라스테이 플러스 제주 이호테우', latlng: new kakao.maps.LatLng() },
    				{ title: '그라벨호텔제주', latlng: new kakao.maps.LatLng(33.492405, 126.428631) },
    				
    				{ title: '신라스테이 플러스 이호테우', latlng: new kakao.maps.LatLng(33.493583, 126.425611) },
    				{ title: '섬타임즈펜션', latlng: new kakao.maps.LatLng(33.493254, 126.423874) },
    				{ title: '신라스테이 플러스 이호테우', latlng: new kakao.maps.LatLng(33.492936, 126.423100) },
    				{ title: '이안스테이', latlng: new kakao.maps.LatLng(33.487134, 126.423520) },
    				{ title: '바다위에펜션', latlng: new kakao.maps.LatLng(33.489311, 126.419062) },
    				{ title: '용스테이민박', latlng: new kakao.maps.LatLng(33.494404, 126.493167) },
    				{ title: '호텔시리우스', latlng: new kakao.maps.LatLng(33.493330, 126.491021) },
    				{ title: '벤티모 호텔 앤 레지던스', latlng: new kakao.maps.LatLng(33.493294, 126.493746) },
    				{ title: '호텔엘린', latlng: new kakao.maps.LatLng(33.489299, 126.495489) },
    				{ title: '에이티눈호텔', latlng: new kakao.maps.LatLng(33.489321, 126.495076) },
    				
    				{ title: '제주센트럴파크레지던스', latlng: new kakao.maps.LatLng(33.488794, 126.495146) },
    				{ title: 'Jeju Hotel B', latlng: new kakao.maps.LatLng(33.488798, 126.494899) },
    				{ title: '레브호텔제주', latlng: new kakao.maps.LatLng(33.489035, 126.494159) },
    				{ title: '제주썬호텔', latlng: new kakao.maps.LatLng(33.489959, 126.493885) },
    				{ title: '하워드존슨제주호텔', latlng: new kakao.maps.LatLng(33.490026, 126.492684) },
    				{ title: '글로스터호텔 제주', latlng: new kakao.maps.LatLng(33.489797, 126.492647) },
    				{ title: 'Hotel Aircity Jeju', latlng: new kakao.maps.LatLng(33.489631, 126.492621) },
    				{ title: '하이레지던스', latlng: new kakao.maps.LatLng(33.489329, 126.491029) },
    				{ title: '호텔레오', latlng: new kakao.maps.LatLng(33.489710, 126.488261) },
    				{ title: '엠버호텔', latlng: new kakao.maps.LatLng(33.489731, 126.487718) },
    				
    				{ title: '케이관광호텔', latlng: new kakao.maps.LatLng(33.489042, 126.487914) },
    				{ title: '롯데시티호텔 제주', latlng: new kakao.maps.LatLng(33.490513, 126.486410) },
    				{ title: '에이원호텔', latlng: new kakao.maps.LatLng(33.485225, 126.494805) },
    				{ title: '아이진호텔', latlng: new kakao.maps.LatLng(33.482306, 126.494868) },
    				{ title: '호텔 앨리스 앤 트렁크', latlng: new kakao.maps.LatLng(33.485264, 126.493061) },
    				{ title: '호텔더원', latlng: new kakao.maps.LatLng(33.482714, 126.491345) },
    				{ title: '신라스테이 제주', latlng: new kakao.maps.LatLng(33.485437, 126.491005) },
    				{ title: '모닝마드리드', latlng: new kakao.maps.LatLng(33.485006, 126.489533) },
    				{ title: '메종 글래드 제주', latlng: new kakao.maps.LatLng(33.485089, 126.488636) },
    				{ title: '힐스테이트 제주', latlng: new kakao.maps.LatLng(33.485505, 126.489511) },
    				
    				{ title: '제주 더나인스테이', latlng: new kakao.maps.LatLng(33.485678, 126.489451) },
    				{ title: '호텔위드제주', latlng: new kakao.maps.LatLng(33.485739, 126.483807) },
    				{ title: '엘앤엘센트럴호텔', latlng: new kakao.maps.LatLng(33.485821, 126.482623) },
    				{ title: '베스트 웨스턴 제주', latlng: new kakao.maps.LatLng(33.487744, 126.481895) },
    				{ title: '그랜드 하얏트 제주', latlng: new kakao.maps.LatLng(33.485334, 126.481561) },
    				{ title: '노형호텔', latlng: new kakao.maps.LatLng(33.486069, 126.478216) },
    				{ title: '레슬리', latlng: new kakao.maps.LatLng(33.481097, 126.470792) },
    				{ title: '제주 디오름 스파펜션', latlng: new kakao.maps.LatLng(33.474480, 126.530363) },
    				
    				
				];
				
				var i = 0;
				
				/* 오버레이 이미지 */
				var Map_imgSrc = [
					
					"resources/img/jeju_lodging/jeju1.jpg",
					"resources/img/jeju_lodging/jeju2.jpg",
					"resources/img/jeju_lodging/jeju3.jpg",
					"resources/img/jeju_lodging/jeju4.jpg",
					"resources/img/jeju_lodging/jeju5.jpg",
					"resources/img/jeju_lodging/jeju6.jpg",
					"resources/img/jeju_lodging/jeju7.jpg",
					"resources/img/jeju_lodging/jeju8.jpg",
					"resources/img/jeju_lodging/jeju9.jpg",
					"resources/img/jeju_lodging/jeju10.jpg",
					
					"resources/img/jeju_lodging/jeju11.jpg",
					"resources/img/jeju_lodging/jeju12.jpg",
					"resources/img/jeju_lodging/jeju13.jpg",
					"resources/img/jeju_lodging/jeju14.jpg",
					"resources/img/jeju_lodging/jeju15.jpg",
					"resources/img/jeju_lodging/jeju16.jpg",
					"resources/img/jeju_lodging/jeju17.jpg",
					"resources/img/jeju_lodging/jeju18.jpg",
					"resources/img/jeju_lodging/jeju19.jpg",
					"resources/img/jeju_lodging/jeju20.jpg",
					
					"resources/img/jeju_lodging/jeju21.jpg",
					"resources/img/jeju_lodging/jeju22.jpg",
					"resources/img/jeju_lodging/jeju23.jpg",
					"resources/img/jeju_lodging/jeju24.jpg",
					"resources/img/jeju_lodging/jeju25.jpg",
					"resources/img/jeju_lodging/jeju26.jpg",
					"resources/img/jeju_lodging/jeju27.jpg",
					"resources/img/jeju_lodging/jeju28.jpg",
					"resources/img/jeju_lodging/jeju29.jpg",
					"resources/img/jeju_lodging/jeju30.jpg",
					
					"resources/img/jeju_lodging/jeju31.jpg",
					"resources/img/jeju_lodging/jeju32.jpg",
					"resources/img/jeju_lodging/jeju33.jpg",
					"resources/img/jeju_lodging/jeju34.jpg",
					"resources/img/jeju_lodging/jeju35.jpg",
					"resources/img/jeju_lodging/jeju36.jpg",
					"resources/img/jeju_lodging/jeju37.jpg",
					"resources/img/jeju_lodging/jeju38.jpg",
					"resources/img/jeju_lodging/jeju39.jpg",
					"resources/img/jeju_lodging/jeju40.jpg",
					
					"resources/img/jeju_lodging/jeju41.jpg",
					"resources/img/jeju_lodging/jeju42.jpg",
					"resources/img/jeju_lodging/jeju43.jpg",
					"resources/img/jeju_lodging/jeju44.jpg",
					"resources/img/jeju_lodging/jeju45.jpg",
					"resources/img/jeju_lodging/jeju46.jpg",
					"resources/img/jeju_lodging/jeju47.jpg",
					"resources/img/jeju_lodging/jeju48.jpg",
					"resources/img/jeju_lodging/jeju49.jpg",
					"resources/img/jeju_lodging/jeju50.jpg",
					
					"resources/img/jeju_lodging/jeju51.jpg",
					"resources/img/jeju_lodging/jeju52.jpg",
					"resources/img/jeju_lodging/jeju53.jpg",
					"resources/img/jeju_lodging/jeju54.jpg",
					"resources/img/jeju_lodging/jeju55.jpg",
					"resources/img/jeju_lodging/jeju56.jpg",
					"resources/img/jeju_lodging/jeju57.jpg",
					"resources/img/jeju_lodging/jeju58.jpg",
					"resources/img/jeju_lodging/jeju59.jpg",
					"resources/img/jeju_lodging/jeju60.jpg",
					
					"resources/img/jeju_lodging/jeju61.jpg",
					"resources/img/jeju_lodging/jeju62.jpg",
					"resources/img/jeju_lodging/jeju63.jpg",
					"resources/img/jeju_lodging/jeju64.jpg",
					"resources/img/jeju_lodging/jeju65.jpg",
					"resources/img/jeju_lodging/jeju66.jpg",
					"resources/img/jeju_lodging/jeju67.jpg",
					"resources/img/jeju_lodging/jeju68.jpg",
					"resources/img/jeju_lodging/jeju69.jpg",
					"resources/img/jeju_lodging/jeju70.jpg",
					
					"resources/img/jeju_lodging/jeju71.jpg",
					"resources/img/jeju_lodging/jeju72.jpg",
					"resources/img/jeju_lodging/jeju73.jpg",
					"resources/img/jeju_lodging/jeju74.jpg",
					"resources/img/jeju_lodging/jeju75.jpg",
					"resources/img/jeju_lodging/jeju76.jpg",
					"resources/img/jeju_lodging/jeju77.jpg",
					"resources/img/jeju_lodging/jeju78.jpg",
					"resources/img/jeju_lodging/jeju79.jpg",
					"resources/img/jeju_lodging/jeju80.jpg",
					
					"resources/img/jeju_lodging/jeju81.jpg",
					"resources/img/jeju_lodging/jeju82.jpg",
					"resources/img/jeju_lodging/jeju83.jpg",
					"resources/img/jeju_lodging/jeju84.jpg",
					"resources/img/jeju_lodging/jeju85.jpg",
					"resources/img/jeju_lodging/jeju86.jpg",
					"resources/img/jeju_lodging/jeju87.jpg",
					"resources/img/jeju_lodging/jeju88.jpg",
					"resources/img/jeju_lodging/jeju89.jpg",
					"resources/img/jeju_lodging/jeju90.jpg",
					
					"resources/img/jeju_lodging/jeju91.jpg",
					"resources/img/jeju_lodging/jeju92.jpg",
					"resources/img/jeju_lodging/jeju93.jpg",
					"resources/img/jeju_lodging/jeju94.jpg",
					"resources/img/jeju_lodging/jeju95.jpg",
					"resources/img/jeju_lodging/jeju96.jpg",
					"resources/img/jeju_lodging/jeju97.jpg",
					"resources/img/jeju_lodging/jeju98.jpg",
					"resources/img/jeju_lodging/jeju99.jpg",
					"resources/img/jeju_lodging/jeju100.jpg",
					
					"resources/img/jeju_lodging/jeju101.jpg",
					"resources/img/jeju_lodging/jeju102.jpg",
					"resources/img/jeju_lodging/jeju103.jpg",
					"resources/img/jeju_lodging/jeju104.jpg",
					"resources/img/jeju_lodging/jeju105.jpg",
					"resources/img/jeju_lodging/jeju106.jpg",
					"resources/img/jeju_lodging/jeju107.jpg",
					"resources/img/jeju_lodging/jeju108.jpg",
					"resources/img/jeju_lodging/jeju109.jpg",
					"resources/img/jeju_lodging/jeju110.jpg",
					
					"resources/img/jeju_lodging/jeju111.jpg",
					"resources/img/jeju_lodging/jeju112.jpg",
					"resources/img/jeju_lodging/jeju113.jpg",
					"resources/img/jeju_lodging/jeju114.jpg",
					"resources/img/jeju_lodging/jeju115.jpg",
					"resources/img/jeju_lodging/jeju116.jpg",
					"resources/img/jeju_lodging/jeju117.jpg",
					"resources/img/jeju_lodging/jeju118.jpg",
					"resources/img/jeju_lodging/jeju119.jpg",
					"resources/img/jeju_lodging/jeju120.jpg",
					
					"resources/img/jeju_lodging/jeju121.jpg",
					"resources/img/jeju_lodging/jeju122.jpg",
					"resources/img/jeju_lodging/jeju123.jpg",
					"resources/img/jeju_lodging/jeju124.jpg",
					"resources/img/jeju_lodging/jeju125.jpg",
					"resources/img/jeju_lodging/jeju126.jpg",
					"resources/img/jeju_lodging/jeju127.jpg",
					"resources/img/jeju_lodging/jeju128.jpg",
					
				];
				
				
				
				positions.forEach(function(pos) {
					
					  /* 커스텀 오버레이 */
					  var customOverlay = new daum.maps.CustomOverlay({
					    position: pos.latlng
					  });
					  
					  /* 오버레이 배경 */
					  var content = document.createElement('div');
					  content.classList.add('Map_Div');
						
					  /* 오버레이 제목 */
					  var info = document.createElement('div');
					  info.appendChild(document.createTextNode(pos.title));
					  info.classList.add('Map_DivTitle');
					  content.appendChild(info);
					  
					  /* 좌표로 주소찾기 */
					  let coord = pos.latlng;
					    let callback = function(result, status) {
					        if (status === kakao.maps.services.Status.OK) {
					          //  console.log(result[0].address.address_name); --- 지번
					          
					           /* 주소 div */
							   var address1 = document.createElement('div');
					  		   address1.classList.add('address_Div');
					  		   address1.appendChild(document.createTextNode(result[0].address.address_name));
					  		   content.appendChild(address1);
					  
					          
					          //  console.log(result[0].road_address.address_name); --- 도로번호
					          
					          /* 도로명 div */
					  		   var road_address1 = document.createElement('div');
					  		   road_address1.classList.add('road_address_Div');
					  		   road_address1.appendChild(document.createTextNode(result[0].road_address.address_name));
					  		   content.appendChild(road_address1);
					          
					        }
					    }
					   geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
					  
					  /* 길 찾기 */
					  var Directions = document.createElement('div');
					  var Dt = document.createElement('a');
					  var latlng1 = pos.latlng
					  var latlng2 = latlng1.toString()
					  var latlng3 = latlng2.replace(/[&\/\#+()$~%:@^*?<>{}]/g, '');
					  var latlng4 = latlng3.trim();
					  
					  Dt.target = '_blank';
					  Dt.href = 'https://map.kakao.com/link/to/'+pos.title+","+latlng4;
					  Dt.innerText = '길찾기';
					  Directions.classList.add('Directions');
					  Directions.appendChild(Dt);
					  content.appendChild(Directions);
					  
					  /* 오버레이 사진 테두리 */
					  var Map_Imgbox = document.createElement('div');
					  Map_Imgbox.classList.add('Map_Imgbox');
					  content.appendChild(Map_Imgbox);
					  
					  /* 오버레이 사진 */
					  var Map_DivImg = document.createElement('img');
					  Map_DivImg.classList.add('Map_DivImg');
					  Map_DivImg.src = Map_imgSrc[i++];
					  Map_DivImg.width = 100;
					  Map_DivImg.height = 100;
					  Map_Imgbox.appendChild(Map_DivImg);

					  /* 오버레이 닫기 버튼 */
					  var closeBtn_img = document.createElement('img');
					  closeBtn_img.classList.add('closeBtn_img')
					  closeBtn_img.src = "resources/img/lodging_img/MapClose.png";
					  closeBtn_img.onclick = function() { customOverlay.setMap(null); };
					  info.appendChild(closeBtn_img);

					  customOverlay.setContent(content);
					  customOverlay.setMap(null);
					  
					  var marker = new kakao.maps.Marker({
						   map: map, // 마커를 표시할 지도
						   position: pos.latlng, // 마커를 표시할 위치
						   title : pos.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						   image : markerImage, // 마커 이미지 
					       clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
					    });
					  
					  
					  $(document).on("click", "#lodging_tag1", function(){
							positions.forEach(function(pos) {
								marker.setMap(null)
							});
					  });
					  $(document).on("click", "#lodging_tag2", function(){
							positions.forEach(function(pos) {
								marker.setMap(null)
							});
					  });
					  $(document).on("click", "#lodging_tag3", function(){
							positions.forEach(function(pos) {
								marker.setMap(null)
							});
					  });
					  
					  
					  
					  kakao.maps.event.addListener(marker, 'click', function() {
						  customOverlay.setMap(map);
					  });
					  
					});
				

				
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(
								'제주특별자치도 제주시 공항로 2',
								function(result, status) {

									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) {

										var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new kakao.maps.Marker({
											map : map,
											position : coords
										});

										// 인포윈도우로 장소에 대한 설명을 표시합니다
										var infowindow = new kakao.maps.InfoWindow(
												{
													content : '<div style="width:150px;text-align:center;padding:6px 0;">제주국제공항</div>'
												});
										infowindow.open(map, marker);
										
										
										
										$(document).on("click", "#lodging_tag1", function(){
											positions.forEach(function(pos) {
												marker.setMap(null)
												infowindow.close();
											});
									  	});
									  	$(document).on("click", "#lodging_tag2", function(){
											positions.forEach(function(pos) {
												marker.setMap(null)
												infowindow.close();
											});
									  	});
									  	$(document).on("click", "#lodging_tag3", function(){
											positions.forEach(function(pos) {
												marker.setMap(null)
												infowindow.close();
											});
									  	});
									  	
									  	
									  	

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									}
								});
				
				});
			    
			    
			    
			    
			</script>
			
		</div>
		
		<div style=" height: 130px; ">
		</div>
		
	</div>

</body>
</html>