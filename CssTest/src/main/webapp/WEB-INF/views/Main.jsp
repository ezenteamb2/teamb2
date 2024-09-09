<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>

<link rel="stylesheet" href="<c:url value='/resources/css/Main.css'/>"> 

<!-- 스와이퍼 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<!-- 자바스크립트 -->
<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@ include file="/include/ChatBot.jsp" %>

<div style="text-align: center; width : 1500px; margin : 0px auto;">
	<!-- 여행추천 스와이퍼 -->
	<div style="margin-top: 40px; width: 1103px; left: 187px; position: relative; z-index: 0;">
		 <div class="swiper mySwiper" style="padding-top: 35px; padding-bottom: 35px;">
    		<div class="swiper-wrapper">
    			
    			
      			<div class="swiper-slide" style="width: 350px;">
      				<a href="https://www.tripadvisor.co.kr/Tourism-g293916-Bangkok-Vacations.html">
      					<img class="swiper_IMG" src="<c:url value='/resources/img/SwiperImg/Swiper1.png'/>">
      				</a>
      			</div>
      			
      			<div class="swiper-slide" style="width: 350px;">
      				<a href="https://www.tripadvisor.co.kr/Tourism-g294261-Cebu_Island_Visayas-Vacations.html">
      					<img class="swiper_IMG" src="<c:url value='/resources/img/SwiperImg/Swiper2.png'/>">
      				</a>
      			</div>
      			
      			<div class="swiper-slide" style="width: 350px;">
      				<a href="https://www.tripadvisor.co.kr/Tourism-g298307-Kota_Kinabalu_Kota_Kinabalu_District_West_Coast_Division_Sabah-Vacations.html">
      					<img class="swiper_IMG" src="<c:url value='/resources/img/SwiperImg/Swiper3.png'/>">
      				</a>
      			</div>
      			
      			<div class="swiper-slide" style="width: 350px;">
      				<a href="https://www.tripadvisor.co.kr/Tourism-g60668-Guam-Vacations.html">
      					<img class="swiper_IMG" src="<c:url value='/resources/img/SwiperImg/Swiper4.png'/>">
      				</a>
      			</div>
      			
      			<div class="swiper-slide" style="width: 350px;">
      				<a href="https://www.tripadvisor.co.kr/Tourism-g1673720-Bohol_Province_Visayas-Vacations.html">
      					<img class="swiper_IMG" src="<c:url value='/resources/img/SwiperImg/Swiper5.png'/>">
      				</a>
      			</div>
      			
      			<div class="swiper-slide" style="width: 350px; height: 178px;">
      				<a href="https://www.tripadvisor.co.kr/Tourism-g469418-Phu_Quoc_Island_Kien_Giang_Province-Vacations.html">
      					<img class="swiper_IMG" src="<c:url value='/resources/img/SwiperImg/Swiper6.png'/>">
      				</a>
      			</div>
      			
      			<div class="swiper-slide" style="width: 350px; height: 178px;">
      				<a href="https://www.tripadvisor.co.kr/Tourism-g311304-Sapa_Lao_Cai_Province-Vacations.html">
      					<img class="swiper_IMG" src="<c:url value='/resources/img/SwiperImg/Swiper7.png'/>">
      				</a>
      			</div>
      			
      			<div class="swiper-slide" style="width: 350px; height: 178px;">
      				<a href="https://www.tripadvisor.co.kr/Tourism-g293922-Da_Lat_Lam_Dong_Province-Vacations.html">
      					<img class="swiper_IMG" src="<c:url value='/resources/img/SwiperImg/Swiper8.png'/>">
      				</a>
      			</div>
      			
      			<div class="swiper-slide" style="width: 350px; height: 178px;">
      				<a href="https://www.tripadvisor.co.kr/Tourism-g293925-Ho_Chi_Minh_City-Vacations.html">
      					<img class="swiper_IMG" src="<c:url value='/resources/img/SwiperImg/Swiper9.png'/>">
      				</a>
      			</div>
      			
      			<div class="swiper-slide" style="width: 350px; height: 178px;">
      				<a href="https://www.tripadvisor.co.kr/Tourism-g1009804-Mui_Ne_Phan_Thiet_Binh_Thuan_Province-Vacations.html">
      					<img class="swiper_IMG" src="<c:url value='/resources/img/SwiperImg/Swiper10.png'/>">
      				</a>
      			</div>
      			
      			<div class="swiper-slide" style="width: 350px; height: 178px;">
      				<a href="https://www.tripadvisor.co.kr/Tourism-g298085-Da_Nang-Vacations.html">
      					<img class="swiper_IMG" src="<c:url value='/resources/img/SwiperImg/Swiper11.png'/>">
      				</a>
      			</div>
      			
      			<div class="swiper-slide" style="width: 350px; height: 178px;">
      				<a href="https://www.tripadvisor.co.kr/Tourism-g293924-Hanoi-Vacations.html">
      					<img class="swiper_IMG" src="<c:url value='/resources/img/SwiperImg/Swiper12.png'/>">
      				</a>
      			</div>
      			
      			
    		</div>
    		<div class="swiper-button-next" id="B_travel_nextBtn">
    			<img src="<c:url value='/resources/img/suggestion_hotel/icon/next.png'/>" style="width:30px; position:relative; left:3px;">
    		</div>
   			<div class="swiper-button-prev" id="B_travel_prevBtn">
   				<img src="<c:url value='/resources/img/suggestion_hotel/icon/prev.png'/>" style="width:30px; position:relative; right:3px;">
   			</div>
    		<div class="swiper-pagination"></div>
  		</div>
	</div>
	
	
	<!-- 이벤트/광고 스와이퍼 -->
	<div style="margin-top:40px; position: relative; z-index: 0; margin-bottom: 35px;">
		<div class="swiper EventSwiper">
			<div class="swiper-wrapper" style="padding: 30px;">
			
				<div class="swiper-slide">
					<img src="<c:url value='/resources/img/ad/ad1.jpg'/>" class="Event_img" /> 
				</div>
				
				<div class="swiper-slide">
					<img src="<c:url value='/resources/img/ad/ad2.jpg'/>" class="Event_img" />
				</div>
				
				<div class="swiper-slide">
					<img src="<c:url value='/resources/img/ad/ad3.jpg'/>" class="Event_img" />
				</div>
				
				<div class="swiper-slide">
					<img src="<c:url value='/resources/img/ad/ad4.jpg'/>" class="Event_img" />
				</div>
				
				<div class="swiper-slide">
					<img src="<c:url value='/resources/img/ad/ad5.png'/>" class="Event_img" />
				</div>
				
				<div class="swiper-slide">
					<img src="<c:url value='/resources/img/ad/ad6.png'/>" class="Event_img" />
				</div>
				
			</div>
			
  		</div>
	</div>
	
	<!-- 작은 여행추천 스와이퍼 -->
	<div style="position: relative; z-index: 0;">
	
		<div class="swiper Mini_Swiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide" style="padding: 30px 0px;">
					
					<a href="https://www.tripadvisor.co.kr/Tourism-g187147-Paris_Ile_de_France-Vacations.html">
					<div class="S_travel_div">
						<img src="<c:url value='/resources/img/travel_img/img1.jpg'/>" class="S_travel_img" />
						<div class="black_box"></div>
						<div class="S_travel_name">
							<span>파리</span>
						</div>
						<a class="Read_more_travle" href="https://www.tripadvisor.co.kr/Tourism-g187147-Paris_Ile_de_France-Vacations.html">더보기</a>
					</div>
					</a>
					
					<a href="https://www.tripadvisor.co.kr/Tourism-g298184-Tokyo_Tokyo_Prefecture_Kanto-Vacations.html">
					<div class="S_travel_div">
						<img src="<c:url value='/resources/img/travel_img/img2.jpg'/>" class="S_travel_img" />
						<div class="black_box"></div>
						<div class="S_travel_name">
							<span>도쿄</span>
						</div>
						<a class="Read_more_travle" href="https://www.tripadvisor.co.kr/Tourism-g298184-Tokyo_Tokyo_Prefecture_Kanto-Vacations.html">더보기</a>
					</div>
					</a>
					
					<a href="https://www.tripadvisor.co.kr/Tourism-g298566-Osaka_Osaka_Prefecture_Kinki-Vacations.html">
					<div class="S_travel_div">
						<img src="<c:url value='/resources/img/travel_img/img3.jpg'/>" class="S_travel_img" />
						<div class="black_box"></div>
						<div class="S_travel_name">
							<span>오사카</span>
						</div>
						<a class="Read_more_travle" href="https://www.tripadvisor.co.kr/Tourism-g298566-Osaka_Osaka_Prefecture_Kinki-Vacations.html">더보기</a>
					</div>
					</a>
					
					<a href="https://www.tripadvisor.co.kr/Tourism-g293916-Bangkok-Vacations.html">
					<div class="S_travel_div">
						<img src="<c:url value='/resources/img/travel_img/img4.jpg'/>" class="S_travel_img" />
						<div class="black_box"></div>
						<div class="S_travel_name">
							<span>방콕</span>
						</div>
						<a class="Read_more_travle" href="https://www.tripadvisor.co.kr/Tourism-g293916-Bangkok-Vacations.html">더보기</a>
					</div>					
				</div>
				
				<div class="swiper-slide" style="padding: 40px 0px 0px;">
					<a href="https://www.tripadvisor.co.kr/Tourism-g187497-Barcelona_Catalonia-Vacations.html">	
					<div class="S_travel_div">
						<img src="<c:url value='/resources/img/travel_img/img5.jpg'/>" class="S_travel_img" />
						<div class="black_box"></div>
						<div class="S_travel_name">
							<span>바르셀로나</span>
						</div>
						<a class="Read_more_travle" href="https://www.tripadvisor.co.kr/Tourism-g187497-Barcelona_Catalonia-Vacations.html">더보기</a>
					</div>
					</a>
					
					<a href="https://www.tripadvisor.co.kr/Tourism-g187791-Rome_Lazio-Vacations.html">
					<div class="S_travel_div">
						<img src="<c:url value='/resources/img/travel_img/img6.jpg'/>" class="S_travel_img" />
						<div class="black_box"></div>
						<div class="S_travel_name">
							<span>로마</span>
						</div>
						<a class="Read_more_travle" href="https://www.tripadvisor.co.kr/Tourism-g187791-Rome_Lazio-Vacations.html">더보기</a>
					</div>
					</a>
					
					<a href="https://www.tripadvisor.co.kr/Tourism-g298085-Da_Nang-Vacations.html">
					<div class="S_travel_div">
						<img src="<c:url value='/resources/img/travel_img/img7.jpg'/>" class="S_travel_img" />
						<div class="black_box"></div>
						<div class="S_travel_name">
							<span>다낭</span>
						</div>
						<a class="Read_more_travle" href="https://www.tripadvisor.co.kr/Tourism-g298085-Da_Nang-Vacations.html">더보기</a>
					</div>
					</a>
					
					<a href="https://www.tripadvisor.co.kr/Tourism-g186338-London_England-Vacations.html">
					<div class="S_travel_div">
						<img src="<c:url value='/resources/img/travel_img/img8.jpg'/>" class="S_travel_img" />
						<div class="black_box"></div>
						<div class="S_travel_name">
							<span>런던</span>
						</div>
						<a class="Read_more_travle" href="https://www.tripadvisor.co.kr/Tourism-g186338-London_England-Vacations.html">더보기</a>
					</div>
					</a>
					
									
				</div>
				
			</div>
			<div class="swiper-button-next" id="S_travel_nextBtn">
				<img src="<c:url value='/resources/img/suggestion_hotel/icon/next.png'/>" style="width:30px; position:relative; left:3px;">
			</div>
			<div class="swiper-button-prev" id="S_travel_prevBtn">
				<img src="<c:url value='/resources/img/suggestion_hotel/icon/prev.png'/>" style="width:30px; position:relative; right:3px;">
			</div>
		</div>
		
	</div>
	
	
	<!-- 광고 이벤트 2 -->

