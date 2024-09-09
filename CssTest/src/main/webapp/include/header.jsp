<%@page import="com.csstest.teamb.VO.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    userVO loggedInUser = (userVO)session.getAttribute("loggedInUser");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<c:url value="/resources/css/header.css"/>">

<!-- 자바스크립트 -->
<script src="<c:url value="/resources/js/jquery-3.7.1.min.js"/>"></script>
<!-- 스와이퍼 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에어두드림</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=614fd20715bf3f9615678e12eaf79349&libraries=services"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<link href="<c:url value="/resources/img/Title_img/Titleimg.png"/>" rel="shortcut icon" type="image/x-icon">

</head>

<script>

	$(function(){
		
		$(".hidden_img").on("mouseover", function(){
			
			$(".span_name").css("margin-left","60px");
			$(".title_img").css("display","block");
			$(".title_img2").css("display","block");
			$(".title_img3").css("display","block");
			$(".title_img4_1").css("display","block");
			$(".title_img4_2").css("display","block");
			$(".title_img4_3").css("display","block");
			$(".title_img4_4").css("display","block");
			$(".title_img4_5").css("display","block");
			
		});
		
		$(".hidden_img").on("mouseout", function(){
			
			$(".span_name").css("margin-left","0px");
			$(".title_img").css("display","none");
			$(".title_img2").css("display","none");
			$(".title_img3").css("display","none");
			$(".title_img4_1").css("display","none");
			$(".title_img4_2").css("display","none");
			$(".title_img4_3").css("display","none");
			$(".title_img4_4").css("display","none");
			$(".title_img4_5").css("display","none");
			
		});
		
		/* 항공 태그 */
		$(".transportation_tag").on("mouseover", function(){
			$(".tag_img").css("display","none");
			$(".tag_video").css("display","inline-block");
		})
		$(".transportation_tag").on("mouseout", function(){
			$(".tag_img").css("display","inline-block");
			$(".tag_video").css("display","none");
		})
		
		/* 열차 태그 */
		$(".transportation_tag2").on("mouseover", function(){
			$(".tag_img2").css("display","none");
			$(".tag_video2").css("display","inline-block");
		})
		$(".transportation_tag2").on("mouseout", function(){
			$(".tag_img2").css("display","inline-block");
			$(".tag_video2").css("display","none");
		})
		
		/* 버스 태그 */
		$(".transportation_tag3").on("mouseover", function(){
			$(".tag_img3").css("display","none");
			$(".tag_video3").css("display","inline-block");
		})
		$(".transportation_tag3").on("mouseout", function(){
			$(".tag_img3").css("display","inline-block");
			$(".tag_video3").css("display","none");
		})
		
		/* 숙박 태그 */
		$(".transportation_tag4").on("mouseover", function(){
			$(".tag_img4").css("display","none");
			$(".tag_video4").css("display","inline-block");
		})
		$(".transportation_tag4").on("mouseout", function(){
			$(".tag_img4").css("display","inline-block");
			$(".tag_video4").css("display","none");
		})
		
		
	});

	
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('.header_hidden_div').fadeIn();
			} else {
				$('.header_hidden_div').fadeOut();
			}
		});
	});
	
	
	/* 버스 태그 클릭 */
	$(function(){
		
		
		
		$(".transportation_tag3").on("click",function(){
			
			if($(".AirportBus").css("filter") == "opacity(0)"){
				
				$(".AirportBus").css({
					"transform" : "translate(-85px, 55px)",
					"filter" : "opacity(1)",
					"visibility" : "visible"
					
				})
				
				setTimeout(function(){
					$(".IntercityBus").css({
						"transform" : "translate(84px, 118px)",
						"filter" : "opacity(1)",
						"visibility" : "visible"
					})
				}, 100);
				
			}
			
			if($(".AirportBus").css("filter") == "opacity(1)"){
				
				$(".AirportBus").css({
					"transform" : "translate(4px, 2px)",
					"filter" : "opacity(0)",
					"visibility" : "hidden"
				})
				
				$(".IntercityBus").css({
					"transform" : "translate(-3px, 67px)",
					"filter" : "opacity(0)",
					"visibility" : "hidden"
				})
				
			}
			
			$(".Flight_schedule_Tag").css({
				"transform" : "translate(4px, 2px)",
				"filter" : "opacity(0)",
				"visibility" : "hidden"
			})
			
			
			$(".RealTime_Flight_schedule_Tag").css({
				"transform" : "translate(4px, 11px)",
				"filter" : "opacity(0)",
				"visibility" : "hidden"
			})
			
		});
		
		
		
		
		$(".AirportBus").on("mouseover", function(){
			$(".AirportBus_img").css("display","none");
			$(".AirportBus_video").css("display","inline-block");
		})
		$(".AirportBus").on("mouseout", function(){
			$(".AirportBus_img").css("display","inline-block");
			$(".AirportBus_video").css("display","none");
		})
		
		
		$(".ExpressbBus").on("mouseover", function(){
			$(".ExpressbBus_img").css("display","none");
			$(".ExpressbBus_video").css("display","inline-block");
		})
		$(".ExpressbBus").on("mouseout", function(){
			$(".ExpressbBus_img").css("display","inline-block");
			$(".ExpressbBus_video").css("display","none");
		})
		
		
		$(".IntercityBus").on("mouseover", function(){
			$(".IntercityBus_img").css("display","none");
			$(".IntercityBus_video").css("display","inline-block");
		})
		$(".IntercityBus").on("mouseout", function(){
			$(".IntercityBus_img").css("display","inline-block");
			$(".IntercityBus_video").css("display","none");
		})
		
	})
	
	/* 숨겨진 버스 태그 */
	$(function(){
		$(".hidden_busTag").on("click",function(){
			$("#Header_BusTag").css("transform","translate(85px, 0px)")
			$(".hidden_SbusTag").css("transform","translate(87px, 0px)")
		})
		
		$(document).on("click",".BusTag_prevBtn",function(){
			$("#Header_BusTag").css("transform","translate(0px, 0px)")
			$(".hidden_SbusTag").css("transform","translate(0px, 0px)")
		})
	})
	
	
	
	/* 항공 태그 클릭 */
	$(function(){
		
		$(".transportation_tag").on("click",function(){
			
			if($(".Flight_schedule_Tag").css("filter") == "opacity(0)"){
				
				$(".Flight_schedule_Tag").css({
					"transform" : "translate(-40px, 55px)",
					"filter" : "opacity(1)",
					"visibility" : "visible"
					
				})
				
				setTimeout(function(){
					$(".RealTime_Flight_schedule_Tag").css({
						"transform" : "translate(120px, 55px)",
						"filter" : "opacity(1)",
						"visibility" : "visible"
					})
				}, 100);
				
			}
			
			if($(".Flight_schedule_Tag").css("filter") == "opacity(1)"){
				
				$(".Flight_schedule_Tag").css({
					"transform" : "translate(4px, 2px)",
					"filter" : "opacity(0)",
					"visibility" : "hidden"
				})
				
				
				$(".RealTime_Flight_schedule_Tag").css({
					"transform" : "translate(4px, 11px)",
					"filter" : "opacity(0)",
					"visibility" : "hidden"
				})
				
				
			}
			
			
			$(".AirportBus").css({
				"transform" : "translate(4px, 2px)",
				"filter" : "opacity(0)",
				"visibility" : "hidden"
			})
			
			
			$(".ExpressbBus").css({
				"transform" : "translate(4px, 11px)",
				"filter" : "opacity(0)",
				"visibility" : "hidden"
			})
			
			
			$(".IntercityBus").css({
				"transform" : "translate(4px, 20px)",
				"filter" : "opacity(0)",
				"visibility" : "hidden"
			})
				
		});
		
		
		
		$(".Flight_schedule_Tag").on("mouseover", function(){
			$(".Flight_schedule_img").css("display","none");
			$(".Flight_schedule_video").css("display","inline-block");
		})
		$(".Flight_schedule_Tag").on("mouseout", function(){
			$(".Flight_schedule_img").css("display","inline-block");
			$(".Flight_schedule_video").css("display","none");
		})
		
		
		$(".RealTime_Flight_schedule_Tag").on("mouseover", function(){
			$(".RealTime_Flight_schedule_img").css("display","none");
			$(".RealTime_Flight_schedule_video").css("display","inline-block");
		})
		$(".RealTime_Flight_schedule_Tag").on("mouseout", function(){
			$(".RealTime_Flight_schedule_img").css("display","inline-block");
			$(".RealTime_Flight_schedule_video").css("display","none");
		})
		
	})
	
	/* 숨겨진 항공 태그 */
	$(function(){
		$(".hidden_airTag").on("click",function(){
			$("#Header_AirTag").css("transform","translate(85px, 0px)")
			$(".hidden_SAirTag").css("transform","translate(87px, 0px)")
		})
		
		$(document).on("click",".AirTag_prevBtn",function(){
			$("#Header_AirTag").css("transform","translate(0px, 0px)")
			$(".hidden_SAirTag").css("transform","translate(0px, 0px)")
		})
	})
	
	
