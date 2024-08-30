<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<c:url value="/resources/css/header.css"/>">

<!-- 자바스크립트 -->
<script src="<c:url value="/resources/js/jquery-3.7.1.min.js"/>"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
	
</script>

<body>
<div class="header_hidden_div">
	<div class="header_hidden_sDiv">
		
		<a href="<c:url value='/'/>" style="text-decoration: none; z-index:10;">
			<div class="Main_title" style="position: absolute; bottom: 5px; padding-left: 75px;">Air.
				<span class="span_name">두드림</span>
			</div>
		</a>
		
		<div class="header_hidden_tagDiv">
		
			<a href='<c:url value="/air/flight-schedule"/>' style="color: black; text-decoration: none;">
				<div class="hidden_tag">
					<img src="<c:url value="/resources/img/Title_img/hidden_title_img.png"/>" class="hidden_title_img">
					항공
				</div>
			</a>
			
			<a href="#" style="color: black; text-decoration: none;">
				<div class="hidden_tag">
					<img src="<c:url value="/resources/img/Title_img/hidden_title_img2.png"/>" class="hidden_title_img">
					열차
				</div>
			</a>
			
			<a href="<c:url value="/airbus/bus.do"/>" style="color: black; text-decoration: none;">
				<div class="hidden_tag">
					<img src="<c:url value="/resources/img/Title_img/hidden_title_img3.png"/>" class="hidden_title_img">
					버스
				</div>
			</a>
				
			<a href="<c:url value="/lodging.do"/>" style="color: black; text-decoration: none;">
				<div class="hidden_tag">
					<img src="<c:url value="/resources/img/Title_img/hidden_title_img4.png"/>" class="hidden_title_img">
					숙소
				</div>
			</a>
				
		</div>
		
		<div class="loginBox">
			<a href="#" class="login_join_text">
				<div style="display: inline-block;">
					로그인
				</div>
			</a>
			<a href="#" class="login_join_text">
				<div style="display: inline-block; padding-left: 30px;">
					회원가입
				</div>
			</a>
		</div>
		
	</div>
</div>



<div class="Main_div">
	
	<div style="position: relative; float: right; right: 50px; font-family: 'TheJamsil5Bold';">
		<a href="#" class="header_login">	
			<div style="display:inline-block; margin-right: 30px;">로그인</div>
		</a>
		<a href="#" class="header_login">
			<div style="display:inline-block;">회원가입</div>
		</a>
	</div>
	
	<!-- 타이틀 드럼 이미지 -->
	<diV>
	
	<div class="title_img_div2_1">
		<video src="<c:url value="/resources/img/Title_img/title_img.mp4"/>" class="title_img4_1" autoplay="autoplay" loop muted></video>
	</div>
	<div class="title_img_div2_2">
		<video src="<c:url value="/resources/img/Title_img/title_img.mp4"/>" class="title_img4_2" autoplay="autoplay" loop muted></video>
	</div>
	<div class="title_img_div2_3">
		<video src="<c:url value="/resources/img/Title_img/title_img.mp4"/>" class="title_img4_3" autoplay="autoplay" loop muted></video>
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
	<div>
	
		<a  href='<c:url value="/air/flight-schedule"/>' style="color: black; text-decoration: none;">
			<div class="transportation_tag">
				<video class="tag_img" src="<c:url value="/resources/img/tag_img/air.mp4"/>"></video>
				<video class="tag_video" src="<c:url value="/resources/img/tag_img/air.mp4"/>" autoplay="autoplay" loop muted></video>
				<div class="tag_name">항공</div>
			</div>
		</a>
		
		<a href="#" style="color: black; text-decoration: none;">
			<div class="transportation_tag2">
				<video class="tag_img2" src="<c:url value="/resources/img/tag_img/train.mp4"/>"></video>
				<video class="tag_video2" src="<c:url value="/resources/img/tag_img/train.mp4"/>" autoplay="autoplay" loop muted></video>
				
				<div class="tag_name">열차</div>
			</div>
		</a>
		
		<a href="<c:url value="/airbus/bus.do"/>" style="color: black; text-decoration: none;">
			<div class="transportation_tag3">
				<video class="tag_img3" src="<c:url value="/resources/img/tag_img/bus.mp4"/>"></video>
				<video class="tag_video3" src="<c:url value="/resources/img/tag_img/bus.mp4"/>" autoplay="autoplay" loop muted></video>
				<div class="tag_name">버스</div>
			</div>
		</a>
		
		<a href="<c:url value="/lodging.do"/>" style="color: black; text-decoration: none;">
			<div class="transportation_tag4">
				<video class="tag_img4" src="<c:url value="/resources/img/tag_img/hotel.mp4"/>"></video>
				<video class="tag_video4" src="<c:url value="/resources/img/tag_img/hotel.mp4"/>" autoplay="autoplay" loop muted></video>
				<div class="tag_name">숙소</div>
			</div>
		</a>
		
	</div>
</div>
	
	