<div class="swiper mySwiper0" style="width: 1080px; position: relative; right: 10px; height: 165px; margin-top: 70px;">
	<div class="swiper-wrapper">
	
		<div class="swiper-slide" id="ad2_img_div">
			<img src="<c:url value='/resources/img/ad2/ad1.png'/>" style="height : 100%; width: 130%; position: relative; right: 130px;" />
		</div>
		
		<div class="swiper-slide" id="ad2_img_div">
			<img src="<c:url value='/resources/img/ad2/ad2.png'/>" style="height : 100%; width: 130%; position: relative;  right: 130px;" />
		</div>
		
		<div class="swiper-slide" id="ad2_img_div">
			<img src="<c:url value='/resources/img/ad2/ad3.gif'/>" style="height : 100%; width : 100%" />
		</div>
		
		<div class="swiper-slide" id="ad2_img_div">
			<img src="<c:url value='/resources/img/ad2/ad4.jpg'/>" style="height : 100%; width : 100%" />
		</div>
		
		<div class="swiper-slide" id="ad2_img_div">
			<img src="<c:url value='/resources/img/ad2/ad5.gif'/>" style="height : 100%; width : 100%" />
		</div>
		
		<div class="swiper-slide" id="ad2_img_div">
			<img src="<c:url value='/resources/img/ad2/ad6.jpg'/>" style="height : 100%; width : 100%" />
		</div>
		
		<div class="swiper-slide" id="ad2_img_div">
			<img src="<c:url value='/resources/img/ad2/ad7.jpg'/>" style="height : 100%; width : 100%" />
		</div>
		
		<div class="swiper-slide" id="ad2_img_div">
			<img src="<c:url value='/resources/img/ad2/ad8.jpg'/>" style="height : 100%; width : 100%" />
		</div>
		
	</div>
	<div class="swiper-pagination"></div>
</div>


<!-- 장거리 여행추천 -->
	<div style="margin-top: 50px;">
		<div class="long_distance_travel_title">
			장거리 여행추천
		</div>
		
		<div class="swiper mySwiper1" style="height: 250px; width: 784px; position: relative; left: 137px;">
			<div class="swiper-wrapper">
				
				
				<div class="swiper-slide" id="long_distance_travel_div">
					<a href="https://www.tripadvisor.co.kr/Tourism-g32655-Los_Angeles_California-Vacations.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/long_distance_travel/long_distance_travel_img1.jpg'/>" style="width: 200px;">
						<div class="long_travel_text">로스앤젤레스</div>
						<div class="long_distance_Shortcut">
							<p class="long_distance_travel_p">로스앤젤레스</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
				
				
				
				<div class="swiper-slide" id="long_distance_travel_div">
					<a href="https://www.tripadvisor.co.kr/Tourism-g186338-London_England-Vacations.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/long_distance_travel/long_distance_travel_img2.jpg'/>" style="width: 200px;">
						<div class="long_travel_text">런던</div>
						<div class="long_distance_Shortcut">
							<p class="long_distance_travel_p">런던</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
				
				
				
				<div class="swiper-slide" id="long_distance_travel_div">
					<a href="https://www.tripadvisor.co.kr/Tourism-g60713-San_Francisco_California-Vacations.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/long_distance_travel/long_distance_travel_img3.jpg'/>" style="width: 200px;">
						<div class="long_travel_text">샌프란시스코</div>
						<div class="long_distance_Shortcut">
							<p class="long_distance_travel_p">샌프란시스코</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
				
		
				
				<div class="swiper-slide" id="long_distance_travel_div">
					<a href="https://www.tripadvisor.co.kr/Tourism-g60763-New_York_City_New_York-Vacations.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/long_distance_travel/long_distance_travel_img4.jpg'/>" style="width: 200px;">
						<div class="long_travel_text">뉴욕</div>
						<div class="long_distance_Shortcut">
							<p class="long_distance_travel_p">뉴욕</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
				
				
				<div class="swiper-slide" id="long_distance_travel_div">
					<a href="https://www.tripadvisor.co.kr/Tourism-g187147-Paris_Ile_de_France-Vacations.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/long_distance_travel/long_distance_travel_img5.jpg'/>" style="width: 200px;">
						<div class="long_travel_text">파리</div>
						<div class="long_distance_Shortcut">
							<p class="long_distance_travel_p">파리</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
				
				
				<div class="swiper-slide" id="long_distance_travel_div">
					<a href="https://www.tripadvisor.co.kr/Tourism-g187497-Barcelona_Catalonia-Vacations.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/long_distance_travel/long_distance_travel_img6.png'/>" style="width: 200px;">
						<div class="long_travel_text">바르셀로나</div>
						<div class="long_distance_Shortcut">
							<p class="long_distance_travel_p">바르셀로나</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
				
				
				<div class="swiper-slide" id="long_distance_travel_div">
					<a href="https://www.tripadvisor.co.kr/Tourism-g187791-Rome_Lazio-Vacations.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/long_distance_travel/long_distance_travel_img7.jpg'/>" style="width: 200px;">
						<div class="long_travel_text">로마</div>
						<div class="long_distance_Shortcut">
							<p class="long_distance_travel_p">로마</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
				
				
				<div class="swiper-slide" id="long_distance_travel_div">
					<a href="https://www.tripadvisor.co.kr/Tourism-g28932-Hawaii-Vacations.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/long_distance_travel/long_distance_travel_img8.png'/>" style="width: 200px;">
						<div class="long_travel_text">하와이</div>
						<div class="long_distance_Shortcut">
							<p class="long_distance_travel_p">하와이</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
				
				
				<div class="swiper-slide" id="long_distance_travel_div">
					<a href="https://www.tripadvisor.co.kr/Tourism-g188045-Switzerland-Vacations.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/long_distance_travel/long_distance_travel_img9.jpg'/>" style="height: 200px;">
						<div class="long_travel_text">스위스</div>
						<div class="long_distance_Shortcut">
							<p class="long_distance_travel_p">스위스</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
				
				
			</div>
		</div>
		
		<div class="long_distance_travel_line">
				<img src="<c:url value='/resources/img/long_distance_travel/long_distance_travel_icon.png'/>" style="position: relative; height: 180px; right: 400px; bottom: 143px;">
		</div>

	</div>
	
	