</script>

<body>
<div class="header_hidden_div">
	<div class="header_hidden_sDiv">
		
		<a href="<c:url value='/'/>" style="text-decoration: none; z-index:10;">
			<div class="Main_title" style="position: absolute; bottom: 5px; padding-left: 96px;">Air.
				<span class="span_name">두드림</span>
			</div>
		</a>
		
		<div class="header_hidden_tagDiv">
		
			<div class="hidden_airTag" style="margin-right: 31px;">
				<div class="hidden_tag"  id="Header_AirTag" style="margin:0px;">
					<img src="<c:url value="/resources/img/Title_img/hidden_title_img.png"/>" class="hidden_title_img">
					항공
				</div>
				
				<div class="hidden_SAirTag">
					<a href="<c:url value="/air/flight-schedule"/>" style="color:black; text-decoration: none;">
						<div class="AirTag_title">
							운항스케줄
						</div>
					</a>
					
					<a href="<c:url value='/airport.do'/>" style="color:black; text-decoration: none;">
						<div class="AirTag_title">
							실시간 운항
						</div>
					</a>
					
					<div class="AirTag_prevBtn">
						<img src="<c:url value="/resources/img/suggestion_hotel/icon/prev.png"/>" style="width: 10px; position: relative; top: 28px;">
					</div>
				</div>
			
			</div>
			
			
			<a href="#" style="color: black; text-decoration: none;">
				<div class="hidden_tag">
					<img src="<c:url value="/resources/img/Title_img/hidden_title_img2.png"/>" class="hidden_title_img">
					열차
				</div>
			</a>
			
			<div class="hidden_busTag" style="margin-right: 31px;">
				<div class="hidden_tag" id="Header_BusTag" style="margin:0px;">
					<img src="<c:url value="/resources/img/Title_img/hidden_title_img3.png"/>" class="hidden_title_img">
					버스
				</div>
				
				<div class="hidden_SbusTag">
					<a href="<c:url value='#'/>" style="color:black; text-decoration: none; font-size:13px;">
						<div class="busTag_title">
							공항버스
						</div>
					</a>
					<a href="<c:url value='#'/>" style="color:black; text-decoration: none;">
						<div class="busTag_title">
							고속,시외버스
						</div>
					</a>
					
					<div class="BusTag_prevBtn">
						<img src="<c:url value="/resources/img/suggestion_hotel/icon/prev.png"/>" style="width: 10px; position: relative; top: 28px;">
					</div>
				</div>
				
			</div>
				
			<a href="<c:url value="/lodging.do"/>" style="color: black; text-decoration: none;">
				<div class="hidden_tag">
					<img src="<c:url value="/resources/img/Title_img/hidden_title_img4.png"/>" class="hidden_title_img">
					숙소
				</div>
			</a>
			
			
			
		</div>
		
		<div class="loginBox">
			
			<c:choose>
				<c:when test="${not empty loggedInUser}">
					<c:choose>
						<c:when test="${userRole == 0}">
					        <div style="display: inline-block; padding-left: 30px; position: relative; top: 23px; right: 145px;">환영합니다, <span style="color: #39B5E0">${loggedInUser.nickname}</span>님!</div>
					        <a href="<c:url value='/logout' />" class="login_join_text" style="position: relative; bottom: 25px;">
								<div style="display: inline-block; padding-left: 30px;" onclick="logout()">
									로그아웃
								</div>
							</a>
							<a href="javascript:void(0)" class="login_join_text" data-bs-toggle="modal" data-bs-target="#exampleModal2" style="position: relative; bottom: 24px;">
								<div style="display: inline-block; padding-left: 30px;">
									회원 정보 수정
								</div>
							</a>
						</c:when>
						<c:when test="${userRole == 1}">
							<div style="display: inline-block; padding-left: 30px; position: relative; top: 23px; right: 145px;">환영합니다, 관리자님!</div>
					        <a href="javascript:void(0)" class="login_join_text" onclick="logout()" style="position: relative; bottom: 25px;">
								<div style="display: inline-block; padding-left: 30px;">
									로그아웃
								</div>
							</a>
							<a href="<c:url value='/a/users'/>" class="login_join_text"  style="position: relative; bottom: 24px;">
								<div style="display: inline-block; padding-left: 30px;">
									회원 관리
								</div>
							</a>
						</c:when>
					</c:choose>
			    </c:when>
			    <c:otherwise>
			    	<a href="javascript:void(0)" class="login_join_text" data-bs-toggle="modal" data-bs-target="#exampleModalToggle">
						<div style="display: inline-block;">
							로그인
						</div>
					</a>
					<a href="javascript:void(0)" class="login_join_text" data-bs-toggle="modal" data-bs-target="#exampleModal">
						<div style="display: inline-block; padding-left: 30px;">
							회원가입
						</div>
					</a>	
			    </c:otherwise>
			</c:choose>
			
		</div>
		
	</div>
