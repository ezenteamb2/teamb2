<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="<c:url value='/resources/css/boardingPass.css'/>" rel="stylesheet">
		<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
		<link href="https://fonts.cdnfonts.com/css/noto-sans-thaana" rel="stylesheet">
		<title>flight ticket</title>
	</head>
	<body>
		<div class="container">
			<div class="ticket">
				<div class="ticket-left">
					<div class="ticket-left-top">
						<i class='bx bxs-plane-alt'></i>
						<span>BOARDING PASS</span>
					</div>
					<div class="ticket-left-content">
						<div class="passenger">
							PASSENGER NAME <br>
							<span>AIR DODREAM, KIM</span>						
						</div>
						<div class="from">
							FROM <br>
							<span>ICN/SEOUL</span>
						</div>
						<div class="to">
							TO <br>
							<span>ORD/CHICAGO</span>
						</div>
						<div class="date">
							DATE <br>
							<span>02AUG24</span>
						</div>
						<div class="dep">
							DEPARTURE TIME <br>
							<span>20:30</span>
						</div>
					</div>
					<div class="ticket-left-bottom">
						<div class="flight">
							FLIGHT <br>
							<span>AD 123</span>
						</div>
						<div class="boarding">
							BAORDING TIME <br>
							<span>20:00</span>
						</div>
						<div class="gate">
							GATE <br>
							<span>11</span>
						</div>
						<div class="seat">
							SEAT <br>
							<span>15A</span>
						</div>
					</div>
					<div class="ticket-left-bottom-line">
						
					</div>
				</div>
				<div class="ticket-right">
					<div class="ticket-right-top">
						<span>BOARDING PASS</span>
					</div>
					<div class="ticket-right-content">
						<div class="passenger">
							PASSENGER NAME <br>
							<span>AIR DODREAM, KIM</span>						
						</div>
						<div class="from">
							FROM <br>
							<span>ICN/SEOUL</span>
						</div>
						<div class="to">
							TO <br>
							<span>ORD/CHICAGO</span>
						</div>
						<div class="date">
							DATE <br>
							<span>02AUG24</span>
						</div>
					</div>
					<div class="ticket-right-bottom">
						<div class="flight">
							FLIGHT <br>
							<span>AD 123</span>
						</div>
						<div class="seat">
							SEAT <br>
							<span>15A</span>
						</div>
					</div>
					<div class="ticket-right-bottom-line">
					
					</div>
				</div>
			</div>
		</div>
		
		<div class="api-result">
			
		</div>
	</body>
</html>