<!-- 근거리 여행 추천 -->
<div style="margin-top: 20px;">
	
	<div class="short_distance_travel_title">
		근거리 여행추천
	</div>
	
	<div class="swiper mySwiper2" style="height: 250px; width: 784px; position: relative; right: 190px;">
		<div class="swiper-wrapper">
		
			<div class="swiper-slide" id="short_distance_travel_div">
				<a href="https://www.tripadvisor.co.kr/Tourism-g298207-Fukuoka_Fukuoka_Prefecture_Kyushu-Vacations.html" style="text-decoration: none;">
					<img src="<c:url value='/resources/img/short_distance_travel/short_distance_travel_img1.jpg'/>" style="width: 200px;">
					<div class="long_travel_text">후쿠오카</div>
					<div class="short_distance_Shortcut">
							<p class="long_distance_travel_p">후쿠오카</p>
							<p class="long_distance_travel_button">더보기</p>
					</div>
				</a>
			</div>
			
			<div class="swiper-slide" id="short_distance_travel_div">
				<a href="https://www.tripadvisor.co.kr/Tourism-g293916-Bangkok-Vacations.html" style="text-decoration: none;">
					<img src="<c:url value='/resources/img/short_distance_travel/short_distance_travel_img2.jpg'/>" style="width: 200px;">
					<div class="long_travel_text">방콕</div>
					<div class="short_distance_Shortcut">
							<p class="long_distance_travel_p">방콕</p>
							<p class="long_distance_travel_button">더보기</p>
					</div>
				</a>
			</div>
			
			<div class="swiper-slide" id="short_distance_travel_div">
				<a href="https://www.tripadvisor.co.kr/Tourism-g293924-Hanoi-Vacations.html" style="text-decoration: none;">
					<img src="<c:url value='/resources/img/short_distance_travel/short_distance_travel_img3.jpg'/>" style="width: 200px;">
					<div class="long_travel_text">하노이</div>
					<div class="short_distance_Shortcut">
							<p class="long_distance_travel_p">하노이</p>
							<p class="long_distance_travel_button">더보기</p>
					</div>
				</a>
			</div>
			
			<div class="swiper-slide" id="short_distance_travel_div">
				<a href="https://www.tripadvisor.co.kr/Tourism-g298560-Sapporo_Hokkaido-Vacations.html" style="text-decoration: none;">
					<img src="<c:url value='/resources/img/short_distance_travel/short_distance_travel_img4.jpg'/>" style="width: 200px;">
					<div class="long_travel_text">삿포로</div>
					<div class="short_distance_Shortcut">
							<p class="long_distance_travel_p">삿포로</p>
							<p class="long_distance_travel_button">더보기</p>
					</div>
				</a>
			</div>
			
			<div class="swiper-slide" id="short_distance_travel_div">
				<a href="https://www.tripadvisor.co.kr/Tourism-g298566-Osaka_Osaka_Prefecture_Kinki-Vacations.html" style="text-decoration: none;">
					<img src="<c:url value='/resources/img/short_distance_travel/short_distance_travel_img5.jpg'/>" style="width: 200px;">
					<div class="long_travel_text">오사카</div>
					<div class="short_distance_Shortcut">
							<p class="long_distance_travel_p">오사카</p>
							<p class="long_distance_travel_button">더보기</p>
					</div>
				</a>
			</div>
			
			<div class="swiper-slide" id="short_distance_travel_div">
				<a href="https://www.tripadvisor.co.kr/Tourism-g293917-Chiang_Mai-Vacations.html" style="text-decoration: none;">
					<img src="<c:url value='/resources/img/short_distance_travel/short_distance_travel_img6.jpg'/>" style="height: 200px;">
					<div class="long_travel_text">치앙마이</div>
					<div class="short_distance_Shortcut">
							<p class="long_distance_travel_p">치앙마이</p>
							<p class="long_distance_travel_button">더보기</p>
					</div>
				</a>
			</div>
			
			<div class="swiper-slide" id="short_distance_travel_div">
				<a href="https://www.tripadvisor.co.kr/Tourism-g294212-Beijing-Vacations.html" style="text-decoration: none;">
					<img src="<c:url value='/resources/img/short_distance_travel/short_distance_travel_img7.jpg'/>" style="height: 200px;">
					<div class="long_travel_text">베이징</div>
					<div class="short_distance_Shortcut">
							<p class="long_distance_travel_p">베이징</p>
							<p class="long_distance_travel_button">더보기</p>
					</div>
				</a>
			</div>
			
			<div class="swiper-slide" id="short_distance_travel_div">
				<a href="https://www.tripadvisor.co.kr/Tourism-g298085-Da_Nang-Vacations.html" style="text-decoration: none;">
					<img src="<c:url value='/resources/img/short_distance_travel/short_distance_travel_img8.jpg'/>" style="height: 200px;">
					<div class="long_travel_text">다낭</div>
					<div class="short_distance_Shortcut">
							<p class="long_distance_travel_p">다낭</p>
							<p class="long_distance_travel_button">더보기</p>
					</div>
				</a>
			</div>
			
			<div class="swiper-slide" id="short_distance_travel_div">
				<a href="https://www.tripadvisor.co.kr/Tourism-g294265-Singapore-Vacations.html" style="text-decoration: none;">
					<img src="<c:url value='/resources/img/short_distance_travel/short_distance_travel_img9.jpg'/>" style="width: 200px;">
					<div class="long_travel_text">싱가포르</div>
					<div class="short_distance_Shortcut">
							<p class="long_distance_travel_p">싱가포르</p>
							<p class="long_distance_travel_button">더보기</p>
					</div>
				</a>
			</div>
			
			<div class="swiper-slide" id="short_distance_travel_div">
				<a href="https://www.tripadvisor.co.kr/Tourism-g298184-Tokyo_Tokyo_Prefecture_Kanto-Vacations.html" style="text-decoration: none;">
					<img src="<c:url value='/resources/img/short_distance_travel/short_distance_travel_img10.jpg'/>" style="width: 200px;">
					<div class="long_travel_text">도쿄</div>
					<div class="short_distance_Shortcut">
							<p class="long_distance_travel_p">도쿄</p>
							<p class="long_distance_travel_button">더보기</p>
					</div>
				</a>
			</div>
			
		</div>
	</div>
	<div class="short_distance_travel_line">
		<img src="<c:url value='/resources/img/short_distance_travel/short_distance_travel_icon.png'/>" style="position: relative; height: 205px; left: 400px; bottom: 130px;">
	</div>
	
</div>