</div>



<div class="Main_div">
	
	<div style="position: relative; float: right; right: 240px; top: 35px; font-family: 'TheJamsil5Bold';">
		<c:choose>
			<c:when test="${not empty loggedInUser}">
				<c:choose>
					<c:when test="${userRole == 0}">
						<div style="display: inline-block;">환영합니다, <span style="color: #39B5E0">${loggedInUser.nickname}</span>님!</div>
						<a href="javascript:void(0)" class="header_login">	
							<div style="display:inline-block; margin-right: 30px; margin-left: 30px" onclick="logout()">로그아웃</div>
						</a>
						<a href="javascript:void(0)" class="header_login" data-bs-toggle="modal" data-bs-target="#exampleModal2">
							<div style="display:inline-block;">회원 정보 수정</div>
						</a>
					</c:when>
					<c:when test="${userRole == 1}">
						<div style="display: inline-block;">환영합니다, 관리자님!</div>
						<a href="javascript:void(0)" class="header_login">	
							<div style="display:inline-block; margin-right: 30px; margin-left: 30px" onclick="logout()">로그아웃</div>
						</a>
						<a href="<c:url value='/a/users'/>" class="header_login">
							<div style="display:inline-block;">회원 관리</div>
						</a>
					</c:when>
				</c:choose>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0)" class="header_login" data-bs-toggle="modal" data-bs-target="#exampleModalToggle">	
					<div style="display:inline-block; margin-right: 30px;">로그인</div>
				</a>		
				<a href="javascript:void(0)" class="header_login" data-bs-toggle="modal" data-bs-target="#exampleModal">
					<div style="display:inline-block;">회원가입</div>
				</a>
			</c:otherwise>
		</c:choose>
	</div>
	
	<!-- Modal 로그인 -->
	<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">에어 두드림 로그인</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form action="<c:url value='/login' />" method="post" id="loginfrm">
		      <div class="modal-body">
		      	<div class="mb-3 ms-1 me-1 row">
			    	<label for="id" class="col-sm-3 col-form-label">아이디</label>
				      <div class="col-sm-9">
				    	<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요">
				  	  </div>
				</div>
				<div class="mb-3 ms-1 me-1 row">
				    <label for="pw" class="col-sm-3 col-form-label">비밀번호</label>
					  <div class="col-sm-9">
					    <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력하세요">
					  </div>
				 </div>
			      <div class="row mb-3" >
					  <div class="col-auto position-absolute end-0">
					    <a href="#exampleModalToggle2" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal"
					    style="font-size: 15px; color: #8181818;">비밀번호를 잊으셨나요?</a>
					  </div>
			      </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="submit" class="btn btn-primary" id="submitbtn" disabled>로그인</button>
		      </div>
	      </form>
	    </div>
	  </div>
	</div>
	
	<!-- 회원정보 확인 -->
	<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">회원 정보 확인</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form action="<c:url value='/findUser'/>" method="post" id="checkInfofrm">
		      <div class="modal-body">
		        <div class="mb-3 ms-1 me-1 row">
			    	<label for="nickname" class="col-sm-3 col-form-label">닉네임</label>
				      <div class="col-sm-9">
				    	<input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력하세요">
				  	  </div>
				</div>
				<div class="mb-3 ms-1 me-1 row">
				    <label for="id" class="col-sm-3 col-form-label">아이디</label>
					  <div class="col-sm-9">
					    <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요">
					  </div>
				 </div>
			  </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">로그인으로 돌아가기</button>
		        <button type="button" class="btn btn-primary" id="infoCheckBtn" disabled>회원 정보 조회</button>
		      </div>
	      </form>
	    </div>
	  </div>
	</div>
	
	<!-- 비밀번호 변경 -->
	<div class="modal fade" id="exampleModalToggle3" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1" style="text-align: left;">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">비밀번호 변경</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form action="<c:url value='/modifyPw'/>" method="post" id="modifyPwfrm">
		      <div class="modal-body">
		        <div class="col-auto mb-3">
			    <label for="pw" class="form-label">비밀번호 <span style="font-size: small; color: #818181">6~12자의 영문 대소문자와 숫자 조합</span></label>
			    <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력하세요">
			  </div>
			  <div class="col-auto mb-3">
			    <label for="pwValid" class="form-label">비밀번호 확인</label>
			    <input type="password" class="form-control" id="pwValid" placeholder="비밀번호를 입력하세요">
			    <div class="checkPw"></div>
			  </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="submit" class="btn btn-primary" id="submitbtn" disabled>변경 완료</button>
		      </div>
	      </form>
	    </div>
	  </div>
	</div>
	
	<!-- Modal 회원가입 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="text-align: left;">
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">에어 두드림 회원 가입</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form action="<c:url value='/join' />" method="post" id="joinfrm">
		      <div class="modal-body">
		      	  <div class="col-10 mb-3">
				    <label for="nickname" class="form-label">닉네임</label>
				    <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력하세요">
				    <div class="checkNickname"></div>
				  </div>
			      <div class="col-10 mb-3">
				    <label for="id" class="form-label">아이디 <span style="font-size: small; color: #818181">4~8자의 영문 소문자와 숫자 조합</span></label>
				    <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요">
				    <div class="checkId"></div>
				  </div>
				  <div class="col-10 mb-3">
				    <label for="pw" class="form-label">비밀번호 <span style="font-size: small; color: #818181">6~12자의 영문 대소문자와 숫자 조합</span></label>
				    <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력하세요">
				  </div>
				  <div class="col-10 mb-3">
				    <label for="pwValid" class="form-label">비밀번호 확인</label>
				    <input type="password" class="form-control" id="pwValid" placeholder="비밀번호를 입력하세요">
				    <div class="checkPw"></div>
				  </div>
				  <div class="col-10 mb-3">
				    <label for="sample5_address" class="form-label">주소</label>
				    <input type="text" class="form-control" id="sample5_address" name="address" placeholder="주소를 입력하세요" onclick="sample5_execDaumPostcode()">
				    <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
				  </div>
				  <div class="col-10">
				    <div class="form-check">
				      <input class="form-check-input" type="checkbox" id="gridCheck">
				      <label class="form-check-label" for="gridCheck">
				        개인정보 제공에 동의합니다.
				      </label>
				    </div>
				  </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="submit" class="btn btn-primary" id="submitbtn" disabled>가입 완료</button>
		      </div>
	      </form>
	    </div>
	  </div>
	</div>
	
	<!-- Modal 회원 정보 수정  -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="text-align: left;">
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">에어 두드림 회원 정보 수정</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form action="<c:url value='/editProfile' />" method="post" id="editfrm">
		      <div class="modal-body">
		      	<div class="mb-2 ms-1 me-1 row">
				    <label for="nickname" class="col-sm-2 col-form-label">닉네임</label>
				    <div class="col-sm-9">
				    	<input type="text" readonly style="font-weight: 700;" class="form-control-plaintext" id="nickname" name="nickname" value="${loggedInUser.nickname}">
				    </div>
				</div>
		      	<div class="mb-2 ms-1 m-1 row">
			    	<label for="id" class="col-sm-2 col-form-label">아이디</label>
				    <div class="col-sm-9">
				    	<input type="text" readonly style="font-weight: 700;" class="form-control-plaintext" id="id" name="id" value="${loggedInUser.id}">
				  	</div>
				</div>
				<div class="mb-2 ms-1 me-1">
				    <label for="sample5_address" class="form-label">주소</label>
				    <div class="col-auto">
					    <input type="text" class="form-control" id="address" name="address" value="${loggedInUser.address}"
					     onclick="execDaumPostcode()">
				    </div>
				    <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
				 </div>
				 <div class="row mb-3" >
					  <div class="col-auto position-absolute end-0">
					    <a href="#exampleModalToggle2" data-bs-target="#exampleModalToggle3" data-bs-toggle="modal"
					    style="font-size: 15px; color: #8181818;">비밀번호 변경하러 가기</a>
					  </div>
					  <div class="col-auto position-absolute end-5">
					    <a href="javascript:void(0)" id="deleteUser" class="link-opacity-25">회원 탈퇴하기</a>
					  </div>
			      </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary" id="submitbtn" disabled>변경완료</button>
		      </div>
	      </form>
	    </div>
	  </div>
	</div>
	
	
	<!-- 타이틀 드럼 이미지 -->
	<diV style="margin-top: 70px;">
	
	<div class="title_img_div2_1">
		<video src="<c:url value="/resources/img/Title_img/title_img.mp4"/>" class="title_img4_1" autoplay="autoplay" loop muted></video>
	</div>
	<div class="title_img_div2_2">
		<video src="<c:url value="/resources/img/Title_img/title_img.mp4"/>" class="title_img4_2" autoplay="autoplay" loop muted style="position: relative; right: 71px;"></video>
	</div>
	<div class="title_img_div2_3">
		<video src="<c:url value="/resources/img/Title_img/title_img.mp4"/>" class="title_img4_3" autoplay="autoplay" loop muted style="position: relative; right: 24px;"></video>
	</div>
	<div class="title_img_div2_4">
		<video src="<c:url value="/resources/img/Title_img/title_img.mp4"/>" class="title_img4_4" autoplay="autoplay" loop muted></video>
	</div>
	<div class="title_img_div2_5">
		<video src="<c:url value="/resources/img/Title_img/title_img.mp4"/>" class="title_img4_5" autoplay="autoplay" loop muted></video>
	</div>
	
	</div>	
	
	<!-- 타이틀 버스 이미지 -->
	<div class="title_img_div">
		<video src="<c:url value="/resources/img/Title_img/name_bus.mp4"/>" class="title_img" autoplay="autoplay" loop muted></video>
	</div>
	
	<!-- 타이틀 기차 이미지 -->
	<div class="title_img_div">
		<video src="<c:url value="/resources/img/Title_img/name_train.mp4"/>" class="title_img2" autoplay="autoplay" loop muted></video>
	</div>
	
	<!-- 타이틀 비행기 이미지 -->
	<div class="title_img_div">
		<video src="<c:url value="/resources/img/Title_img/name_air.mp4"/>" class="title_img3" autoplay="autoplay" loop muted></video>
	</div>
	
	<a href="<c:url value='/'/>" style="text-decoration: none">
		<div class="hidden_img">
			<div class="Main_title">Air.
				<span class="span_name">두드림</span>
			</div>
		</div>
	</a>
	
	<!-- 태그 -->
	<div style="position: relative; z-index: 1;">
	
		<div style="display: inline-block;">
			<div class="transportation_tag">
				<video class="tag_img" src="<c:url value="/resources/img/tag_img/air.mp4"/>"></video>
				<video class="tag_video" src="<c:url value="/resources/img/tag_img/air.mp4"/>" autoplay="autoplay" loop muted></video>
				<div class="tag_name">항공</div>
			</div>
		</div>
		
		<a href="#" style="color: black; text-decoration: none;">
			<div class="transportation_tag2">
				<video class="tag_img2" src="<c:url value="/resources/img/tag_img/train.mp4"/>"></video>
				<video class="tag_video2" src="<c:url value="/resources/img/tag_img/train.mp4"/>" autoplay="autoplay" loop muted></video>
				
				<div class="tag_name">열차</div>
			</div>
		</a>
		
		<div class="transportation_tag3">
			<video class="tag_img3" src="<c:url value="/resources/img/tag_img/bus.mp4"/>"></video>
			<video class="tag_video3" src="<c:url value="/resources/img/tag_img/bus.mp4"/>" autoplay="autoplay" loop muted></video>
			<div class="tag_name">버스</div>
		</div>
		
		<a href="<c:url value="/lodging.do"/>" style="color: black; text-decoration: none;">
			<div class="transportation_tag4">
				<video class="tag_img4" src="<c:url value="/resources/img/tag_img/hotel.mp4"/>"></video>
				<video class="tag_video4" src="<c:url value="/resources/img/tag_img/hotel.mp4"/>" autoplay="autoplay" loop muted></video>
				<div class="tag_name">숙소</div>
			</div>
		</a>
		
		<!-- 버스 태그 -->
		<div style="height: 35px; position: relative; z-index: -2;">
			<a href="<c:url value="#"/>" style="visibility: hidden;">
				<div class="AirportBus">
					<div class="AirportBus_border"></div>
					<div class="AirportBus_background">
						<video class="AirportBus_img" src="<c:url value="/resources/img/tag_img/AirportBus.mp4"/>"></video>
						<video class="AirportBus_video" src="<c:url value="/resources/img/tag_img/AirportBus.mp4"/>"autoplay="autoplay" loop muted></video>
						<div class="AirportBus_tag">공항버스</div>
					</div>
				</div>
			</a>
			
			<a href="<c:url value="#"/>" style="visibility: hidden;">	
				<div class="IntercityBus">
					<div class="IntercityBus_border"></div>
					<div class="IntercityBus_background">
						<video class="IntercityBus_img" src="<c:url value="/resources/img/tag_img/IntercityBus.mp4"/>"></video>
						<video class="IntercityBus_video" src="<c:url value="/resources/img/tag_img/IntercityBus.mp4"/>"autoplay="autoplay" loop muted></video>
						<div class="IntercityBus_tag">고속,시외버스</div>
					</div>
				</div>
			</a>
		</div>
		
		<!-- 공항 태그 -->
		
		<div style="position: relative; bottom: 72px; right: 195px; z-index: -1; height: 1px;">
				
			<a href='<c:url value="/air/flight-schedule"/>' style="color: black; text-decoration: none; display: inline-block; visibility: hidden;">
				<div class="Flight_schedule_Tag">
					<div class="Flight_schedule_Tag_border"></div>
					<div class="Flight_schedule_Tag_background">
						<video class="Flight_schedule_img" src="<c:url value="/resources/img/tag_img/Flight_schedule.mp4"/>"></video>
						<video class="Flight_schedule_video" src="<c:url value="/resources/img/tag_img/Flight_schedule.mp4"/>"autoplay="autoplay" loop muted></video>
						<div class="Flight_schedule_Text">운항스케줄</div>
					</div>
				</div>
			</a>
			
			<a href='<c:url value='/airport.do'/>' style="color: black; text-decoration: none; display: inline-block; visibility: hidden;">
				<div class="RealTime_Flight_schedule_Tag">
					<div class="RealTime_Flight_schedule_Tag_border"></div>
					<div class="RealTime_Flight_schedule_Tag_background">
						<video class="RealTime_Flight_schedule_img" src="<c:url value="/resources/img/tag_img/RealTime_Flight_schedule.mp4"/>"></video>
						<video class="RealTime_Flight_schedule_video" src="<c:url value="/resources/img/tag_img/RealTime_Flight_schedule.mp4"/>"autoplay="autoplay" loop muted></video>
						<div class="RealTime_Flight_schedule_Text">실시간 운항스케줄</div>
					</div>
				</div>
			</a>
		</div>
		
	</div>
</div>
	
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};

//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
    position: new daum.maps.LatLng(37.537187, 127.005476),
    map: map
});


function sample5_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.address; // 최종 주소 변수

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("sample5_address").value = addr;
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(addr, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.y, result.x);
                    // 지도를 보여준다.
                    mapContainer.style.display = "block";
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords)
                }
            });
        }
    }).open();
}

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.address; // 최종 주소 변수

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("address").value = addr;
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(addr, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.y, result.x);
                    // 지도를 보여준다.
                    mapContainer.style.display = "block";
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords)
                }
            });
        }
    }).open();
}


/*로그인*/
function toggleLoginButton() {
    const id = $("#loginfrm #id").val().trim();
    const pw = $("#loginfrm #pw").val().trim();
    $("#loginfrm #submitbtn").prop("disabled", id === "" || pw === "");
}

$("#id, #pw").on("input", function() {
    toggleLoginButton();
});

toggleLoginButton();


$('#loginfrm').submit(function(event) {
    event.preventDefault(); 
    $.ajax({
        type: 'POST',
        url: $(this).attr('action'),
        data: $(this).serialize(),
        success: function(response) {
            if (response.success) {
                // 성공 시
                // 페이지 새로 고침 또는 다른 작업
                $("#loginfrm #id").val("");
                $("#loginfrm #pw").val("");
                location.reload();
            } else {
                // 실패 시
                alert(response.error);
                $("#loginfrm #id").val("");
                $("#loginfrm #pw").val("");
            }
        },
        error: function() {
            alert("로그인 중 오류가 발생했습니다.");
            $("#loginfrm #id").val("");
            $("#loginfrm #pw").val("");
        }
    });
});