<div style="margin-top: 2	0px;">
		<div class="domestic_travel_title">
			국내 여행추천
		</div>
		
		<div class="swiper mySwiper1" style="height: 250px; width: 784px; position: relative; left: 137px;">
			<div class="swiper-wrapper">
				
				<div class="swiper-slide" id="domestic_travel_div">
					<a href="https://www.tripadvisor.co.kr/Tourism-g294197-Seoul-Vacations.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/domestic_travel/domestic_travel_img1.jpg'/>" style="width: 200px;">
						<div class="long_travel_text">서울</div>
						<div class="domestic_travel_Shortcut">
							<p class="long_distance_travel_p">서울</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
				
				<div class="swiper-slide" id="domestic_travel_div">
					<a href="https://www.tripadvisor.co.kr/Tourism-g297884-Busan-Vacations.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/domestic_travel/domestic_travel_img2.jpg'/>" style="width: 200px;">
						<div class="long_travel_text">부산</div>
						<div class="domestic_travel_Shortcut">
							<p class="long_distance_travel_p">부산</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
				
				<div class="swiper-slide" id="domestic_travel_div">
					<a href="https://www.tripadvisor.co.kr/Tourism-g297889-Incheon-Vacations.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/domestic_travel/domestic_travel_img3.jpg'/>" style="width: 200px;">
						<div class="long_travel_text">인천</div>
						<div class="domestic_travel_Shortcut">
							<p class="long_distance_travel_p">인천</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
				
				<div class="swiper-slide" id="domestic_travel_div">
					<a href="https://www.tripadvisor.co.kr/Tourism-g983296-Jeju_Island-Vacations.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/domestic_travel/domestic_travel_img4.jpg'/>" style="width: 200px;">
						<div class="long_travel_text">제주</div>
						<div class="domestic_travel_Shortcut">
							<p class="long_distance_travel_p">제주</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
				
				<div class="swiper-slide" id="domestic_travel_div">
					<a href="https://www.tripadvisor.co.kr/Tourism-g1143545-Jeonju_Jeollabuk_do-Vacations.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/domestic_travel/domestic_travel_img5.jpg'/>" style="width: 200px;">
						<div class="long_travel_text">전주</div>
						<div class="domestic_travel_Shortcut">
							<p class="long_distance_travel_p">전주</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
				
				<div class="swiper-slide" id="domestic_travel_div">
					<a href="https://www.tripadvisor.co.kr/Attraction_Review-g2024858-d2092656-Reviews-Ulleungdo-Ulleung_gun_Gyeongsangbuk_do.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/domestic_travel/domestic_travel_img6.jpg'/>" style="width: 200px;">
						<div class="long_travel_text">울릉도</div>
						<div class="domestic_travel_Shortcut">
							<p class="long_distance_travel_p">울릉도</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
				
				<div class="swiper-slide" id="domestic_travel_div">
					<a href="https://www.tripadvisor.co.kr/Attraction_Review-g2024858-d2092656-Reviews-Ulleungdo-Ulleung_gun_Gyeongsangbuk_do.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/domestic_travel/domestic_travel_img7.jpg'/>" style="width: 200px;">
						<div class="long_travel_text">여수</div>
						<div class="domestic_travel_Shortcut">
							<p class="long_distance_travel_p">여수</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
				
				<div class="swiper-slide" id="domestic_travel_div">
					<a href="https://www.tripadvisor.co.kr/Attraction_Review-g2024858-d2092656-Reviews-Ulleungdo-Ulleung_gun_Gyeongsangbuk_do.html" style="text-decoration: none;">
						<img src="<c:url value='/resources/img/domestic_travel/domestic_travel_img8.jpg'/>" style="width: 200px;">
						<div class="long_travel_text">경주</div>
						<div class="domestic_travel_Shortcut">
							<p class="long_distance_travel_p">경주</p>
							<p class="long_distance_travel_button">더보기</p>
						</div>
					</a>
				</div>
			
				
			</div>
		</div>
		
		<div class="domestic_travel_line"> 
				<img src="<c:url value='/resources/img/domestic_travel/domestic_travel_icon.png'/>" style="position: relative; height: 225px; right: 400px; bottom: 135px;">
		</div>

	</div>



<!-- 이벤트,광고3 -->
<div class="swiper mySwiper3" style="position: relative; right: 30px; margin-top: 140px;">
	<div class="swiper-wrapper">
	
		<div class="swiper-slide">
			<img src="<c:url value='/resources/img/ad3/ad1.jpg'/>"/>
		</div>
		
		<div class="swiper-slide">
			<img src="<c:url value='/resources/img/ad3/ad2.jpg'/>" />
		</div>
		
		<div class="swiper-slide">
			<img src="<c:url value='/resources/img/ad3/ad3.jpg'/>" />
		</div>
		
		<div class="swiper-slide">
			<img src="<c:url value='/resources/img/ad3/ad4.jpg'/>" />
		</div>
		
		<div class="swiper-slide">
			<img src="<c:url value='/resources/img/ad3/ad5.png'/>" />
		</div>
		
		<div class="swiper-slide">
			<img src="<c:url value='/resources/img/ad3/ad6.jpg'/>" />
		</div>
		
		<div class="swiper-slide">
			<img src="<c:url value='/resources/img/ad3/ad7.jpg'/>" />
		</div>
		
	</div>
	<div class="swiper-pagination"></div>
</div>


<!-- 해외 인기 호텔 -->
<div style="margin-top: 65px; position: relative; z-index: 1;">
	
	<div class="Popular_accommodations_title">
		해외 인기 호텔
	</div>
	
	<div class="Popular_accommodations_background2">
		<div class="Popular_accommodations_background">
			<img src="<c:url value='/resources/img/Popular_accommodations/Popular_accommodations_img0.jpg'/>" style="width: 100%; opacity: 20%;">
		</div>
	
		<div class="swiper mySwiper4" style="position: relative; left: 20px; bottom: 345px; width : 1055px; z-index: 2;">
			<div class="swiper-wrapper">
			
				<div class="swiper-slide" id="Popular_accommodations_div">
					<div> 
						<a href="https://hilton.co.kr/hotel/guam/hilton-guam-resort-and-spa" style="text-decoration: none; color:black">
							<img src="<c:url value='/resources/img/Popular_accommodations/Popular_accommodations_img1.jpg'/>" style="width: 255px;">
							<div class="Popular_accommodations_text">
								<p style="margin:0px; padding-top: 20px; padding-bottom: 10px;">[괌] 힐튼 괌 리조트 & 스파 </p>
								<p style="margin:0px; font-size: 11px; color: #929292;">괌 인기 리조트</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="swiper-slide" id="Popular_accommodations_div">
					<div>
						<a href="https://www.hyatt.com/hyatt-regency/ko-KR/hnlrw-hyatt-regency-waikiki-beach-resort-and-spa" style="text-decoration: none; color:black">
							<img src="<c:url value='/resources/img/Popular_accommodations/Popular_accommodations_img2.jpg'/>" style="width: 255px;">
							<div class="Popular_accommodations_text">
								<p style="margin:0px; padding-top: 20px; padding-bottom: 10px;">[호놀룰루] 하얏트 리젠시 와이키키</p>
								<p style="margin:0px; font-size: 11px; color: #929292;">와이키키 중심 하와이 베스트 셀러</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="swiper-slide" id="Popular_accommodations_div">
					<div>
						<a href="https://www.eastinhotelsresidences.com/ko/eastingrandsathornbangkok/accommodation" style="text-decoration: none; color:black">
							<img src="<c:url value='/resources/img/Popular_accommodations/Popular_accommodations_img3.jpg'/>" style="width: 255px;">
							<div class="Popular_accommodations_text">
								<p style="margin:0px; padding-top: 20px; padding-bottom: 10px;">[방콕] 이스틴 그랜드호텔 파야타이</p>
								<p style="margin:0px; font-size: 11px; color: #929292;">파야타이역 인기 NO.1 호텔</p>
							</div>
						</a>
					</div>
				</div>	
				
				<div class="swiper-slide" id="Popular_accommodations_div">
					<div>
						<a href="https://www.shangri-la.com/kr/cebu/mactanresort/" style="text-decoration: none; color:black">
							<img src="<c:url value='/resources/img/Popular_accommodations/Popular_accommodations_img4.jpg'/>" style="width: 255px;">
							<div class="Popular_accommodations_text">
								<p style="margin:0px; padding-top: 20px; padding-bottom: 10px;">[세부] 샹그릴라 막탄 세부</p>
								<p style="margin:0px; font-size: 11px; color: #929292;">세부 최고 인기 리조트</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="swiper-slide" id="Popular_accommodations_div">
					<div>
						<a href="https://sotetsu-hotels.com/ko/grand-fresa/namba/" style="text-decoration: none; color:black">
							<img src="<c:url value='/resources/img/Popular_accommodations/Popular_accommodations_img5.jpg'/>" style="width: 255px;">
							<div class="Popular_accommodations_text">
								<p style="margin:0px; padding-top: 20px; padding-bottom: 10px;">[오사카] 소테츠 그랜드 프레사 난바</p>
								<p style="margin:0px; font-size: 11px; color: #929292;">닛폿바시역 인기 호텔</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="swiper-slide" id="Popular_accommodations_div">
					<div>
						<a href="https://www.thepodhotel.com/pod-times-square/rooms" style="text-decoration: none; color:black">
							<img src="<c:url value='/resources/img/Popular_accommodations/Popular_accommodations_img6.jpg'/>" style="width: 255px;">
							<div class="Popular_accommodations_text">
								<p style="margin:0px; padding-top: 20px; padding-bottom: 10px;">[뉴욕] 포드 타임스 스퀘어 </p>
								<p style="margin:0px; font-size: 11px; color: #929292;">타임 스퀘어 중심 인기 호텔</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="swiper-slide" id="Popular_accommodations_div">
					<div>
						<a href="https://www.myboutiquehotel.com/en/boutique-hotels-shanghai/timeless-boutique-house-shanghai.html" style="text-decoration: none; color:black">
							<img src="<c:url value='/resources/img/Popular_accommodations/Popular_accommodations_img7.jpg'/>" style="width: 255px;">
							<div class="Popular_accommodations_text">
								<p style="margin:0px; padding-top: 20px; padding-bottom: 10px;">[상해] 타임리스 부티크 하우스 </p>
								<p style="margin:0px; font-size: 11px; color: #929292;">23년 12월 오픈 상해 신상호텔</p>
							</div>
						</a>
					</div>
				</div>
				
				<div class="swiper-slide" id="Popular_accommodations_div">
					<div>
						<a href="https://www.editionhotels.com/singapore/" style="text-decoration: none; color:black">
							<img src="<c:url value='/resources/img/Popular_accommodations/Popular_accommodations_img8.jpg'/>" style="width: 255px;">
							<div class="Popular_accommodations_text">
								<p style="margin:0px; padding-top: 20px; padding-bottom: 10px;">[싱가포르] 더 싱가포르 에디션</p>
								<p style="margin:0px; font-size: 11px; color: #929292;">23년 11월 오픈 럭셔리 호텔</p>
							</div>
						</a>
					</div>
				</div>
				
			</div>
		</div>
	</div>