/*회원정보 조회*/
let userId;

	function toggleInfoButton() {
   const nickname = $("#checkInfofrm #nickname").val().trim();
   const id = $("#checkInfofrm #id").val().trim();
   $("#infoCheckBtn").prop("disabled", nickname === "" || id === "");
}

$("#checkInfofrm #nickname, #checkInfofrm #id").on("input", function() {
	console.log("Input event triggered");
	toggleInfoButton();
});

toggleInfoButton();

$('#infoCheckBtn').click(function() {
    $.ajax({
        type: "POST",
        url: $("#checkInfofrm").attr('action'), 
        data: $("#checkInfofrm").serialize(),
        success: function(response) {
            if (response.success) {
            	userId = $("#checkInfofrm #id").val().trim();
            	$("#checkInfofrm #nickname, #checkInfofrm #id").val("");
            	$('#exampleModalToggle2').modal("hide");
                $('#exampleModalToggle3').modal("show");
            } else {
                alert('회원정보 조회에 실패했습니다. 권한이 없거나 잘못된 정보를 입력하셨습니다.');
                $("#checkInfofrm #nickname, #checkInfofrm #id").val("");
                $('#exampleModalToggle2').modal("hide");
                $('#exampleModalToggle').modal("show");
            }
        },
        error: function() {
            alert('서버와의 통신에 실패했습니다.');
            $("#checkInfofrm #nickname, #checkInfofrm #id").val("");
        }
    });
});