</div>

<!-- 나라별 추천 호텔  -->
<div style="padding-top: 115px;">

	<div style="margin-top: 90px; width: 1208px; position: relative; left: 67px;">
		<div class="suggestion_hotel_title">
			나라별 추천 호텔
		</div>
		
		<div class="country_Btag">
			<div class="country_Stag" id="country_Tag1">동남아</div>
			<div class="country_Stag" id="country_Tag2">미주</div>
			<div class="country_Stag" id="country_Tag3">일본</div>
			<div class="country_Stag" id="country_Tag4">대만/홍콩/상해</div>
			<div class="country_Stag" id="country_Tag5">괌/사이판/호주</div>
			<div class="country_Stag" id="country_Tag6">유럽</div>	
		</div>
		
		
		<!-- 동남아 태그 -->
		<div class="Southeast_Asia_Tag">
			<div style="margin-top: 30px; float: left; position: relative; left: 30px; top:20px;">
				<p class="country_Name">동남아</p> 
				<img src="<c:url value='/resources/img/suggestion_hotel/hotel1/hotelMain.png'/>" style="width:200px; position: relative; bottom: 18px;">
			</div>
	
			<div class="swiper mySwiper5" style="width: 935px; position: relative; top: 20px; left: 75px; height: 270px;">
				<div class="swiper-wrapper" style="position: relative; right: 352px;">
				
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://nustar.ph/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel1/hotel1.jpg'/>" style="position: relative; right: 140px;">
							<div class="hotel_img_cover">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">세부</div>
									<div class="suggestion_hotel_name">필리 호텔 누스타</div>
									<div class="suggestion_hotel_EngName">Fili Hotel Nustar</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://grandmercuredanang.com/ko/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel1/hotel2.jpg'/>" style="position: relative; right: 31px; width: 229px;">
							<div class="hotel_img_cover" style="bottom: 343px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">다낭</div>
									<div class="suggestion_hotel_name">그랜드 머큐어</div>
									<div class="suggestion_hotel_EngName">Grand Mercure Danang</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.eastinhotelsresidences.com/ko/eastingrandsathornbangkok" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel1/hotel3.jpg'/>" style="position: relative; right: 100px; width: 343px;">
							<div class="hotel_img_cover" style="bottom: 271px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">방콕</div>
									<div class="suggestion_hotel_name">이스틴 그랜드 호텔 사톤</div>
									<div class="suggestion_hotel_EngName">Eastin Grand Hotel Sathorn</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.amoritaresort.com/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel1/hotel4.jpg'/>" style="position: relative; right: 124px; height: 270px;">
							<div class="hotel_img_cover" style="bottom: 270px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">보홀</div>
									<div class="suggestion_hotel_name">아모리타 리조트</div>
									<div class="suggestion_hotel_EngName">Amorita Resort</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.avanihotels.com/ko/riverside-bangkok/offers/riverside-advance-purchase" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel1/hotel5.jpg'/>" style="position: relative; right: 124px; height: 270px;">
							<div class="hotel_img_cover" style="bottom: 270px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">방콕</div>
									<div class="suggestion_hotel_name">아바니 수쿰빗 방콕 호텔</div>
									<div class="suggestion_hotel_EngName">AVANI Sukhumvit Bangkok Hotel</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://capedarapattaya.com/ko/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel1/hotel6.jpg'/>" style="position: relative; right: 124px; height: 270px;">
							<div class="hotel_img_cover" style="bottom: 270px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">파타야</div>
									<div class="suggestion_hotel_name">케이프 다라 리조트</div>
									<div class="suggestion_hotel_EngName">Cape Dara Resort</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.saiiresorts.com/phuket/laguna/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel1/hotel7.jpg'/>" style="position: relative; right: 124px; height: 270px;">
							<div class="hotel_img_cover" style="bottom: 270px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">푸켓</div>
									<div class="suggestion_hotel_name">사이 라구나</div>
									<div class="suggestion_hotel_EngName">SAii Laguna</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.carltonhotel.sg/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel1/hotel8.jpg'/>" style="position: relative; right: 35px; width: 223px;">
							<div class="hotel_img_cover" style="bottom: 335px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:76px;">싱가포르</div>
									<div class="suggestion_hotel_name">칼튼 호텔</div>
									<div class="suggestion_hotel_EngName">Carlton Hotel</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="swiper-button-next" id="suggestion_hotel_nextButton">
				<img src="<c:url value='/resources/img/suggestion_hotel/icon/next.png'/>" style="width: 26px;">
			</div>
			<div class="swiper-button-prev" id="suggestion_hotel_prevButton">
				<img src="<c:url value='/resources/img/suggestion_hotel/icon/prev.png'/>" style="width: 26px;">
			</div>
		</div>


		<!-- 미주 태그 -->
		<div class="Americas_tag" style="display : none">
			<div style="margin-top: 30px; float: left; position: relative; left: 30px; top:20px;">
				<p class="country_Name">미주</p> 
				<img src="<c:url value='/resources/img/suggestion_hotel/hotel2/hotelMain.png'/>" style="width:175px; position: relative; bottom: 50px;">
			</div>
	
			<div class="swiper mySwiper5" style="width: 935px; position: relative; top: 20px; left: 75px; height: 270px;">
				<div class="swiper-wrapper" style="position: relative; right: 352px;">
				
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://kr.alohilaniresort.com/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel2/hotel1.jpg'/>" style="position: relative; right: 140px;">
							<div class="hotel_img_cover">  
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">호놀룰루</div>
									<div class="suggestion_hotel_name">알로힐라니 리조트</div>
									<div class="suggestion_hotel_EngName">Alohilani Resort</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.thepodhotel.com/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel2/hotel2.jpg'/>" style="position: relative; right: 140px;">
							<div class="hotel_img_cover">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag">뉴욕</div>
									<div class="suggestion_hotel_name">포드 타임스 스퀘어</div>
									<div class="suggestion_hotel_EngName">Pod Time Square</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.hilton.com/ko/hotels/nycnhhh-new-york-hilton-midtown/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel2/hotel3.jpg'/>" style="position: relative; right: 140px;">
							<div class="hotel_img_cover" style="bottom: 294px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">뉴욕</div>
									<div class="suggestion_hotel_name">힐튼 미드타운</div>
									<div class="suggestion_hotel_EngName">Hilton Midtown</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.marriott.com/en-us/hotels/hnlks-sheraton-princess-kaiulani/overview/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel2/hotel4.jpg'/>" style="position: relative; right: 140px;">
							<div class="hotel_img_cover">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">호놀룰루</div>
									<div class="suggestion_hotel_name">쉐라톤 프린세스 카이울라니</div>
									<div class="suggestion_hotel_EngName">Sheraton Princess Kaiulani</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.hotelsorrento.com/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel2/hotel5.jpg'/>" style="position: relative; right: 140px; width: 435px;">
							<div class="hotel_img_cover" style="bottom: 290px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">시애틀</div>
									<div class="suggestion_hotel_name">호텔 소렌토</div>
									<div class="suggestion_hotel_EngName">Hotel Sorrento</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.thedarcyhotel.com/?chebs=gl-darcy" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel2/hotel6.jpg'/>" style="position: relative; right: 140px; width: 435px;">
							<div class="hotel_img_cover" style="bottom: 288px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">워싱턴</div>
									<div class="suggestion_hotel_name">더 달시 호텔</div>
									<div class="suggestion_hotel_EngName">The Darcy Hotel</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.hilton.com/ko/hotels/dcawhhh-washington-hilton/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel2/hotel7.jpg'/>" style="position: relative; right: 140px; width: 435px;">
							<div class="hotel_img_cover" style="bottom: 288px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">워싱턴</div>
									<div class="suggestion_hotel_name">힐튼 워싱턴</div>
									<div class="suggestion_hotel_EngName">Hilton Washington</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.marriott.com/en-us/hotels/boswi-the-westin-copley-place-boston/overview/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel2/hotel8.jpg'/>" style="position: relative; right: 140px; height: 289px;">
							<div class="hotel_img_cover" style="bottom: 288px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">보스턴</div>
									<div class="suggestion_hotel_name">웨스틴 코플리 플레이스</div>
									<div class="suggestion_hotel_EngName">Westin Copley Place</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					
					
				</div>
			</div>
			
			<div class="swiper-button-next" id="suggestion_hotel_nextButton">
				<img src="<c:url value='/resources/img/suggestion_hotel/icon/next.png'/>" style="width: 26px;">
			</div>
			<div class="swiper-button-prev" id="suggestion_hotel_prevButton">
				<img src="<c:url value='/resources/img/suggestion_hotel/icon/prev.png'/>" style="width: 26px;">
			</div>
		</div>
		
		
		<!-- 일본 태그 -->
		<div class="Japan_tag" style="display : none"> 
			<div style="margin-top: 30px; float: left; position: relative; left: 30px; top:20px;">
				<p class="country_Name" style="right: 50px;">일본</p>
				<img src="<c:url value='/resources/img/suggestion_hotel/hotel3/hotelMain.png'/>" style="width:263px; position: relative; bottom: 29px;">
			</div>
	
			<div class="swiper mySwiper5" style="width: 935px; position: relative; top: 20px; left: 75px; height: 270px;">
				<div class="swiper-wrapper" style="position: relative; right: 352px;">
				
					<div class="swiper-slide" id="suggestion_hotel_div"> 
						<a href="https://novotelokinawanaha.com/ko/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel3/hotel1.jpg'/>" style="position: relative; right: 140px;">
							<div class="hotel_img_cover">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">오키나와</div>
									<div class="suggestion_hotel_name">노보텔 오키나와 나하</div>
									<div class="suggestion_hotel_EngName">Novotel Okinawa Naha</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://sotetsu-hotels.com/ko/grand-fresa/namba/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel3/hotel2.jpg'/>" style="position: relative; right: 140px;">
							<div class="hotel_img_cover">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">오사카</div>
									<div class="suggestion_hotel_name">소테츠 그랜드 프레사 난바</div>
									<div class="suggestion_hotel_EngName">Sotetsu Grand Fresa Osaka-Namba</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://ginza.gracery.com/kr/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel3/hotel3.jpg'/>" style="position: relative; right: 45px; width: 267px; bottom: 78px;">
							<div class="hotel_img_cover" style="bottom: 356px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">도쿄</div>
									<div class="suggestion_hotel_name">그레이서리 긴자</div>
									<div class="suggestion_hotel_EngName">Gracery Ginza</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.tripadvisor.co.kr/Hotel_Review-g14135122-d558326-Reviews-Comfort_Hotel_Hakata-Hakataekimae_Hakata_Fukuoka_Fukuoka_Prefecture_Kyushu.html" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel3/hotel4.jpg'/>" style="position: relative; right: 190px;">
							<div class="hotel_img_cover" style="bottom: 300px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px;">후쿠오카</div>
									<div class="suggestion_hotel_name">컴포트 호텔 하카타</div>
									<div class="suggestion_hotel_EngName">Comfort Hotel Hakata</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://shinjuku-annex.washington-hotels.jp/kr/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel3/hotel5.jpg'/>" style="position: relative; right: 190px;">
							<div class="hotel_img_cover" style="bottom: 376px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px;">도쿄</div>
									<div class="suggestion_hotel_name">신주쿠 워싱턴 아넥스</div>
									<div class="suggestion_hotel_EngName">Shinjuku Washington Hotel</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://sapporo.gracery.com/kr/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel3/hotel6.jpg'/>" style="position: relative; right: 70px; width: 284px;">
							<div class="hotel_img_cover" style="bottom: 283px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px;">삿포로</div>
									<div class="suggestion_hotel_name">그레이서리 호텔 삿포로</div>
									<div class="suggestion_hotel_EngName">Gracery Hotel Sapporo</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://tam.tourvis.com/hotel/hotels/164122?in=20240927&out=20240928&guests=2" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel3/hotel7.jpg'/>" style="position: relative; right: 130px; width: 417px;">
							<div class="hotel_img_cover" style="bottom: 278px">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px;">나고야</div>
									<div class="suggestion_hotel_name">악텔 나고야니시키</div>
									<div class="suggestion_hotel_EngName">Actel Nagoyanishiki</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.princehotels.com/shinagawa/ko/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel3/hotel8.jpg'/>" style="position: relative; right: 130px; width: 417px;">
							<div class="hotel_img_cover" style="bottom: 278px">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px;">도쿄</div>
									<div class="suggestion_hotel_name">시나가와 프린스 호텔</div>
									<div class="suggestion_hotel_EngName">Shinagawa Prince Hotel</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
				</div>
			</div>
			
			<div class="swiper-button-next" id="suggestion_hotel_nextButton">
				<img src="<c:url value='/resources/img/suggestion_hotel/icon/next.png'/>" style="width: 26px;">
			</div>
			<div class="swiper-button-prev" id="suggestion_hotel_prevButton">
				<img src="<c:url value='/resources/img/suggestion_hotel/icon/prev.png'/>" style="width: 26px;">
			</div>
		</div>
		
		
		<!-- 대만/홍콩/상해 태그 -->
		<div class="china_tag" style="display : none">
			<div style="margin-top: 30px; float: left; position: relative; left: 30px; top:20px;">
				<p class="country_Name" style="font-size: 40px; left: 15px;">대만/홍콩/상해</p>
				<img src="<c:url value='/resources/img/suggestion_hotel/hotel4/hotelMain.png'/>" style="width: 167px; position: relative; bottom: 28px;">
			</div> 
	
			<div class="swiper mySwiper5" style="width: 935px; position: relative; top: 20px; left: 75px; height: 270px;">
				<div class="swiper-wrapper" style="position: relative; right: 352px;">
				
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://hongkong.regenthotels.com/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel4/hotel1.jpg'/>" style="position: relative; right: 110px; height: 270px;">
							<div class="hotel_img_cover" style="bottom:270px">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">홍콩</div>
									<div class="suggestion_hotel_name">리젠트 홍콩</div>
									<div class="suggestion_hotel_EngName">Regent Hong Kong</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.harbourgrand.com/hongkong/en/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel4/hotel2.jpg'/>" style="position: relative; right: 45px; height: 270px;">
							<div class="hotel_img_cover" style="bottom:270px">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">홍콩</div>
									<div class="suggestion_hotel_name">하버 그랜드 홍콩</div>
									<div class="suggestion_hotel_EngName">Harbour Grand Hong Kong</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://taipei.caesarpark.com.tw/kr/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel4/hotel3.jpg'/>" style="position: relative; right: 45px; height: 270px;">
							<div class="hotel_img_cover" style="bottom:270px">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">타이베이</div>
									<div class="suggestion_hotel_name">시저 파크 호텔</div>
									<div class="suggestion_hotel_EngName">Caesar Park Hotel</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.harbour-plaza.com/metropolitan-shanghai/en" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel4/hotel4.jpg'/>" style="position: relative; right: 40px; height: 350px; bottom : 70px;">
							<div class="hotel_img_cover" style="bottom:350px">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">상해</div>
									<div class="suggestion_hotel_name">하버 플라자 메트로폴리탄</div>
									<div class="suggestion_hotel_EngName">Harbour Plaza Metropolitan</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.harbourgrand.com/kowloon/en/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel4/hotel5.jpg'/>" style="position: relative; right: 45px; height: 270px;">
							<div class="hotel_img_cover" style="bottom:270px">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">홍콩</div>
									<div class="suggestion_hotel_name">하버그랜드 구룡</div>
									<div class="suggestion_hotel_EngName">Harbour Grand Kowloon</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.tripadvisor.com/Hotel_Review-g294212-d300154-Reviews-Novotel_Beijing_Peace-Beijing.html" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel4/hotel6.jpg'/>" style="position: relative; right: 45px; height: 270px;">
							<div class="hotel_img_cover" style="bottom:270px">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">북경</div>
									<div class="suggestion_hotel_name">노보텔 피스 베이징</div>
									<div class="suggestion_hotel_EngName">Novotel Peace Beijing</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.tripadvisor.com/Hotel_Review-g294212-d305370-Reviews-Sunworld_Dynasty_Hotel_Beijing_Wangfujing-Beijing.html" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel4/hotel7.jpg'/>" style="position: relative; right: 45px; height: 270px;">
							<div class="hotel_img_cover" style="bottom:270px">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">북경</div>
									<div class="suggestion_hotel_name">선월드 다이너스티</div>
									<div class="suggestion_hotel_EngName">Sunworld Dynasty</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://kaohsiung.chateaudechine.com/kr/index" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel4/hotel8.jpg'/>" style="position: relative; right: 45px; height: 270px;">
							<div class="hotel_img_cover" style="bottom:270px">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">가오슝</div>
									<div class="suggestion_hotel_name">샤토 드 쉰 호텔 가오슝</div>
									<div class="suggestion_hotel_EngName">Chateau de Chine Hotel Kaohsiung</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					
					
				</div>
			</div>
			
			<div class="swiper-button-next" id="suggestion_hotel_nextButton">
				<img src="<c:url value='/resources/img/suggestion_hotel/icon/next.png'/>" style="width: 26px;">
			</div>
			<div class="swiper-button-prev" id="suggestion_hotel_prevButton">
				<img src="<c:url value='/resources/img/suggestion_hotel/icon/prev.png'/>" style="width: 26px;">
			</div>
		</div>


<!-- 괌/사이판/호주 태그 -->
		<div class="Guam_tag" style="display : none">
			<div style="margin-top: 30px; float: left; position: relative; left: 30px; top:20px;">
				<p class="country_Name" style="font-size:42px">괌/사이판/호주</p>
				<img src="<c:url value='/resources/img/suggestion_hotel/hotel5/hotelMain.png'/>" style="width:263px; position: relative; bottom: 15px;">
			</div>
	
			<div class="swiper mySwiper5" style="width: 935px; position: relative; top: 20px; left: 75px; height: 270px;">
				<div class="swiper-wrapper" style="position: relative; right: 352px;">
				
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.ihg.com/crowneplaza/hotels/us/en/tamuning/gumcr/hoteldetail?cm_mmc=YextLocal-_-CP-_-GU-_-GUMCR" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel5/hotel1.jpg'/>" style="position: relative; right: 140px; height: 280px;">
							<div class="hotel_img_cover" style="bottom:280px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">괌</div>
									<div class="suggestion_hotel_name">크라운 플라자 리조트</div>
									<div class="suggestion_hotel_EngName">Crowne Plaza Resort</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="http://thetsubakitower.co.kr/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel5/hotel2.jpg'/>" style="position: relative; right: 140px; height: 280px;">
							<div class="hotel_img_cover" style="bottom:280px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">괌</div>
									<div class="suggestion_hotel_name">츠바키 타워</div>
									<div class="suggestion_hotel_EngName">The Tsubaki Tower</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://saipan.crowneplaza.com/ko/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel5/hotel3.jpg'/>" style="position: relative; right: 140px; height: 280px;">
							<div class="hotel_img_cover" style="bottom:280px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">사이판</div>
									<div class="suggestion_hotel_name">크라운 플라자 사이판</div>
									<div class="suggestion_hotel_EngName">Crowne Plaza Resort Saipan</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.picresorts.com/pic/?location=SAIPAN" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel5/hotel4.jpg'/>" style="position: relative; right: 140px; height: 280px;">
							<div class="hotel_img_cover" style="bottom:280px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">사이판</div>
									<div class="suggestion_hotel_name">퍼시픽 아일랜드 클럽</div>
									<div class="suggestion_hotel_EngName">Pacific Islands Club</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://veriu.com.au/hotels/veriu-broadway/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel5/hotel5.jpg'/>" style="position: relative; right: 140px; height: 280px;">
							<div class="hotel_img_cover" style="bottom:280px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">시드니</div>
									<div class="suggestion_hotel_name">베리우 브로드웨이</div>
									<div class="suggestion_hotel_EngName">Veriu Broadway</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.furama.com/darlingharbour/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel5/hotel6.jpg'/>" style="position: relative; right: 190px; height: 280px;">
							<div class="hotel_img_cover" style="bottom:280px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">시드니</div>
									<div class="suggestion_hotel_name">푸라마 달링 하버</div>
									<div class="suggestion_hotel_EngName">Furama Darling Harbour</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.radissonhotels.com/en-us/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel5/hotel7.jpg'/>" style="position: relative; right: 35px; height: 320px;">
							<div class="hotel_img_cover" style="bottom:320px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">멜버른</div>
									<div class="suggestion_hotel_name">레디슨 온 플래그스태프 가든스</div>
									<div class="suggestion_hotel_EngName">Radisson On Flagstaff Gardens</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://gettothepoint.com.au/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel5/hotel8.jpg'/>" style="position: relative; right: 30px; height: 335px; bottom:65px">
							<div class="hotel_img_cover" style="bottom:335px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">브리즈번</div>
									<div class="suggestion_hotel_name">포인트 브리즈번</div>
									<div class="suggestion_hotel_EngName">Point Brisbane</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
				</div>
			</div>
			
			<div class="swiper-button-next" id="suggestion_hotel_nextButton">
				<img src="<c:url value='/resources/img/suggestion_hotel/icon/next.png'/>" style="width: 26px;">
			</div>
			<div class="swiper-button-prev" id="suggestion_hotel_prevButton">
				<img src="<c:url value='/resources/img/suggestion_hotel/icon/prev.png'/>" style="width: 26px;">
			</div>
		</div>
		

		<!-- 유럽 태그 -->
		<div class="europe_tag" style="display : none">
			<div style="margin-top: 30px; float: left; position: relative; left: 30px; top:20px;">
				<p class="country_Name" style="right: 50px;">유럽</p>
				<img src="<c:url value='/resources/img/suggestion_hotel/hotel6/hotelMain.png'/>" style="width:263px; position: relative; bottom: 15px;">
			</div>
	
			<div class="swiper mySwiper5" style="width: 935px; position: relative; top: 20px; left: 75px; height: 270px;">
				<div class="swiper-wrapper" style="position: relative; right: 352px;">
				
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.h10hotels.com/en/london-hotels/h10-london-waterloo?utm_source=google_my_business&utm_medium=boton_sitio_web&utm_campaign=hlw" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel6/hotel1.jpg'/>" style="position: relative; right: 35px; height: 305px;">
							<div class="hotel_img_cover" style="bottom:305px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">런던</div>
									<div class="suggestion_hotel_name">H10 런던 워털루</div>
									<div class="suggestion_hotel_EngName">H10 London Waterloo</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.themozart.com/?l=ko" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel6/hotel2.jpg'/>" style="position: relative; right: 35px; height: 305px;">
							<div class="hotel_img_cover" style="bottom:305px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">프라하</div>
									<div class="suggestion_hotel_name">더 모차르트 프라그</div>
									<div class="suggestion_hotel_EngName">The Mozart Prague</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.iqhotelroma.it/ko" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel6/hotel3.jpg'/>" style="position: relative; right: 35px; height: 305px;">
							<div class="hotel_img_cover" style="bottom:305px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">로마</div>
									<div class="suggestion_hotel_name">IQ 호텔 로마</div>
									<div class="suggestion_hotel_EngName">iQ Hotel Roma</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://all.accor.com/hotel/7229/index.ko.shtml?utm_campaign=seo+maps&utm_medium=seo+maps&utm_source=google+Maps" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel6/hotel4.jpg'/>" style="position: relative; right: 195px; height: 305px;">
							<div class="hotel_img_cover" style="bottom:305px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">파리</div>
									<div class="suggestion_hotel_name">풀먼 파리 타워 에펠</div>
									<div class="suggestion_hotel_EngName">Pullman Paris Tour Eiffel</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.starhotels.com/en/our-hotels/michelangelo-rome/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel6/hotel5.jpg'/>" style="position: relative; right: 195px; height: 305px;">
							<div class="hotel_img_cover" style="bottom:305px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">로마</div>
									<div class="suggestion_hotel_name">스타 호텔 미켈란젤로</div>
									<div class="suggestion_hotel_EngName">Starhotel Michelangelo</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.hotel-grandior.cz/en/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel6/hotel6.jpg'/>" style="position: relative; right: 115px; height: 305px;">
							<div class="hotel_img_cover" style="bottom:305px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">프라하</div>
									<div class="suggestion_hotel_name">그란디오르호텔</div>
									<div class="suggestion_hotel_EngName">Grandior Hotel</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.poloniapalace.com/" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel6/hotel7.jpg'/>" style="position: relative; right: 115px; height: 305px;">
							<div class="hotel_img_cover" style="bottom:305px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">바르샤바</div>
									<div class="suggestion_hotel_name">폴로니아 팰리스</div>
									<div class="suggestion_hotel_EngName">Polonia Palace</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="swiper-slide" id="suggestion_hotel_div">
						<a href="https://www.whythebesthotels.com/en/firenze-hotel-orologio/index" style="width: 215px; margin: 0px 30px; color: white; text-decoration: none;">
							<img src="<c:url value='/resources/img/suggestion_hotel/hotel6/hotel8.jpg'/>" style="position: relative; right: 50px; height: 305px;">
							<div class="hotel_img_cover" style="bottom:305px;">
								<div style="position: relative; top: 45px;">
									<div class="suggestion_hotel_cityTag" style="width:64px; left:74px">피렌체</div>
									<div class="suggestion_hotel_name">로롤로지오 호텔</div>
									<div class="suggestion_hotel_EngName">L`Orologio Hotel</div>
									<div class="suggestion_hotel_ReadMore">더보기</div>
								</div>
							</div>
						</a>
					</div>
					
				
					
				</div>
			</div>
			
			<div class="swiper-button-next" id="suggestion_hotel_nextButton">
				<img src="<c:url value='/resources/img/suggestion_hotel/icon/next.png'/>" style="width: 26px;">
			</div>
			<div class="swiper-button-prev" id="suggestion_hotel_prevButton">
				<img src="<c:url value='/resources/img/suggestion_hotel/icon/prev.png'/>" style="width: 26px;">
			</div>
		</div>



	</div>
	
	
	<div class="suggestion_hotel_bar"></div>
</div>
</div>

<div class="footer" style="text-align: center">
		footer
</div>

<script>
	
	$(function(){
		
		/* 동남아 태그 클릭 */
		$("#country_Tag1").on("click",function(){
			$(".Southeast_Asia_Tag").css("display","block"); 
			$("#country_Tag1").css({"background":"#000000" , "color":"white"});
		 
			$(".Americas_tag").css("display","none");
			$("#country_Tag2").css({"background":"#fff" , "color":"black"});
			
			$(".Japan_tag").css("display","none");
			$("#country_Tag3").css({"background":"#fff" , "color":"black"}); 
			
			$(".china_tag").css("display","none");
			$("#country_Tag4").css({"background":"#fff" , "color":"black"});
			
			$(".Guam_tag").css("display","none");
			$("#country_Tag5").css({"background":"#fff" , "color":"black"});
			
			$(".europe_tag").css("display","none");
			$("#country_Tag6").css({"background":"#fff" , "color":"black"});
		});
		
		
		/* 미주 태그 클릭 */
		$("#country_Tag2").on("click",function(){
			$(".Americas_tag").css("display","block");
			$("#country_Tag2").css({"background":"#000000" , "color":"white"});
			
			$(".Southeast_Asia_Tag").css("display","none");
			$("#country_Tag1").css({"background":"#fff" , "color":"black"});
			
			$(".Japan_tag").css("display","none");
			$("#country_Tag3").css({"background":"#fff" , "color":"black"});
			
			$(".china_tag").css("display","none");
			$("#country_Tag4").css({"background":"#fff" , "color":"black"});
			
			$(".Guam_tag").css("display","none");
			$("#country_Tag5").css({"background":"#fff" , "color":"black"});
			
			$(".europe_tag").css("display","none");
			$("#country_Tag6").css({"background":"#fff" , "color":"black"});
		});
		
		
		/* 일본 태그 클릭 */
		$("#country_Tag3").on("click",function(){
			$(".Japan_tag").css("display","block");
			$("#country_Tag3").css({"background":"#000000" , "color":"white"});
			
			$(".Southeast_Asia_Tag").css("display","none");
			$("#country_Tag1").css({"background":"#fff" , "color":"black"});
			
			$(".Americas_tag").css("display","none");
			$("#country_Tag2").css({"background":"#fff" , "color":"black"});
			
			$(".china_tag").css("display","none");
			$("#country_Tag4").css({"background":"#fff" , "color":"black"});
			
			$(".Guam_tag").css("display","none");
			$("#country_Tag5").css({"background":"#fff" , "color":"black"});
			
			$(".europe_tag").css("display","none");
			$("#country_Tag6").css({"background":"#fff" , "color":"black"});
		});
		
		
		/* 대만/홍콩/상해 태그 클릭 */
		$("#country_Tag4").on("click",function(){
			$(".china_tag").css("display","block");
			$("#country_Tag4").css({"background":"#000000" , "color":"white"});
			
			$(".Southeast_Asia_Tag").css("display","none");
			$("#country_Tag1").css({"background":"#fff" , "color":"black"});
			
			$(".Americas_tag").css("display","none");
			$("#country_Tag2").css({"background":"#fff" , "color":"black"});
			
			$(".Japan_tag").css("display","none");
			$("#country_Tag3").css({"background":"#fff" , "color":"black"});
			
			$(".Guam_tag").css("display","none");
			$("#country_Tag5").css({"background":"#fff" , "color":"black"});
			
			$(".europe_tag").css("display","none");
			$("#country_Tag6").css({"background":"#fff" , "color":"black"});
		});
		
		
		/* 괌/사이판/호주 태그 클릭 */
		$("#country_Tag5").on("click",function(){
			$(".Guam_tag").css("display","block");
			$("#country_Tag5").css({"background":"#000000" , "color":"white"});
			
			$(".Southeast_Asia_Tag").css("display","none");
			$("#country_Tag1").css({"background":"#fff" , "color":"black"});
			
			$(".Americas_tag").css("display","none");
			$("#country_Tag2").css({"background":"#fff" , "color":"black"});
			
			$(".Japan_tag").css("display","none");
			$("#country_Tag3").css({"background":"#fff" , "color":"black"});
			
			$(".china_tag").css("display","none");
			$("#country_Tag4").css({"background":"#fff" , "color":"black"});
			
			$(".europe_tag").css("display","none");
			$("#country_Tag6").css({"background":"#fff" , "color":"black"});
		});
		
		
		/* 유럽 태그 클릭 */
		$("#country_Tag6").on("click",function(){
			$(".europe_tag").css("display","block");
			$("#country_Tag6").css({"background":"#000000" , "color":"white"});
			
			$(".Southeast_Asia_Tag").css("display","none");
			$("#country_Tag1").css({"background":"#fff" , "color":"black"});
			
			$(".Americas_tag").css("display","none");
			$("#country_Tag2").css({"background":"#fff" , "color":"black"});
			
			$(".Japan_tag").css("display","none");
			$("#country_Tag3").css({"background":"#fff" , "color":"black"});
			
			$(".china_tag").css("display","none");
			$("#country_Tag4").css({"background":"#fff" , "color":"black"});
			
			$(".Guam_tag").css("display","none");
			$("#country_Tag5").css({"background":"#fff" , "color":"black"});
		});
		
		
	})
	
</script>


<script>
	
	
	/* 여행추천 스와이퍼 */
	var swiper = new Swiper(".mySwiper", {
	slidesPerView: "auto",
    spaceBetween: 30,
    effect: "coverflow",
    loop: true,
    coverflowEffect: {
        rotate: 30,
        stretch: 0,
        depth: 300,
        modifier: 1,
        slideShadows: true,
      },
    autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    }
  });
	
	
	/* 광고/이벤트 스와이퍼 */
	var swiper = new Swiper(".EventSwiper", {
		spaceBetween: 30,
		effect: "fade",
		autoplay: {
	        delay: 2500,
	        disableOnInteraction: false,
	    },
		navigation: {
  			nextEl: ".EventSwiper-button-next",
 			prevEl: ".EventSwiper-button-prev",
		},
		pagination: {
  			el: ".EventSwiper-pagination",
  			clickable: true,
		},
	});
	
	
	/* 작은 여행추천 스와이퍼 */
     var swiper = new Swiper(".Mini_Swiper", {
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
	
	
	/* 광고,이벤트2 스와이퍼 */
	var swiper = new Swiper(".mySwiper0", {
	  slidesPerView: "auto",
      spaceBetween: 30,
      effect: "fade",
      autoplay: {
	        delay: 2500,
	        disableOnInteraction: false,
	  },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
    });
	
	
	/* 장거리 여행추천 */
     var swiper = new Swiper(".mySwiper1", {
         slidesPerView: 3,
         spaceBetween: 30,
         pagination: {
           el: ".swiper-pagination",
           clickable: true,
         },
       });
	
	
	/* 단거리 여행추천 */
	var swiper = new Swiper(".mySwiper2", {
      slidesPerView: 3,
      spaceBetween: 30,
      freeMode: true,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
    });
	
	
	/* 이벤트,광고3 */
	var swiper = new Swiper(".mySwiper3", {
	  slidesPerView: "auto",
      spaceBetween: 30,
      effect: "fade",
      autoplay: {
	        delay: 2500,
	        disableOnInteraction: false,
	  },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
    });
	
	
	/* 해외 인기 호텔 */
    var swiper = new Swiper(".mySwiper4", {
      slidesPerView: 3,
      spaceBetween: 30,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
    });
	
	
	/* 나라별 추천 호텔 */
    var swiper = new Swiper(".mySwiper5", {
    	slidesPerView: 5,
        spaceBetween: 50,
        loop: true,
        centeredSlides: true,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
      }
    });

	
	
 </script>


</body>

</html>