/*비밀번호 변경*/
function comparePasswords() {
    const pw = $("#modifyPwfrm #pw").val().trim();
    const pwValid = $("#modifyPwfrm #pwValid").val().trim();

    if (pw === pwValid && pwValid !== "") {
        $(".checkPw").text("비밀번호가 일치합니다").css("color", "#169b4d");
        $("#modifyPwfrm #submitbtn").prop("disabled", false);
    } else {
        $(".checkPw").text("비밀번호가 일치하지 않습니다").css("color", "#9b1616");
        $("#modifyPwfrm #pwValid").val("").focus();
        $("#modifyPwfrm #submitbtn").prop("disabled", true); 
    }
}

$("#modifyPwfrm #pw, #modifyPwfrm #pwValid").on("input", function() {
    togglePwButton();
});

$("#modifyPwfrm #pwValid").on("blur", function() {
    comparePasswords();
});

function togglePwButton() {
    const pw = $("#modifyPwfrm #pw").val().trim();
    $("#modifyPwfrm #submitbtn").prop("disabled", pw === "");
}

togglePwButton();

$('#modifyPwfrm').submit(function(event) {
    event.preventDefault(); 
    
    const pw = $("#modifyPwfrm #pw").val().trim();
    const pwValid = $("#modifyPwfrm #pwValid").val().trim();

    const pwCheck = /^(?=.*[0-9])[A-Za-z][A-Za-z0-9]{5,11}$/;
    
    if (!pwCheck.test(pw)) { 
        alert("비밀번호는 6자 이상 12자 이하의 영문 소문자와 숫자 조합입니다");
        $("#modifyPwfrm #pw").val(""); 
        $("#modifyPwfrm #pw").focus();
        return false;
    }

    $.ajax({
        type: 'POST',
        url: $(this).attr('action'),
        data: {
            id: userId,
            pw: pw
        },
        success: function(response) {
            if (response.success) {
                alert("비밀번호 변경 완료! 로그인 해주시기 바랍니다.");
                $("#modifyPwfrm #pw, #modifyPwfrm #pwValid").val("");
                $('#exampleModalToggle3').modal("hide");
                
                $.ajax({
                	type: "POST",
                	url: "<c:url value='/checkLoginStatus' />",
                	success: function(statusResponse){
                		if (statusResponse.isLoggedIn) {
                            $.post('<c:url value="/logout"/>', function() {
                            	window.location.href = '<c:url value="/" />';
                            });
                        } else {
                        	$('#exampleModalToggle').modal("show");
                        }
                	}
                });
                
            } else {
                alert(response.error);
                $("#modifyPwfrm #pw").val("");
                $("#modifyPwfrm #pwValid").val("");
                $('#exampleModalToggle3').modal("hide");
            }
        },
        error: function() {
            alert("서버와의 통신에 실패했습니다.");
            $("#modifyPwfrm #pw").val("");
            $("#modifyPwfrm #pwValid").val("");
        }
    });
});


/*회원 정보 수정(주소 변경)*/
function toggleEditInfoButton() {
   const address = $("#editfrm #address").val().trim();
   $("#editfrm #submitbtn").prop("disabled", address === "");
}

$("#editfrm #address").on("input", function() {
	console.log("Input event triggered");
	toggleEditInfoButton();
});

toggleEditInfoButton();

$("#editfrm").submit(function() {
	
	event.preventDefault();
	
    let id = $("#editfrm #id");
    let address = $("#editfrm #address");
    
    if (address.val().trim() == "") {
        alert("주소는 필수 입력입니다");
        address.val("");
        address.focus();
        return false;
    }
    
    $.ajax({
        type: 'POST',
        url: $(this).attr('action'), 
        data: $(this).serialize(), 
        success: function(response) {
            if (response.success) {
                alert("주소 변경 완료!");
                $('#exampleModal2').modal('hide'); 
                location.reload(); 
            } else {
                alert(response.error); 
            }
        },
        error: function() {
            alert("회원가입 중 오류가 발생했습니다.");
        }
    });;
});



/*회원가입*/
$("input:checkbox[id='gridCheck']").change(function() {
    if ($(this).is(":checked")) {
        $("#joinfrm .btn-primary").removeAttr("disabled");
    } else {
        $("#joinfrm .btn-primary").attr("disabled", "disabled");
    }
});


$("#joinfrm").submit(function() {
	
	event.preventDefault();
	
    let id = $("#joinfrm #id");
    let pw = $("#joinfrm #pw");
    let pwValid = $("#joinfrm #pwValid");
    let address = $("#joinfrm #sample5_address");
    
    const expIdText = /^(?=.*[0-9])[a-z][a-z0-9]{3,7}$/;
    const pwCheck = /^(?=.*[0-9])[A-Za-z][A-Za-z0-9]{5,11}$/;
    
    if (id.val().trim() == "") {
        alert("아이디는 필수 입력입니다");
        id.val("");
        id.focus();
        return false;
    }
    if (!expIdText.test(id.val())) {
        alert("아이디는 4자 이상 8자 이하의 영문 소문자 조합입니다");
        id.val("");
        id.focus();
        return false;
    }
    
    if (pw.val().trim() == "") {
        alert("비밀번호는 필수 입력입니다");
        pw.val("");
        pw.focus();
        return false;
    }
    if (!pwCheck.test(pw.val())) {
        alert("비밀번호는 6자 이상 12자 이하의 영문 소문자와 숫자 조합입니다");
        pw.val("");
        pw.focus();
        return false;
    }
    
    if (pwValid.val().trim() == "") {
        alert("비밀번호 확인은 필수 입력입니다");
        pwValid.val("");
        pwValid.focus();
        return false;
    }
    
    if (address.val().trim() == "") {
        alert("주소는 필수 입력입니다");
        address.val("");
        address.focus();
        return false;
    }
    
    if (pw.val().trim() != pwValid.val().trim()) {
        alert("비밀번호가 일치하지 않습니다.");
        pwValid.val("");
        pwValid.focus();
        return false;
    }
    
    $.ajax({
        type: 'POST',
        url: $(this).attr('action'), 
        data: $(this).serialize(), 
        success: function(response) {
            if (response.success) {
                alert("회원가입 성공");
                id.val("");
                pw.val("");
                pwValid.val("");
                address.val("");
                $('#exampleModal').modal('hide'); 
                location.reload();
            } else {
                alert(response.error);
                id.val("");
                pw.val("");
                pwValid.val("");
                address.val("");
            }
        },
        error: function() {
            alert("회원가입 중 오류가 발생했습니다.");
            id.val("");
            pw.val("");
            pwValid.val("");
            address.val("");
        }
    });;
});


var timeout = null
$('#joinfrm #id').on('keyup', function() {
        var text = this.value
        clearTimeout(timeout)
        timeout = setTimeout(function() {  
            let id = $("#joinfrm #id").val();
        	
        	$.ajax({
        		url :"<c:url value='/idCheck'/>",
        		type : "post",
        		data : {"id" : id},
        		success : function(responseData) {
        			
        			if(responseData.result == "success") {
        				$(".checkId").text("사용 가능한 아이디입니다").css("color", "#169b4d");
        				
        			}else {
        				$(".checkId").text("이미 사용 중인 아이디입니다").css("color", "#9b1616");
        				$(this).val("");
        			}
        		}
        	})
        }, 200)
    })
    
    $('#joinfrm #nickname').on('keyup', function() {
        var text = this.value
        clearTimeout(timeout)
        timeout = setTimeout(function() {  
            let nickname = $("#joinfrm #nickname").val();
        	
        	$.ajax({
        		url :"<c:url value='/nicknameCheck'/>",
        		type : "post",
        		data : {"nickname" : nickname},
        		success : function(responseData) {
        			
        			if(responseData.result == "success") {
        				$(".checkNickname").text("사용 가능한 닉네임입니다").css("color", "#169b4d");
        				
        			}else {
        				$(".checkNickname").text("이미 사용 중인 닉네임입니다").css("color", "#9b1616");
        				$(this).val("");
        			}
        		}
        	})
        }, 200)
    })
  

    /*로그아웃*/
    function logout() {
	    fetch('<c:url value="/logout" />', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json'
	        }
	    })
	    .then(response => response.json())
	    .then(data => {
	        if (data.success) {
	            alert(data.message); 
	            window.location.href = '<c:url value="/" />'; 
	        } else {
	            alert("로그아웃 실패");
	        }
	    })
	    .catch(error => {
	        console.error('Error:', error);
	        alert("로그아웃 중 오류 발생");
	    });
	}


/*회원 탈퇴*/
 $('#deleteUser').click(function(event) {
    event.preventDefault(); // 기본 링크 동작 방지
    
    if (confirm("정말로 회원 탈퇴하시겠습니까?")) {
        $.ajax({
            type: 'POST',
            url: '<c:url value="/delete"/>',
            success: function(response) {
                if (response.success) {
                    alert("회원 탈퇴가 완료되었습니다.");
                    window.location.href = "<c:url value="/" />"; 
                } else {
                    alert(response.error);
                }
            },
            error: function() {
                alert("서버와의 통신에 실패했습니다.");
            }
        });
    }
});

</script>	
	
	